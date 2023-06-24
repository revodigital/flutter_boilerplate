import 'dart:async';

import 'package:flutter_revo_boilerplate/placeholder_values/values.dart';

import '../model/picsum_model.dart';

class ListPictureViewModel {
  List<PicSumModel>? pictures;

  Future<void> fetchPictures () async {
    final result = PlaceholderValues().toList();
    pictures = result;
  }
}