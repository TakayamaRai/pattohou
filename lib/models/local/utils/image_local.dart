import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

final imageLocalProvider = Provider<ImageLocal>((ref) => ImageLocal(ref.read));

abstract class BaseImageRepository {
  // ImageSourceから写真の取得
  Future<File?> getImage({required String dirPath, required ImageSource source});
  // ローカルに保存されている写真の取得
  Future<List<File>> readImages({required String targetDir});
  // ファイルの書き込み
  Future<File> writeAsBytesSync({required String dirPath, required String fileName, required Uint8List buffer});
  // URLの画像をデバイスに保存してFile型に変換
  Future<File> toFile({required String url, required dirPath, required String fileName});
  // tmpDir：一時ファイル、appDir：アプリ専用フォルダ
  setAppDir();
  // 写真削除
  Future<void> deleteImage(File file);
  // .Heicを.jpgに変換
  Future<void> chkHeic(String filePath);
}

@override
class ImageLocal implements BaseImageRepository {
  final Reader read;
  const ImageLocal(this.read);

  static String _appDir = '';
  static String get appDir => _appDir;
  static String _tmpDir = '';
  static String get tmpDir => _tmpDir;

  @override
  Future<File?> getImage({
    required String dirPath,
    required ImageSource source,
    String? fileName,
  }) async {
    final xFile = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100,
      maxHeight: 2000,
      maxWidth: 2000,
    );
    if (xFile == null) return null;
    await chkHeic(xFile.path);
    // バッファに一時書き込み
    final Uint8List buffer = await xFile.readAsBytes();
    // バッファを指定のファイルに保存
    final File saveFile = await writeAsBytesSync(
      dirPath: dirPath,
      fileName: fileName ?? xFile.name,
      buffer: buffer,
    );
    //カメラ撮影はギャラリーに保存
    if (source == ImageSource.camera) {
      await ImageGallerySaver.saveImage(buffer, name: xFile.name);
    }
    return saveFile;
  }

  @override
  Future<List<File>> readImages({required String targetDir}) async {
    List<File> result = [];
    final dir = Directory(targetDir);
    // 指定したDirectoryがない => return
    if (!dir.existsSync()) return result;
    // DirectoryからList<File>を取得
    final fileSystemEntity = dir.list();
    final fileList = await fileSystemEntity.toList();
    // fileListが空 => return
    if (fileList.isEmpty) return result;
    for (FileSystemEntity entity in fileList) {
      File? currentFile;
      if (entity is File) currentFile = entity;
      if (currentFile != null) result.add(currentFile);
    }
    return result;
  }

  @override
  Future<File> writeAsBytesSync({
    required String dirPath,
    required String fileName,
    required Uint8List buffer,
  }) async {
    // 1.保存先のディレクトリ確認
    final Directory saveDir = Directory(dirPath);
    if (!await saveDir.exists()) {
      await saveDir.create(recursive: true);
    }
    // 2.ファイルを作成
    final String savePath = '${saveDir.path}/$fileName';
    final File saveFile = File(savePath);
    // 3.バッファをファイルに書き込み
    await saveFile.writeAsBytes(buffer);
    imageCache.clear();
    debugPrint("「$fileName」をローカルに書き込みました。 $saveFile");
    return saveFile;
  }

  @override
  Future<File> toFile({required String url, required dirPath, required String fileName}) async {
    HttpClientRequest request = await HttpClient().getUrl(Uri.parse(url));
    HttpClientResponse response = await request.close();

    final buffer = await consolidateHttpClientResponseBytes(response);

    final saveFile = await writeAsBytesSync(
      dirPath: dirPath,
      fileName: fileName,
      buffer: buffer,
    );
    imageCache.clear();
    return saveFile;
  }

  @override
  setAppDir() async {
    _appDir = (await getApplicationDocumentsDirectory()).path;
    _tmpDir = (await getTemporaryDirectory()).path;
  }

  @override
  Future<void> deleteImage(File? file) async {
    if(file == null) return;
    if (!await file.exists()) return;
    await file.delete();
  }

  @override
  Future<void> chkHeic(String filePath) async {
    final extension = filePath.split('.').last;
    if (extension != "heic") return;
    await HeicToJpg.convert(filePath, jpgPath: filePath);
  }

}
