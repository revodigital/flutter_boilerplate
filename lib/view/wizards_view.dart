import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/api/generated/openapi.models.swagger.dart';
import 'package:flutter_revo_boilerplate/components/background.dart';
import 'package:flutter_revo_boilerplate/model/mocked_model.dart';
import 'package:flutter_revo_boilerplate/view_model/wizards_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../components/toDelete/wizard_card.dart';
import '../utils/colors.dart';
import '../utils/loading.dart';
import '../utils/typography.dart';

class WizardView extends ConsumerWidget {
  const WizardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(wizardsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Boilerplate'),
        actions: [
        ],
      ),
      body: CustomBackground(
        defaultPadding: false,
        notCenter: true,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.px(24)),
                child: Text(
                  AppLocalizations.of(context)!.wizards,
                  style: CustomTypography.title(CustomTitleKeys.k2).copyWith(
                      color: MaterialColors.neutral.k10
                  ),
                ),
              ),
              SizedBox(
                height: Adaptive.px(16),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Adaptive.px(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (watch.loadingStatus == LoadingStatus.idle || watch.loadingStatus == LoadingStatus.loading) && watch.wizards.isEmpty ? [
                    CustomWizardCard(
                      isLoading: true,
                      wizard: MockWizard(),
                    )
                  ] : watch.wizards.isNotEmpty ? [
                    Text(
                      'Qui puoi trovare i Maghi.',
                      style: CustomTypography.body(CustomBodyKeys.k2Regular).copyWith(
                          color: MaterialColors.neutral.k10
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.px(24),
                    ),
                    ...watch.wizards.map((WizardDto value) {
                      return Column(
                        children: [
                          CustomWizardCard(
                              wizard: value,
                              isLoading: false
                          ),
                          SizedBox(
                            height: Adaptive.px(16),
                          )
                        ],
                      );
                    }),
                    if (watch.loadingStatus == LoadingStatus.loading) ...[
                      CustomWizardCard(
                        isLoading: true,
                        wizard: MockWizard(),
                      ),
                      SizedBox(
                        height: Adaptive.px(16),
                      )
                    ]
                  ] : [
                    Container(
                      alignment: watch.loadingStatus == LoadingStatus.error ? Alignment.topLeft : Alignment.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}