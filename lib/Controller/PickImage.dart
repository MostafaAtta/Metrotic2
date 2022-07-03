

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class GetImage with ChangeNotifier {
  File? file;
  //
  // Future getImage(ImageSource select) async {
  //   File pickedFile = await ImagePicker.pickImage(source: select);
  //
  //   if (pickedFile != null) {
  //     print("file picked");
  //
  //       file = File(pickedFile.path);
  //
  //
  //   }
  //   else{
  //     print("File not picked");
  //   }
  //   notifyListeners();
  //
  // }
}