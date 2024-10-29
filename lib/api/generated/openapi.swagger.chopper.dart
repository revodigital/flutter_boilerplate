// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$Openapi extends Openapi {
  _$Openapi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = Openapi;

  @override
  Future<Response<List<ElixirDto>>> _elixirsGet({
    String? name,
    String? difficulty,
    String? ingredient,
    String? inventorFullName,
    String? manufacturer,
  }) {
    final Uri $url = Uri.parse('/Elixirs');
    final Map<String, dynamic> $params = <String, dynamic>{
      'Name': name,
      'Difficulty': difficulty,
      'Ingredient': ingredient,
      'InventorFullName': inventorFullName,
      'Manufacturer': manufacturer,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<ElixirDto>, ElixirDto>($request);
  }

  @override
  Future<Response<ElixirDto>> _elixirsIdGet({required String? id}) {
    final Uri $url = Uri.parse('/Elixirs/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ElixirDto, ElixirDto>($request);
  }

  @override
  Future<Response<Unit>> _feedbackPost({required SendFeedbackCommand? body}) {
    final Uri $url = Uri.parse('/Feedback');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Unit, Unit>($request);
  }

  @override
  Future<Response<List<HouseDto>>> _housesGet({GetHousesQuery? query}) {
    final Uri $url = Uri.parse('/Houses');
    final Map<String, dynamic> $params = <String, dynamic>{'query': query};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<HouseDto>, HouseDto>($request);
  }

  @override
  Future<Response<HouseDto>> _housesIdGet({required String? id}) {
    final Uri $url = Uri.parse('/Houses/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<HouseDto, HouseDto>($request);
  }

  @override
  Future<Response<List<IngredientDto>>> _ingredientsGet({String? name}) {
    final Uri $url = Uri.parse('/Ingredients');
    final Map<String, dynamic> $params = <String, dynamic>{'Name': name};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<IngredientDto>, IngredientDto>($request);
  }

  @override
  Future<Response<IngredientDto>> _ingredientsIdGet({required String? id}) {
    final Uri $url = Uri.parse('/Ingredients/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<IngredientDto, IngredientDto>($request);
  }

  @override
  Future<Response<List<SpellDto>>> _spellsGet({
    String? name,
    String? type,
    String? incantation,
  }) {
    final Uri $url = Uri.parse('/Spells');
    final Map<String, dynamic> $params = <String, dynamic>{
      'Name': name,
      'Type': type,
      'Incantation': incantation,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<SpellDto>, SpellDto>($request);
  }

  @override
  Future<Response<SpellDto>> _spellsIdGet({required String? id}) {
    final Uri $url = Uri.parse('/Spells/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SpellDto, SpellDto>($request);
  }

  @override
  Future<Response<List<WizardDto>>> _wizardsGet({
    String? firstName,
    String? lastName,
  }) {
    final Uri $url = Uri.parse('/Wizards');
    final Map<String, dynamic> $params = <String, dynamic>{
      'FirstName': firstName,
      'LastName': lastName,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<WizardDto>, WizardDto>($request);
  }

  @override
  Future<Response<WizardDto>> _wizardsIdGet({required String? id}) {
    final Uri $url = Uri.parse('/Wizards/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<WizardDto, WizardDto>($request);
  }
}
