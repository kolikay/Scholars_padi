// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/constants/shared_preferences.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';

class ProfileModelView extends ChangeNotifier {
  File? image;
  String? uploadImage;

  setUploadImageUrl(String? url) {
    uploadImage = url;
    notifyListeners();
  }

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

      final userEmail = UserPreferences.getEmail();
      final response = await cloudinary.unsignedUpload(
          file: uploadImage,
          uploadPreset: 'profileimages',
          resourceType: CloudinaryResourceType.image,
          folder: 'ProfilePix',
          fileName: userEmail,
          progressCallback: (count, total) {
            AuthViewModel.instance.setLoading(true);

            print('Uploading image from file with progress: $count/$total');
          });

      if (response.isSuccessful) {
        setUploadImageUrl(response.secureUrl);
        AuthViewModel.instance.setLoading(false);
      }
    } catch (e) {
      AuthViewModel.instance.setLoading(false);
      print('failed to pick image: $e');
    }
  }
}
