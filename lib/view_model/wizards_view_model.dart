import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/api/api_client.dart';
import 'package:flutter_revo_boilerplate/utils/loading.dart';
import 'package:logger/logger.dart';

import 'package:flutter_revo_boilerplate/api/generated/openapi.models.swagger.dart';

class WizardsViewModel with ChangeNotifier {
  LoadingStatus _loadingStatus = LoadingStatus.idle;
  List<WizardDto> _wizards = [];
  String? _errorMessage;

  LoadingStatus get loadingStatus => _loadingStatus;
  List<WizardDto> get wizards => _wizards;
  String? get errorMessage => _errorMessage;

  set wizards(List<WizardDto> l) {
    _wizards = l;
    notifyListeners();
  }

  set errorMessage(String? s) {
    _errorMessage = s;
    notifyListeners();
  }

  set loadingStatus(LoadingStatus l) {
    _loadingStatus = l;
    notifyListeners();
  }

  Future<void> fetchWizards() async {
    if (loadingStatus == LoadingStatus.loading) {
      return;
    }

    loadingStatus = LoadingStatus.loading;

    try {
      wizards = (await AppApiClient.client.wizardsGet()).bodyOrThrow;
      loadingStatus = LoadingStatus.finished;
    } catch (e) {
      Logger().e('[LIST_PICTURE_VIEW_MODEL]: $e');
      wizards = [];
      _errorMessage = 'Si è verificato un errore durante il recupero delle pictures.';
      loadingStatus = LoadingStatus.error;
    }

    notifyListeners();
  }
}