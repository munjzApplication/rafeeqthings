import 'dart:io';

import 'package:bloc_operations/controller/image_picker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCapture extends StatelessWidget {
  const ScreenCapture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
                              image:
                                  FileImage(File(state.galleryImage!.path)))),
                    );
            },
          ),
          IconButton(
              onPressed: () {
                context.read<ImagePickerBloc>().add(ImageGallery());
              },
              icon: const Icon(Icons.image)),
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
                              image: FileImage(File(state.cameraImage!.path)))),
                    );
            },
          ),
          IconButton(
              onPressed: () {
                context.read<ImagePickerBloc>().add(ImageGallery());
              },
              icon: const Icon(Icons.camera))
        ],
      )),
    );
  }
}
