part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
 final XFile? cameraImage;
 final XFile? galleryImage;
  ImagePickerState({this.cameraImage, this.galleryImage});

  ImagePickerState copyWith({XFile? cameraImage, XFile? galleryImage}) {
    return ImagePickerState(
     cameraImage:  cameraImage ?? this.cameraImage,
     galleryImage:  galleryImage ?? this.galleryImage,
    );
  }

  @override
  List<Object?> get props => [cameraImage, galleryImage];
}
