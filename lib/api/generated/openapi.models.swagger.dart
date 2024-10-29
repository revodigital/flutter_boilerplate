// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'openapi.enums.swagger.dart' as enums;

part 'openapi.models.swagger.g.dart';

@JsonSerializable(explicitToJson: true)
class ElixirDto {
  const ElixirDto({
    this.id,
    this.name,
    this.effect,
    this.sideEffects,
    this.characteristics,
    this.time,
    this.difficulty,
    this.ingredients,
    this.inventors,
    this.manufacturer,
  });

  factory ElixirDto.fromJson(Map<String, dynamic> json) =>
      _$ElixirDtoFromJson(json);

  static const toJsonFactory = _$ElixirDtoToJson;
  Map<String, dynamic> toJson() => _$ElixirDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'effect')
  final String? effect;
  @JsonKey(name: 'sideEffects')
  final String? sideEffects;
  @JsonKey(name: 'characteristics')
  final String? characteristics;
  @JsonKey(name: 'time')
  final String? time;
  @JsonKey(
    name: 'difficulty',
    toJson: elixirDifficultyNullableToJson,
    fromJson: elixirDifficultyNullableFromJson,
  )
  final enums.ElixirDifficulty? difficulty;
  @JsonKey(name: 'ingredients', defaultValue: <IngredientDto>[])
  final List<IngredientDto>? ingredients;
  @JsonKey(name: 'inventors', defaultValue: <ElixirInventorDto>[])
  final List<ElixirInventorDto>? inventors;
  @JsonKey(name: 'manufacturer')
  final String? manufacturer;
  static const fromJsonFactory = _$ElixirDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ElixirDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.effect, effect) ||
                const DeepCollectionEquality().equals(other.effect, effect)) &&
            (identical(other.sideEffects, sideEffects) ||
                const DeepCollectionEquality()
                    .equals(other.sideEffects, sideEffects)) &&
            (identical(other.characteristics, characteristics) ||
                const DeepCollectionEquality()
                    .equals(other.characteristics, characteristics)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.difficulty, difficulty) ||
                const DeepCollectionEquality()
                    .equals(other.difficulty, difficulty)) &&
            (identical(other.ingredients, ingredients) ||
                const DeepCollectionEquality()
                    .equals(other.ingredients, ingredients)) &&
            (identical(other.inventors, inventors) ||
                const DeepCollectionEquality()
                    .equals(other.inventors, inventors)) &&
            (identical(other.manufacturer, manufacturer) ||
                const DeepCollectionEquality()
                    .equals(other.manufacturer, manufacturer)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(effect) ^
      const DeepCollectionEquality().hash(sideEffects) ^
      const DeepCollectionEquality().hash(characteristics) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(difficulty) ^
      const DeepCollectionEquality().hash(ingredients) ^
      const DeepCollectionEquality().hash(inventors) ^
      const DeepCollectionEquality().hash(manufacturer) ^
      runtimeType.hashCode;
}

extension $ElixirDtoExtension on ElixirDto {
  ElixirDto copyWith(
      {String? id,
      String? name,
      String? effect,
      String? sideEffects,
      String? characteristics,
      String? time,
      enums.ElixirDifficulty? difficulty,
      List<IngredientDto>? ingredients,
      List<ElixirInventorDto>? inventors,
      String? manufacturer}) {
    return ElixirDto(
        id: id ?? this.id,
        name: name ?? this.name,
        effect: effect ?? this.effect,
        sideEffects: sideEffects ?? this.sideEffects,
        characteristics: characteristics ?? this.characteristics,
        time: time ?? this.time,
        difficulty: difficulty ?? this.difficulty,
        ingredients: ingredients ?? this.ingredients,
        inventors: inventors ?? this.inventors,
        manufacturer: manufacturer ?? this.manufacturer);
  }

  ElixirDto copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? effect,
      Wrapped<String?>? sideEffects,
      Wrapped<String?>? characteristics,
      Wrapped<String?>? time,
      Wrapped<enums.ElixirDifficulty?>? difficulty,
      Wrapped<List<IngredientDto>?>? ingredients,
      Wrapped<List<ElixirInventorDto>?>? inventors,
      Wrapped<String?>? manufacturer}) {
    return ElixirDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        effect: (effect != null ? effect.value : this.effect),
        sideEffects:
            (sideEffects != null ? sideEffects.value : this.sideEffects),
        characteristics: (characteristics != null
            ? characteristics.value
            : this.characteristics),
        time: (time != null ? time.value : this.time),
        difficulty: (difficulty != null ? difficulty.value : this.difficulty),
        ingredients:
            (ingredients != null ? ingredients.value : this.ingredients),
        inventors: (inventors != null ? inventors.value : this.inventors),
        manufacturer:
            (manufacturer != null ? manufacturer.value : this.manufacturer));
  }
}

