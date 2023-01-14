import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageBottomSheet {
  Future<ImageSource?> show(BuildContext context) async {
    //ボトムシートから受け取った値によって操作を変える
    return await showCupertinoModalPopup<ImageSource?>(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            message: const Text('写真をアップロードしますか？'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: const Text('カメラで撮影'),
                onPressed: () {
                  Navigator.pop(context, ImageSource.camera);
                },
              ),
              CupertinoActionSheetAction(
                child: const Text('アルバムから選択'),
                onPressed: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              child: const Text('戻る'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
        });
  }
}
