import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCard extends StatefulWidget {
  const ImagePickerCard({super.key});

  @override
  State<ImagePickerCard> createState() => _ImagePickerCardState();
}

class _ImagePickerCardState extends State<ImagePickerCard> {
  XFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          image: _image != null
              ? DecorationImage(
                  image: FileImage(
                    File(_image!.path),
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _image == null
            ? const Center(
                child: Icon(Icons.camera_alt, size: 40, color: Colors.grey),
              )
            : null,
      ),
    );
  }
}
