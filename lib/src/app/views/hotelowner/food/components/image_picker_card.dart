import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCard extends StatefulWidget {
  final void Function(String imagePath) onImageSelected;

  final String? initialImage;

  const ImagePickerCard({super.key, required this.onImageSelected, this.initialImage});

  @override
  State<ImagePickerCard> createState() => _ImagePickerCardState();
}

class _ImagePickerCardState extends State<ImagePickerCard> {
  XFile? _image;

  @override
  void initState() {
    super.initState();
    if (widget.initialImage != null) {
      _image = XFile(widget.initialImage!);
    }
  }


  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
      widget.onImageSelected(pickedImage.path); // Send back the path
    }
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
