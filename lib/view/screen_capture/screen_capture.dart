import 'dart:io';

import 'package:bloc_operations/controller/Counter_bloc/counter_bloc.dart';
import 'package:bloc_operations/controller/Counter_bloc/counter_state.dart';
import 'package:bloc_operations/controller/image_picker/image_picker_bloc.dart';
import 'package:bloc_operations/untils/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCapture extends StatefulWidget {
  final CounterBloc counterBloc;
  const ScreenCapture({super.key, required this.counterBloc});

  @override
  State<ScreenCapture> createState() => _ScreenCaptureState();
}

class _ScreenCaptureState extends State<ScreenCapture> {
  late ImagePickerBloc _imagePickerBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imagePickerBloc = ImagePickerBloc(imagePickerUntils: ImagePickerUntils());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.counterBloc,
      child: Scaffold(
        appBar: AppBar(title: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            );
          },
        )),
        body: BlocProvider(
          create: (context) => _imagePickerBloc,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  return state.galleryImage == null
                      ? const SizedBox()
                      : Container(
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      File(state.galleryImage!.path)))),
                        );
                },
              ),
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context.read<ImagePickerBloc>().add(ImageGallery());
                      },
                      icon: const Icon(Icons.image));
                },
              ),
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  return state.cameraImage == null
                      ? const SizedBox()
                      : Container(
                          height: 100,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      File(state.cameraImage!.path)))),
                        );
                },
              ),
              BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        context.read<ImagePickerBloc>().add(ImageGallery());
                      },
                      icon: const Icon(Icons.camera));
                },
              )
            ],
          )),
        ),
      ),
    );
  }
}