@JsonSerializable(explicitToJson: true)
class ElixirInventorDto {
  const ElixirInventorDto({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory ElixirInventorDto.fromJson(Map<String, dynamic> json) =>
      _$ElixirInventorDtoFromJson(json);

  static const toJsonFactory = _$ElixirInventorDtoToJson;
  Map<String, dynamic> toJson() => _$ElixirInventorDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  static const fromJsonFactory = _$ElixirInventorDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is ElixirInventorDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      runtimeType.hashCode;
}

extension $ElixirInventorDtoExtension on ElixirInventorDto {
  ElixirInventorDto copyWith(
      {String? id, String? firstName, String? lastName}) {
    return ElixirInventorDto(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }

  ElixirInventorDto copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName}) {
    return ElixirInventorDto(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName));
  }
}

@JsonSerializable(explicitToJson: true)
class GetHousesQuery {
  const GetHousesQuery();

  factory GetHousesQuery.fromJson(Map<String, dynamic> json) =>
      _$GetHousesQueryFromJson(json);

  static const toJsonFactory = _$GetHousesQueryToJson;
  Map<String, dynamic> toJson() => _$GetHousesQueryToJson(this);

  static const fromJsonFactory = _$GetHousesQueryFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class HouseDto {
  const HouseDto({
    this.id,
    this.name,
    this.houseColours,
    this.founder,
    this.animal,
    this.element,
    this.ghost,
    this.commonRoom,
    this.heads,
    this.traits,
  });

  factory HouseDto.fromJson(Map<String, dynamic> json) =>
      _$HouseDtoFromJson(json);

  static const toJsonFactory = _$HouseDtoToJson;
  Map<String, dynamic> toJson() => _$HouseDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'houseColours')
  final String? houseColours;
  @JsonKey(name: 'founder')
  final String? founder;
  @JsonKey(name: 'animal')
  final String? animal;
  @JsonKey(name: 'element')
  final String? element;
  @JsonKey(name: 'ghost')
  final String? ghost;
  @JsonKey(name: 'commonRoom')
  final String? commonRoom;
  @JsonKey(name: 'heads', defaultValue: <HouseHeadDto>[])
  final List<HouseHeadDto>? heads;
  @JsonKey(name: 'traits', defaultValue: <TraitDto>[])
  final List<TraitDto>? traits;
  static const fromJsonFactory = _$HouseDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HouseDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.houseColours, houseColours) ||
                const DeepCollectionEquality()
                    .equals(other.houseColours, houseColours)) &&
            (identical(other.founder, founder) ||
                const DeepCollectionEquality()
                    .equals(other.founder, founder)) &&
            (identical(other.animal, animal) ||
                const DeepCollectionEquality().equals(other.animal, animal)) &&
            (identical(other.element, element) ||
                const DeepCollectionEquality()
                    .equals(other.element, element)) &&
            (identical(other.ghost, ghost) ||
                const DeepCollectionEquality().equals(other.ghost, ghost)) &&
            (identical(other.commonRoom, commonRoom) ||
                const DeepCollectionEquality()
                    .equals(other.commonRoom, commonRoom)) &&
            (identical(other.heads, heads) ||
                const DeepCollectionEquality().equals(other.heads, heads)) &&
            (identical(other.traits, traits) ||
                const DeepCollectionEquality().equals(other.traits, traits)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(houseColours) ^
      const DeepCollectionEquality().hash(founder) ^
      const DeepCollectionEquality().hash(animal) ^
      const DeepCollectionEquality().hash(element) ^
      const DeepCollectionEquality().hash(ghost) ^
      const DeepCollectionEquality().hash(commonRoom) ^
      const DeepCollectionEquality().hash(heads) ^
      const DeepCollectionEquality().hash(traits) ^
      runtimeType.hashCode;
}

