import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/services/rest/restApi.dart';

import '../model/picsum_model.dart';

class ListPictureViewModel with ChangeNotifier {
  bool _isLoading = false;
  List<PicSumModel>? _pictures;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  List<PicSumModel>? get pictures => _pictures;
  String? get errorMessage => _errorMessage;

  final _restApi = RestClient.getInstance();

  Future<void> fetchPictures() async {
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    try {
      _pictures = await _restApi.getPictures();
    } catch (error) {
      _pictures = [];
      _errorMessage = 'Si è verificato un errore durante il recupero delle pictures.';
    }

    _isLoading = false;
    notifyListeners();
  }
}