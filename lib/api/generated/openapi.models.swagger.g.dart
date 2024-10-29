// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openapi.models.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElixirDto _$ElixirDtoFromJson(Map<String, dynamic> json) => ElixirDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      effect: json['effect'] as String?,
      sideEffects: json['sideEffects'] as String?,
      characteristics: json['characteristics'] as String?,
      time: json['time'] as String?,
      difficulty: elixirDifficultyNullableFromJson(json['difficulty']),
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => IngredientDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      inventors: (json['inventors'] as List<dynamic>?)
              ?.map(
                  (e) => ElixirInventorDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      manufacturer: json['manufacturer'] as String?,
    );

Map<String, dynamic> _$ElixirDtoToJson(ElixirDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'effect': instance.effect,
      'sideEffects': instance.sideEffects,
      'characteristics': instance.characteristics,
      'time': instance.time,
      'difficulty': elixirDifficultyNullableToJson(instance.difficulty),
      'ingredients': instance.ingredients?.map((e) => e.toJson()).toList(),
      'inventors': instance.inventors?.map((e) => e.toJson()).toList(),
      'manufacturer': instance.manufacturer,
    };

ElixirInventorDto _$ElixirInventorDtoFromJson(Map<String, dynamic> json) =>
    ElixirInventorDto(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$ElixirInventorDtoToJson(ElixirInventorDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

GetHousesQuery _$GetHousesQueryFromJson(Map<String, dynamic> json) =>
    GetHousesQuery();

Map<String, dynamic> _$GetHousesQueryToJson(GetHousesQuery instance) =>
    <String, dynamic>{};

HouseDto _$HouseDtoFromJson(Map<String, dynamic> json) => HouseDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      houseColours: json['houseColours'] as String?,
      founder: json['founder'] as String?,
      animal: json['animal'] as String?,
      element: json['element'] as String?,
      ghost: json['ghost'] as String?,
      commonRoom: json['commonRoom'] as String?,
      heads: (json['heads'] as List<dynamic>?)
              ?.map((e) => HouseHeadDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      traits: (json['traits'] as List<dynamic>?)
              ?.map((e) => TraitDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HouseDtoToJson(HouseDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'houseColours': instance.houseColours,
      'founder': instance.founder,
      'animal': instance.animal,
      'element': instance.element,
      'ghost': instance.ghost,
      'commonRoom': instance.commonRoom,
      'heads': instance.heads?.map((e) => e.toJson()).toList(),
      'traits': instance.traits?.map((e) => e.toJson()).toList(),
    };

HouseHeadDto _$HouseHeadDtoFromJson(Map<String, dynamic> json) => HouseHeadDto(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$HouseHeadDtoToJson(HouseHeadDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

IngredientDto _$IngredientDtoFromJson(Map<String, dynamic> json) =>
    IngredientDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$IngredientDtoToJson(IngredientDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

SendFeedbackCommand _$SendFeedbackCommandFromJson(Map<String, dynamic> json) =>
    SendFeedbackCommand(
      feedbackType: feedbackTypeNullableFromJson(json['feedbackType']),
      feedback: json['feedback'] as String?,
      entityId: json['entityId'] as String?,
    );

Map<String, dynamic> _$SendFeedbackCommandToJson(
        SendFeedbackCommand instance) =>
    <String, dynamic>{
      'feedbackType': feedbackTypeNullableToJson(instance.feedbackType),
      'feedback': instance.feedback,
      'entityId': instance.entityId,
    };

SpellDto _$SpellDtoFromJson(Map<String, dynamic> json) => SpellDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      incantation: json['incantation'] as String?,
      effect: json['effect'] as String?,
      canBeVerbal: json['canBeVerbal'] as bool?,
      type: spellTypeNullableFromJson(json['type']),
      light: spellLightNullableFromJson(json['light']),
      creator: json['creator'] as String?,
    );

Map<String, dynamic> _$SpellDtoToJson(SpellDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'incantation': instance.incantation,
      'effect': instance.effect,
      'canBeVerbal': instance.canBeVerbal,
      'type': spellTypeNullableToJson(instance.type),
      'light': spellLightNullableToJson(instance.light),
      'creator': instance.creator,
    };

TraitDto _$TraitDtoFromJson(Map<String, dynamic> json) => TraitDto(
      id: json['id'] as String?,
      name: traitNameNullableFromJson(json['name']),
    );

Map<String, dynamic> _$TraitDtoToJson(TraitDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': traitNameNullableToJson(instance.name),
    };

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit();

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{};

WizardDto _$WizardDtoFromJson(Map<String, dynamic> json) => WizardDto(
      elixirs: (json['elixirs'] as List<dynamic>?)
              ?.map((e) => WizardElixirDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$WizardDtoToJson(WizardDto instance) => <String, dynamic>{
      'elixirs': instance.elixirs?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

WizardElixirDto _$WizardElixirDtoFromJson(Map<String, dynamic> json) =>
    WizardElixirDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WizardElixirDtoToJson(WizardElixirDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