extension $HouseDtoExtension on HouseDto {
  HouseDto copyWith(
      {String? id,
      String? name,
      String? houseColours,
      String? founder,
      String? animal,
      String? element,
      String? ghost,
      String? commonRoom,
      List<HouseHeadDto>? heads,
      List<TraitDto>? traits}) {
    return HouseDto(
        id: id ?? this.id,
        name: name ?? this.name,
        houseColours: houseColours ?? this.houseColours,
        founder: founder ?? this.founder,
        animal: animal ?? this.animal,
        element: element ?? this.element,
        ghost: ghost ?? this.ghost,
        commonRoom: commonRoom ?? this.commonRoom,
        heads: heads ?? this.heads,
        traits: traits ?? this.traits);
  }

  HouseDto copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? houseColours,
      Wrapped<String?>? founder,
      Wrapped<String?>? animal,
      Wrapped<String?>? element,
      Wrapped<String?>? ghost,
      Wrapped<String?>? commonRoom,
      Wrapped<List<HouseHeadDto>?>? heads,
      Wrapped<List<TraitDto>?>? traits}) {
    return HouseDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        houseColours:
            (houseColours != null ? houseColours.value : this.houseColours),
        founder: (founder != null ? founder.value : this.founder),
        animal: (animal != null ? animal.value : this.animal),
        element: (element != null ? element.value : this.element),
        ghost: (ghost != null ? ghost.value : this.ghost),
        commonRoom: (commonRoom != null ? commonRoom.value : this.commonRoom),
        heads: (heads != null ? heads.value : this.heads),
        traits: (traits != null ? traits.value : this.traits));
  }
}

@JsonSerializable(explicitToJson: true)
class HouseHeadDto {
  const HouseHeadDto({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory HouseHeadDto.fromJson(Map<String, dynamic> json) =>
      _$HouseHeadDtoFromJson(json);

  static const toJsonFactory = _$HouseHeadDtoToJson;
  Map<String, dynamic> toJson() => _$HouseHeadDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  static const fromJsonFactory = _$HouseHeadDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HouseHeadDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      runtimeType.hashCode;
}

extension $HouseHeadDtoExtension on HouseHeadDto {
  HouseHeadDto copyWith({String? id, String? firstName, String? lastName}) {
    return HouseHeadDto(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }

  HouseHeadDto copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName}) {
    return HouseHeadDto(
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName));
  }
}

@JsonSerializable(explicitToJson: true)
class IngredientDto {
  const IngredientDto({
    this.id,
    this.name,
  });

  factory IngredientDto.fromJson(Map<String, dynamic> json) =>
      _$IngredientDtoFromJson(json);

