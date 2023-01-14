import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker_platform_interface/src/types/image_source.dart';
import 'package:pattohou/data/common.dart';

import '../../models/local/utils/image_local.dart';

final logoStatusProvider = StateNotifierProvider<LogoStatusNotifier, LogoStatus>((ref) => LogoStatusNotifier(ref.read));

class LogoStatus {
  final File? file;

  const LogoStatus({this.file});

  LogoStatus copyWith({File? file}) {
    return LogoStatus(file: file);
  }
}

class LogoStatusNotifier extends StateNotifier<LogoStatus> {
  LogoStatusNotifier(this._read) : super(const LogoStatus(file: null));
  final Reader _read;

  writeImage({required ImageSource source}) async{
    await deleteImage();
    final file = await _read(imageLocalProvider).getImage(
      dirPath: "${ImageLocal.appDir}/logo",
      fileName:FileName.logo,
      source: source,
    );
    state = state.copyWith(file: file);
  }

  deleteImage()async{
    await _read(imageLocalProvider).deleteImage(state.file);
    state = state.copyWith(file: null);
  }

}

