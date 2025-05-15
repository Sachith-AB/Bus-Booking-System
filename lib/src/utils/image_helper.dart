import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImageHelper {
  static final ImagePicker _picker = ImagePicker();

  /// Pick an image from gallery
  static Future<XFile?> pickImage() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  /// Save image to app documents directory
  static Future<String> saveImageLocally(XFile image) async {
    final dir = await getApplicationDocumentsDirectory();
    final String filename = basename(image.path);
    final String localPath = '${dir.path}/$filename';
    await File(image.path).copy(localPath);
    return localPath;
  }
}
