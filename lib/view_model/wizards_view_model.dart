import 'package:flutter_revo_boilerplate/api/api_client.dart';
import 'package:flutter_revo_boilerplate/model/wizards_model.dart';
import 'package:flutter_revo_boilerplate/utils/loading.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wizards_view_model.g.dart';

@riverpod
class WizardsViewModel extends _$WizardsViewModel {
  @override
  WizardsModel build() {
    Future.delayed(
      Duration(milliseconds: 1000),
          () {
        fetchWizards();
      },
    );

    return WizardsModel(
      loadingStatus: LoadingStatus.idle,
      wizards: []
    );
  }

  Future<void> fetchWizards() async {
    if (state.loadingStatus == LoadingStatus.loading) {
      return;
    }

    state = state.copyWith(
      loadingStatus: LoadingStatus.loading
    );

    try {
      state = state.copyWith(
        wizards: (await AppApiClient.client.wizardsGet()).bodyOrThrow,
        loadingStatus: LoadingStatus.finished
      );
    } catch (e) {
      Logger().e('[LIST_PICTURE_VIEW_MODEL]: $e');
      state = state.copyWith(
        wizards: [],
        loadingStatus: LoadingStatus.error,
        errorMessage: 'Si è verificato un errore durante il recupero dei wizards.'
      );
    }
  }
}