  static const toJsonFactory = _$IngredientDtoToJson;
  Map<String, dynamic> toJson() => _$IngredientDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$IngredientDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is IngredientDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $IngredientDtoExtension on IngredientDto {
  IngredientDto copyWith({String? id, String? name}) {
    return IngredientDto(id: id ?? this.id, name: name ?? this.name);
  }

  IngredientDto copyWithWrapped(
      {Wrapped<String?>? id, Wrapped<String?>? name}) {
    return IngredientDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class SendFeedbackCommand {
  const SendFeedbackCommand({
    this.feedbackType,
    this.feedback,
    this.entityId,
  });

  factory SendFeedbackCommand.fromJson(Map<String, dynamic> json) =>
      _$SendFeedbackCommandFromJson(json);

  static const toJsonFactory = _$SendFeedbackCommandToJson;
  Map<String, dynamic> toJson() => _$SendFeedbackCommandToJson(this);

  @JsonKey(
    name: 'feedbackType',
    toJson: feedbackTypeNullableToJson,
    fromJson: feedbackTypeNullableFromJson,
  )
  final enums.FeedbackType? feedbackType;
  @JsonKey(name: 'feedback')
  final String? feedback;
  @JsonKey(name: 'entityId')
  final String? entityId;
  static const fromJsonFactory = _$SendFeedbackCommandFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SendFeedbackCommand &&
            (identical(other.feedbackType, feedbackType) ||
                const DeepCollectionEquality()
                    .equals(other.feedbackType, feedbackType)) &&
            (identical(other.feedback, feedback) ||
                const DeepCollectionEquality()
                    .equals(other.feedback, feedback)) &&
            (identical(other.entityId, entityId) ||
                const DeepCollectionEquality()
                    .equals(other.entityId, entityId)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(feedbackType) ^
      const DeepCollectionEquality().hash(feedback) ^
      const DeepCollectionEquality().hash(entityId) ^
      runtimeType.hashCode;
}

extension $SendFeedbackCommandExtension on SendFeedbackCommand {
  SendFeedbackCommand copyWith(
      {enums.FeedbackType? feedbackType, String? feedback, String? entityId}) {
    return SendFeedbackCommand(
        feedbackType: feedbackType ?? this.feedbackType,
        feedback: feedback ?? this.feedback,
        entityId: entityId ?? this.entityId);
  }

  SendFeedbackCommand copyWithWrapped(
      {Wrapped<enums.FeedbackType?>? feedbackType,
      Wrapped<String?>? feedback,
      Wrapped<String?>? entityId}) {
    return SendFeedbackCommand(
        feedbackType:
            (feedbackType != null ? feedbackType.value : this.feedbackType),
        feedback: (feedback != null ? feedback.value : this.feedback),
        entityId: (entityId != null ? entityId.value : this.entityId));
  }
}

@JsonSerializable(explicitToJson: true)
class SpellDto {
  const SpellDto({
    this.id,
    this.name,
    this.incantation,
    this.effect,
    this.canBeVerbal,
    this.type,
    this.light,
    this.creator,
  });

  factory SpellDto.fromJson(Map<String, dynamic> json) =>
      _$SpellDtoFromJson(json);

  static const toJsonFactory = _$SpellDtoToJson;
  Map<String, dynamic> toJson() => _$SpellDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'incantation')
  final String? incantation;
  @JsonKey(name: 'effect')
  final String? effect;
  @JsonKey(name: 'canBeVerbal')
  final bool? canBeVerbal;
  @JsonKey(
    name: 'type',
    toJson: spellTypeNullableToJson,
    fromJson: spellTypeNullableFromJson,
  )
  final enums.SpellType? type;
  @JsonKey(
    name: 'light',
    toJson: spellLightNullableToJson,
    fromJson: spellLightNullableFromJson,
  )
  final enums.SpellLight? light;
  @JsonKey(name: 'creator')
  final String? creator;
  static const fromJsonFactory = _$SpellDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SpellDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.incantation, incantation) ||
                const DeepCollectionEquality()
                    .equals(other.incantation, incantation)) &&
            (identical(other.effect, effect) ||
                const DeepCollectionEquality().equals(other.effect, effect)) &&
            (identical(other.canBeVerbal, canBeVerbal) ||
                const DeepCollectionEquality()
                    .equals(other.canBeVerbal, canBeVerbal)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.light, light) ||
                const DeepCollectionEquality().equals(other.light, light)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality().equals(other.creator, creator)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(incantation) ^
      const DeepCollectionEquality().hash(effect) ^
      const DeepCollectionEquality().hash(canBeVerbal) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(light) ^
      const DeepCollectionEquality().hash(creator) ^
      runtimeType.hashCode;
}

extension $SpellDtoExtension on SpellDto {
  SpellDto copyWith(
      {String? id,
      String? name,
      String? incantation,
      String? effect,
      bool? canBeVerbal,
      enums.SpellType? type,
      enums.SpellLight? light,
      String? creator}) {
    return SpellDto(
        id: id ?? this.id,
        name: name ?? this.name,
        incantation: incantation ?? this.incantation,
        effect: effect ?? this.effect,
        canBeVerbal: canBeVerbal ?? this.canBeVerbal,
        type: type ?? this.type,
        light: light ?? this.light,
        creator: creator ?? this.creator);
  }

  SpellDto copyWithWrapped(
      {Wrapped<String?>? id,
      Wrapped<String?>? name,
      Wrapped<String?>? incantation,
      Wrapped<String?>? effect,
      Wrapped<bool?>? canBeVerbal,
      Wrapped<enums.SpellType?>? type,
      Wrapped<enums.SpellLight?>? light,
      Wrapped<String?>? creator}) {
    return SpellDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        incantation:
            (incantation != null ? incantation.value : this.incantation),
        effect: (effect != null ? effect.value : this.effect),
        canBeVerbal:
            (canBeVerbal != null ? canBeVerbal.value : this.canBeVerbal),
        type: (type != null ? type.value : this.type),
        light: (light != null ? light.value : this.light),
        creator: (creator != null ? creator.value : this.creator));
  }
}

