import 'package:flutter_revo_boilerplate/utils/loading.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../api/generated/openapi.models.swagger.dart';

part 'wizards_model.freezed.dart';
part 'wizards_model.g.dart';

@freezed
class WizardsModel with _$WizardsModel {
  factory WizardsModel({
    required LoadingStatus loadingStatus,
    required List<WizardDto> wizards,
    String? errorMessage
  }) = _WizardsModel;

  factory WizardsModel.fromJson(Map<String, Object?> json)
  => _$WizardsModelFromJson(json);
}