// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wizards_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WizardsModel _$WizardsModelFromJson(Map<String, dynamic> json) {
  return _WizardsModel.fromJson(json);
}

/// @nodoc
mixin _$WizardsModel {
  LoadingStatus get loadingStatus => throw _privateConstructorUsedError;
  List<WizardDto> get wizards => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this WizardsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WizardsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WizardsModelCopyWith<WizardsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WizardsModelCopyWith<$Res> {
  factory $WizardsModelCopyWith(
          WizardsModel value, $Res Function(WizardsModel) then) =
      _$WizardsModelCopyWithImpl<$Res, WizardsModel>;
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      List<WizardDto> wizards,
      String? errorMessage});
}

/// @nodoc
class _$WizardsModelCopyWithImpl<$Res, $Val extends WizardsModel>
    implements $WizardsModelCopyWith<$Res> {
  _$WizardsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WizardsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? wizards = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      wizards: null == wizards
          ? _value.wizards
          : wizards // ignore: cast_nullable_to_non_nullable
              as List<WizardDto>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WizardsModelImplCopyWith<$Res>
    implements $WizardsModelCopyWith<$Res> {
  factory _$$WizardsModelImplCopyWith(
          _$WizardsModelImpl value, $Res Function(_$WizardsModelImpl) then) =
      __$$WizardsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingStatus loadingStatus,
      List<WizardDto> wizards,
      String? errorMessage});
}

/// @nodoc
class __$$WizardsModelImplCopyWithImpl<$Res>
    extends _$WizardsModelCopyWithImpl<$Res, _$WizardsModelImpl>
    implements _$$WizardsModelImplCopyWith<$Res> {
  __$$WizardsModelImplCopyWithImpl(
      _$WizardsModelImpl _value, $Res Function(_$WizardsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WizardsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? wizards = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$WizardsModelImpl(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as LoadingStatus,
      wizards: null == wizards
          ? _value._wizards
          : wizards // ignore: cast_nullable_to_non_nullable
              as List<WizardDto>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WizardsModelImpl implements _WizardsModel {
  _$WizardsModelImpl(
      {required this.loadingStatus,
      required final List<WizardDto> wizards,
      this.errorMessage})
      : _wizards = wizards;

  factory _$WizardsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WizardsModelImplFromJson(json);

  @override
  final LoadingStatus loadingStatus;
  final List<WizardDto> _wizards;
  @override
  List<WizardDto> get wizards {
    if (_wizards is EqualUnmodifiableListView) return _wizards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wizards);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'WizardsModel(loadingStatus: $loadingStatus, wizards: $wizards, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WizardsModelImpl &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            const DeepCollectionEquality().equals(other._wizards, _wizards) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, loadingStatus,
      const DeepCollectionEquality().hash(_wizards), errorMessage);

  /// Create a copy of WizardsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WizardsModelImplCopyWith<_$WizardsModelImpl> get copyWith =>
      __$$WizardsModelImplCopyWithImpl<_$WizardsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WizardsModelImplToJson(
      this,
    );
  }
}

abstract class _WizardsModel implements WizardsModel {
  factory _WizardsModel(
      {required final LoadingStatus loadingStatus,
      required final List<WizardDto> wizards,
      final String? errorMessage}) = _$WizardsModelImpl;

  factory _WizardsModel.fromJson(Map<String, dynamic> json) =
      _$WizardsModelImpl.fromJson;

  @override
  LoadingStatus get loadingStatus;
  @override
  List<WizardDto> get wizards;
  @override
  String? get errorMessage;

  /// Create a copy of WizardsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WizardsModelImplCopyWith<_$WizardsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
