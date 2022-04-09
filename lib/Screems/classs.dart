import 'package:image_picker/image_picker.dart';

class usana{


  Future Imgafromcamera() async {
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source: ImageSource.camera).then((value) {
      if (value != null);
    });
  }



}

