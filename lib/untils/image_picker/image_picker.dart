import 'package:image_picker/image_picker.dart';

class ImagePickerUntils {
  final ImagePicker imagePicker = ImagePicker();
  Future<XFile?> pickCameraImage() async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);

    return file;
  }

  Future<XFile?> pickGalleryImage() async {
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
