// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart' as json;
import 'package:collection/collection.dart';
import 'dart:convert';

import 'openapi.models.swagger.dart';
import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show MultipartFile;
import 'package:chopper/chopper.dart' as chopper;
import 'openapi.enums.swagger.dart' as enums;
export 'openapi.enums.swagger.dart';
export 'openapi.models.swagger.dart';

part 'openapi.swagger.chopper.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class Openapi extends ChopperService {
  static Openapi create({
    ChopperClient? client,
    http.Client? httpClient,
    Authenticator? authenticator,
    ErrorConverter? errorConverter,
    Converter? converter,
    Uri? baseUrl,
    List<Interceptor>? interceptors,
  }) {
    if (client != null) {
      return _$Openapi(client);
    }

    final newClient = ChopperClient(
        services: [_$Openapi()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        client: httpClient,
        authenticator: authenticator,
        errorConverter: errorConverter,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$Openapi(newClient);
  }

  ///
  ///@param Name
  ///@param Difficulty
  ///@param Ingredient
  ///@param InventorFullName
  ///@param Manufacturer
  Future<chopper.Response<List<ElixirDto>>> elixirsGet({
    String? name,
    enums.ElixirDifficulty? difficulty,
    String? ingredient,
    String? inventorFullName,
    String? manufacturer,
  }) {
    generatedMapping.putIfAbsent(ElixirDto, () => ElixirDto.fromJsonFactory);

    return _elixirsGet(
        name: name,
        difficulty: difficulty?.value?.toString(),
        ingredient: ingredient,
        inventorFullName: inventorFullName,
        manufacturer: manufacturer);
  }

  ///
  ///@param Name
  ///@param Difficulty
  ///@param Ingredient
  ///@param InventorFullName
  ///@param Manufacturer
  @Get(path: '/Elixirs')
  Future<chopper.Response<List<ElixirDto>>> _elixirsGet({
    @Query('Name') String? name,
    @Query('Difficulty') String? difficulty,
    @Query('Ingredient') String? ingredient,
    @Query('InventorFullName') String? inventorFullName,
    @Query('Manufacturer') String? manufacturer,
  });

  ///
  ///@param id
  Future<chopper.Response<ElixirDto>> elixirsIdGet({required String? id}) {
    generatedMapping.putIfAbsent(ElixirDto, () => ElixirDto.fromJsonFactory);

    return _elixirsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/Elixirs/{id}')
  Future<chopper.Response<ElixirDto>> _elixirsIdGet(
      {@Path('id') required String? id});

  ///
  Future<chopper.Response<Unit>> feedbackPost(
      {required SendFeedbackCommand? body}) {
    generatedMapping.putIfAbsent(Unit, () => Unit.fromJsonFactory);

    return _feedbackPost(body: body);
  }

  ///
  @Post(
    path: '/Feedback',
    optionalBody: true,
  )
  Future<chopper.Response<Unit>> _feedbackPost(
      {@Body() required SendFeedbackCommand? body});

  ///
  ///@param query
  Future<chopper.Response<List<HouseDto>>> housesGet({GetHousesQuery? query}) {
    generatedMapping.putIfAbsent(
        GetHousesQuery, () => GetHousesQuery.fromJsonFactory);
    generatedMapping.putIfAbsent(HouseDto, () => HouseDto.fromJsonFactory);

    return _housesGet(query: query);
  }

  ///
  ///@param query
  @Get(path: '/Houses')
  Future<chopper.Response<List<HouseDto>>> _housesGet(
      {@Query('query') GetHousesQuery? query});

  ///
  ///@param id
  Future<chopper.Response<HouseDto>> housesIdGet({required String? id}) {
    generatedMapping.putIfAbsent(HouseDto, () => HouseDto.fromJsonFactory);

    return _housesIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/Houses/{id}')
  Future<chopper.Response<HouseDto>> _housesIdGet(
      {@Path('id') required String? id});

  ///
  ///@param Name
  Future<chopper.Response<List<IngredientDto>>> ingredientsGet({String? name}) {
    generatedMapping.putIfAbsent(
        IngredientDto, () => IngredientDto.fromJsonFactory);

    return _ingredientsGet(name: name);
  }

  ///
  ///@param Name
  @Get(path: '/Ingredients')
  Future<chopper.Response<List<IngredientDto>>> _ingredientsGet(
      {@Query('Name') String? name});

  ///
  ///@param id
  Future<chopper.Response<IngredientDto>> ingredientsIdGet(
      {required String? id}) {
    generatedMapping.putIfAbsent(
        IngredientDto, () => IngredientDto.fromJsonFactory);

    return _ingredientsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/Ingredients/{id}')
  Future<chopper.Response<IngredientDto>> _ingredientsIdGet(
      {@Path('id') required String? id});

  ///
  ///@param Name
  ///@param Type
  ///@param Incantation
  Future<chopper.Response<List<SpellDto>>> spellsGet({
    String? name,
    enums.SpellType? type,
    String? incantation,
  }) {
    generatedMapping.putIfAbsent(SpellDto, () => SpellDto.fromJsonFactory);

    return _spellsGet(
        name: name, type: type?.value?.toString(), incantation: incantation);
  }

  ///
  ///@param Name
  ///@param Type
  ///@param Incantation
  @Get(path: '/Spells')
  Future<chopper.Response<List<SpellDto>>> _spellsGet({
    @Query('Name') String? name,
    @Query('Type') String? type,
    @Query('Incantation') String? incantation,
  });

  ///
  ///@param id
  Future<chopper.Response<SpellDto>> spellsIdGet({required String? id}) {
    generatedMapping.putIfAbsent(SpellDto, () => SpellDto.fromJsonFactory);

    return _spellsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/Spells/{id}')
  Future<chopper.Response<SpellDto>> _spellsIdGet(
      {@Path('id') required String? id});

  ///
  ///@param FirstName
  ///@param LastName
  Future<chopper.Response<List<WizardDto>>> wizardsGet({
    String? firstName,
    String? lastName,
  }) {
    generatedMapping.putIfAbsent(WizardDto, () => WizardDto.fromJsonFactory);

    return _wizardsGet(firstName: firstName, lastName: lastName);
  }

  ///
  ///@param FirstName
  ///@param LastName
  @Get(path: '/Wizards')
  Future<chopper.Response<List<WizardDto>>> _wizardsGet({
    @Query('FirstName') String? firstName,
    @Query('LastName') String? lastName,
  });

  ///
  ///@param id
  Future<chopper.Response<WizardDto>> wizardsIdGet({required String? id}) {
    generatedMapping.putIfAbsent(WizardDto, () => WizardDto.fromJsonFactory);

    return _wizardsIdGet(id: id);
  }

  ///
  ///@param id
  @Get(path: '/Wizards/{id}')
  Future<chopper.Response<WizardDto>> _wizardsIdGet(
      {@Path('id') required String? id});
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    if (ResultType == String) {
      return response.copyWith();
    }

    if (ResultType == DateTime) {
      return response.copyWith(
          body: DateTime.parse((response.body as String).replaceAll('"', ''))
              as ResultType);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);
