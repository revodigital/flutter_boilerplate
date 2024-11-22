// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wizards_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WizardsModelImpl _$$WizardsModelImplFromJson(Map<String, dynamic> json) =>
    _$WizardsModelImpl(
      loadingStatus: $enumDecode(_$LoadingStatusEnumMap, json['loadingStatus']),
      wizards: (json['wizards'] as List<dynamic>)
          .map((e) => WizardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$WizardsModelImplToJson(_$WizardsModelImpl instance) =>
    <String, dynamic>{
      'loadingStatus': _$LoadingStatusEnumMap[instance.loadingStatus]!,
      'wizards': instance.wizards,
      'errorMessage': instance.errorMessage,
    };

const _$LoadingStatusEnumMap = {
  LoadingStatus.idle: 'idle',
  LoadingStatus.loading: 'loading',
  LoadingStatus.error: 'error',
  LoadingStatus.finished: 'finished',
};
