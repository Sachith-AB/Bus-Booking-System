import 'dart:io';
import 'package:bus_booking/src/utils/image_helper.dart';
import 'package:flutter/material.dart';

class ProfileImagePicker extends StatefulWidget {
  final String? initialImagePath;
  final Function(String imagePath) onImageSaved;
  const ProfileImagePicker(
      {super.key, this.initialImagePath, required this.onImageSaved});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _image;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    if (widget.initialImagePath != null &&
        widget.initialImagePath!.isNotEmpty) {
      _imagePath = widget.initialImagePath;
      if (!_imagePath!.startsWith('http')) {
        final file = File(_imagePath!);
        if (file.existsSync()) {
          _image = file;
        }
      }
    }
  }

  Future<void> _pickImage() async {
    final picked = await ImageHelper.pickImage();
    if (picked != null) {
      final savedPath = await ImageHelper.saveImageLocally(picked);
      setState(() {
        _image = File(savedPath); // Always set _image to the new file
        _imagePath = savedPath;
      });
      widget.onImageSaved(savedPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    const double size = 100;
    ImageProvider? imageProvider;

    if (_image != null) {
      imageProvider = FileImage(_image!);
    } else if (_imagePath != null && _imagePath!.isNotEmpty) {
      if (_imagePath!.startsWith('http')) {
        imageProvider = NetworkImage(_imagePath!);
      } else {
        final file = File(_imagePath!);
        if (file.existsSync()) {
          imageProvider = FileImage(file);
        }
      }
    }

    return Stack(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: size / 2,
            backgroundColor: Colors.grey[300],
            backgroundImage: imageProvider,
            child: imageProvider == null
                ? const Icon(Icons.person, size: 40, color: Colors.white)
                : null,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400),
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.add,
                size: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
