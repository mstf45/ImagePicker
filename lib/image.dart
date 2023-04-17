import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerKullanimi extends StatefulWidget {
  const ImagePickerKullanimi({Key? key}) : super(key: key);

  @override
  State<ImagePickerKullanimi> createState() => _ImagePickerKullanimiState();
}

class _ImagePickerKullanimiState extends State<ImagePickerKullanimi> {
  File? _imageYolu;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50),
          if (_imageYolu == null) const Placeholder() else Image.file(_imageYolu!),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => _pickImageCamera(),
                icon: const Icon(Icons.camera_alt_outlined),
                tooltip: 'Kamera',
              ),
              IconButton(
                onPressed: () => _pickImageGallery(),
                icon: const Icon(Icons.photo_camera_back_outlined),
                tooltip: 'Galeri',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageYolu = File(pickedFile.path);
      });
    }
  }
  Future<void> _pickImageCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageYolu = File(pickedFile.path);
      });
    }
  }
}