@JsonSerializable(explicitToJson: true)
class TraitDto {
  const TraitDto({
    this.id,
    this.name,
  });

  factory TraitDto.fromJson(Map<String, dynamic> json) =>
      _$TraitDtoFromJson(json);

  static const toJsonFactory = _$TraitDtoToJson;
  Map<String, dynamic> toJson() => _$TraitDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(
    name: 'name',
    toJson: traitNameNullableToJson,
    fromJson: traitNameNullableFromJson,
  )
  final enums.TraitName? name;
  static const fromJsonFactory = _$TraitDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is TraitDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $TraitDtoExtension on TraitDto {
  TraitDto copyWith({String? id, enums.TraitName? name}) {
    return TraitDto(id: id ?? this.id, name: name ?? this.name);
  }

  TraitDto copyWithWrapped(
      {Wrapped<String?>? id, Wrapped<enums.TraitName?>? name}) {
    return TraitDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class Unit {
  const Unit();

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  static const toJsonFactory = _$UnitToJson;
  Map<String, dynamic> toJson() => _$UnitToJson(this);

  static const fromJsonFactory = _$UnitFromJson;

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode => runtimeType.hashCode;
}

@JsonSerializable(explicitToJson: true)
class WizardDto {
  const WizardDto({
    this.elixirs,
    this.id,
    this.firstName,
    this.lastName,
  });

  factory WizardDto.fromJson(Map<String, dynamic> json) =>
      _$WizardDtoFromJson(json);

  static const toJsonFactory = _$WizardDtoToJson;
  Map<String, dynamic> toJson() => _$WizardDtoToJson(this);

  @JsonKey(name: 'elixirs', defaultValue: <WizardElixirDto>[])
  final List<WizardElixirDto>? elixirs;
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  static const fromJsonFactory = _$WizardDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is WizardDto &&
            (identical(other.elixirs, elixirs) ||
                const DeepCollectionEquality()
                    .equals(other.elixirs, elixirs)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(elixirs) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      runtimeType.hashCode;
}

extension $WizardDtoExtension on WizardDto {
  WizardDto copyWith(
      {List<WizardElixirDto>? elixirs,
      String? id,
      String? firstName,
      String? lastName}) {
    return WizardDto(
        elixirs: elixirs ?? this.elixirs,
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName);
  }

  WizardDto copyWithWrapped(
      {Wrapped<List<WizardElixirDto>?>? elixirs,
      Wrapped<String?>? id,
      Wrapped<String?>? firstName,
      Wrapped<String?>? lastName}) {
    return WizardDto(
        elixirs: (elixirs != null ? elixirs.value : this.elixirs),
        id: (id != null ? id.value : this.id),
        firstName: (firstName != null ? firstName.value : this.firstName),
        lastName: (lastName != null ? lastName.value : this.lastName));
  }
}

@JsonSerializable(explicitToJson: true)
class WizardElixirDto {
  const WizardElixirDto({
    this.id,
    this.name,
  });

  factory WizardElixirDto.fromJson(Map<String, dynamic> json) =>
      _$WizardElixirDtoFromJson(json);

  static const toJsonFactory = _$WizardElixirDtoToJson;
  Map<String, dynamic> toJson() => _$WizardElixirDtoToJson(this);

  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$WizardElixirDtoFromJson;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is WizardElixirDto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      runtimeType.hashCode;
}

extension $WizardElixirDtoExtension on WizardElixirDto {
  WizardElixirDto copyWith({String? id, String? name}) {
    return WizardElixirDto(id: id ?? this.id, name: name ?? this.name);
  }

  WizardElixirDto copyWithWrapped(
      {Wrapped<String?>? id, Wrapped<String?>? name}) {
    return WizardElixirDto(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name));
  }
}

String? elixirDifficultyNullableToJson(
    enums.ElixirDifficulty? elixirDifficulty) {
  return elixirDifficulty?.value;
}

String? elixirDifficultyToJson(enums.ElixirDifficulty elixirDifficulty) {
  return elixirDifficulty.value;
}

enums.ElixirDifficulty elixirDifficultyFromJson(
  Object? elixirDifficulty, [
  enums.ElixirDifficulty? defaultValue,
]) {
  return enums.ElixirDifficulty.values
          .firstWhereOrNull((e) => e.value == elixirDifficulty) ??
      defaultValue ??
      enums.ElixirDifficulty.swaggerGeneratedUnknown;
}

enums.ElixirDifficulty? elixirDifficultyNullableFromJson(
  Object? elixirDifficulty, [
  enums.ElixirDifficulty? defaultValue,
]) {
  if (elixirDifficulty == null) {
    return null;
  }
  return enums.ElixirDifficulty.values
          .firstWhereOrNull((e) => e.value == elixirDifficulty) ??
      defaultValue;
}

String elixirDifficultyExplodedListToJson(
    List<enums.ElixirDifficulty>? elixirDifficulty) {
  return elixirDifficulty?.map((e) => e.value!).join(',') ?? '';
}

List<String> elixirDifficultyListToJson(
    List<enums.ElixirDifficulty>? elixirDifficulty) {
  if (elixirDifficulty == null) {
    return [];
  }

  return elixirDifficulty.map((e) => e.value!).toList();
}

List<enums.ElixirDifficulty> elixirDifficultyListFromJson(
  List? elixirDifficulty, [
  List<enums.ElixirDifficulty>? defaultValue,
]) {
  if (elixirDifficulty == null) {
    return defaultValue ?? [];
  }

  return elixirDifficulty
      .map((e) => elixirDifficultyFromJson(e.toString()))
      .toList();
}

List<enums.ElixirDifficulty>? elixirDifficultyNullableListFromJson(
  List? elixirDifficulty, [
  List<enums.ElixirDifficulty>? defaultValue,
]) {
  if (elixirDifficulty == null) {
    return defaultValue;
  }

  return elixirDifficulty
      .map((e) => elixirDifficultyFromJson(e.toString()))
      .toList();
}

String? feedbackTypeNullableToJson(enums.FeedbackType? feedbackType) {
  return feedbackType?.value;
}

String? feedbackTypeToJson(enums.FeedbackType feedbackType) {
  return feedbackType.value;
}

enums.FeedbackType feedbackTypeFromJson(
  Object? feedbackType, [
  enums.FeedbackType? defaultValue,
]) {
  return enums.FeedbackType.values
          .firstWhereOrNull((e) => e.value == feedbackType) ??
      defaultValue ??
      enums.FeedbackType.swaggerGeneratedUnknown;
}

enums.FeedbackType? feedbackTypeNullableFromJson(
  Object? feedbackType, [
  enums.FeedbackType? defaultValue,
]) {
  if (feedbackType == null) {
    return null;
  }
  return enums.FeedbackType.values
          .firstWhereOrNull((e) => e.value == feedbackType) ??
      defaultValue;
}

String feedbackTypeExplodedListToJson(List<enums.FeedbackType>? feedbackType) {
  return feedbackType?.map((e) => e.value!).join(',') ?? '';
}

List<String> feedbackTypeListToJson(List<enums.FeedbackType>? feedbackType) {
  if (feedbackType == null) {
    return [];
  }

  return feedbackType.map((e) => e.value!).toList();
}

List<enums.FeedbackType> feedbackTypeListFromJson(
  List? feedbackType, [
  List<enums.FeedbackType>? defaultValue,
]) {
  if (feedbackType == null) {
    return defaultValue ?? [];
  }

  return feedbackType.map((e) => feedbackTypeFromJson(e.toString())).toList();
}

List<enums.FeedbackType>? feedbackTypeNullableListFromJson(
  List? feedbackType, [
  List<enums.FeedbackType>? defaultValue,
]) {
  if (feedbackType == null) {
    return defaultValue;
  }

  return feedbackType.map((e) => feedbackTypeFromJson(e.toString())).toList();
}

String? spellLightNullableToJson(enums.SpellLight? spellLight) {
  return spellLight?.value;
}

String? spellLightToJson(enums.SpellLight spellLight) {
  return spellLight.value;
}

enums.SpellLight spellLightFromJson(
  Object? spellLight, [
  enums.SpellLight? defaultValue,
]) {
  return enums.SpellLight.values
          .firstWhereOrNull((e) => e.value == spellLight) ??
      defaultValue ??
      enums.SpellLight.swaggerGeneratedUnknown;
}

enums.SpellLight? spellLightNullableFromJson(
  Object? spellLight, [
  enums.SpellLight? defaultValue,
]) {
  if (spellLight == null) {
    return null;
  }
  return enums.SpellLight.values
          .firstWhereOrNull((e) => e.value == spellLight) ??
      defaultValue;
}

String spellLightExplodedListToJson(List<enums.SpellLight>? spellLight) {
  return spellLight?.map((e) => e.value!).join(',') ?? '';
}

List<String> spellLightListToJson(List<enums.SpellLight>? spellLight) {
  if (spellLight == null) {
    return [];
  }

  return spellLight.map((e) => e.value!).toList();
}

List<enums.SpellLight> spellLightListFromJson(
  List? spellLight, [
  List<enums.SpellLight>? defaultValue,
]) {
  if (spellLight == null) {
    return defaultValue ?? [];
  }

  return spellLight.map((e) => spellLightFromJson(e.toString())).toList();
}

List<enums.SpellLight>? spellLightNullableListFromJson(
  List? spellLight, [
  List<enums.SpellLight>? defaultValue,
]) {
  if (spellLight == null) {
    return defaultValue;
  }

  return spellLight.map((e) => spellLightFromJson(e.toString())).toList();
}

String? spellTypeNullableToJson(enums.SpellType? spellType) {
  return spellType?.value;
}

String? spellTypeToJson(enums.SpellType spellType) {
  return spellType.value;
}

enums.SpellType spellTypeFromJson(
  Object? spellType, [
  enums.SpellType? defaultValue,
]) {
  return enums.SpellType.values.firstWhereOrNull((e) => e.value == spellType) ??
      defaultValue ??
      enums.SpellType.swaggerGeneratedUnknown;
}

enums.SpellType? spellTypeNullableFromJson(
  Object? spellType, [
  enums.SpellType? defaultValue,
]) {
  if (spellType == null) {
    return null;
  }
  return enums.SpellType.values.firstWhereOrNull((e) => e.value == spellType) ??
      defaultValue;
}

String spellTypeExplodedListToJson(List<enums.SpellType>? spellType) {
  return spellType?.map((e) => e.value!).join(',') ?? '';
}

List<String> spellTypeListToJson(List<enums.SpellType>? spellType) {
  if (spellType == null) {
    return [];
  }

  return spellType.map((e) => e.value!).toList();
}

List<enums.SpellType> spellTypeListFromJson(
  List? spellType, [
  List<enums.SpellType>? defaultValue,
]) {
  if (spellType == null) {
    return defaultValue ?? [];
  }

  return spellType.map((e) => spellTypeFromJson(e.toString())).toList();
}

List<enums.SpellType>? spellTypeNullableListFromJson(
  List? spellType, [
  List<enums.SpellType>? defaultValue,
]) {
  if (spellType == null) {
    return defaultValue;
  }

  return spellType.map((e) => spellTypeFromJson(e.toString())).toList();
}

String? traitNameNullableToJson(enums.TraitName? traitName) {
  return traitName?.value;
}

String? traitNameToJson(enums.TraitName traitName) {
  return traitName.value;
}

enums.TraitName traitNameFromJson(
  Object? traitName, [
  enums.TraitName? defaultValue,
]) {
  return enums.TraitName.values.firstWhereOrNull((e) => e.value == traitName) ??
      defaultValue ??
      enums.TraitName.swaggerGeneratedUnknown;
}

enums.TraitName? traitNameNullableFromJson(
  Object? traitName, [
  enums.TraitName? defaultValue,
]) {
  if (traitName == null) {
    return null;
  }
  return enums.TraitName.values.firstWhereOrNull((e) => e.value == traitName) ??
      defaultValue;
}

String traitNameExplodedListToJson(List<enums.TraitName>? traitName) {
  return traitName?.map((e) => e.value!).join(',') ?? '';
}

List<String> traitNameListToJson(List<enums.TraitName>? traitName) {
  if (traitName == null) {
    return [];
  }

  return traitName.map((e) => e.value!).toList();
}

List<enums.TraitName> traitNameListFromJson(
  List? traitName, [
  List<enums.TraitName>? defaultValue,
]) {
  if (traitName == null) {
    return defaultValue ?? [];
  }

  return traitName.map((e) => traitNameFromJson(e.toString())).toList();
}

List<enums.TraitName>? traitNameNullableListFromJson(
  List? traitName, [
  List<enums.TraitName>? defaultValue,
]) {
  if (traitName == null) {
    return defaultValue;
  }

  return traitName.map((e) => traitNameFromJson(e.toString())).toList();
}

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
