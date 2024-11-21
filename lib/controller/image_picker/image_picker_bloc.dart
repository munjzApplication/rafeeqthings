import 'package:bloc/bloc.dart';
import 'package:bloc_operations/untils/image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUntils imagePickerUntils;

  ImagePickerBloc({required this.imagePickerUntils})
      : super(ImagePickerState()) {
    on<ImageCampturing>(_pickCamera);
    on<ImageGallery>(_pickGallery);
  }

  void _pickCamera(
      ImageCampturing event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUntils.pickCameraImage();
    emit(state.copyWith(
      cameraImage: file,
    ));
  }

  void _pickGallery(ImageGallery event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUntils.pickGalleryImage();
    emit(state.copyWith(galleryImage: file));
  }
}
