import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/model/graphQLAutogenerated/CharactersQueries.graphql.dart';
import 'package:flutter_revo_boilerplate/services/graphql/graphQLApi.dart';

class ListCharViewModel with ChangeNotifier {
  bool _isLoading = false;
  List<Query$CharacterImage$Page$characters?>? _images;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  List<Query$CharacterImage$Page$characters?>? get images => _images;
  String? get errorMessage => _errorMessage;

  final _graphApi = GraphQLApiClient().getInstance();

  Future<void> fetchImages() async {
    if (_isLoading) {
      return;
    }

    _isLoading = true;
    try {
      _images = (await _graphApi.query$CharacterImage()).parsedData?.Page?.characters;
    } catch (error) {
      _images = [];
      _errorMessage = 'Si è verificato un errore durante il recupero delle images.';
    }

    _isLoading = false;
    notifyListeners();
  }
}