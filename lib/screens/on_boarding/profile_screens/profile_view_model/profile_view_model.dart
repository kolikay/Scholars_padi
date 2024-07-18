// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModelView extends ChangeNotifier {
  File? image;
  String? uploadImage;

  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      final imageTem = File(_image.path);
      uploadImage = _image.path;
      image = imageTem;

      final cloudinary = Cloudinary.unsignedConfig(
        cloudName: 'dqrp6ojey',
      );
      final response = await cloudinary.unsignedUpload(
          file: uploadImage,
          uploadPreset: 'profileimages',
          resourceType: CloudinaryResourceType.image,
          folder: 'ProfilePix',
          fileName: 'some-name',
          progressCallback: (count, total) {
            print('Uploading image from file with progress: $count/$total');
          });

      if (response.isSuccessful) {
        uploadImage = response.secureUrl;
        notifyListeners();
        print('Get your image from with ${response.secureUrl}');
      }
    } catch (e) {
      print('failed to pick image: $e');
    }
  }
}
