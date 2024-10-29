import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_revo_boilerplate/api/generated/openapi.models.swagger.dart';
import 'package:flutter_revo_boilerplate/components/background.dart';
import 'package:flutter_revo_boilerplate/model/mocked_model.dart';
import 'package:flutter_revo_boilerplate/view_model/wizards_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/app_bar.dart';
import '../components/empty_card.dart';
import '../components/header.dart';
import '../components/toDelete/wizard_card.dart';
import '../utils/colors.dart';
import '../utils/loading.dart';
import '../utils/typography.dart';

class WizardView extends StatelessWidget {
  const WizardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WizardsViewModel(),
      child: Consumer<WizardsViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.loadingStatus == LoadingStatus.idle) {
            Future.delayed(Duration.zero, () {
              viewModel.fetchWizards();
            });
          }

          return Scaffold(
            appBar: CustomAppBar(
              title: 'Boilerplate',
              paddingTop: 50,
              opacity: 0.8,
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
                    const CustomHeader(title: 'Benvenuto su Boilerplate'),
                    SizedBox(height: Adaptive.px(8),),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Adaptive.px(24)),
                      child: Text(
                        'Wizards',
                        style: CustomTypography.title[2]!.copyWith(
                            color: CustomColors.text[20]
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
                        children: viewModel.loadingStatus == LoadingStatus.loading && viewModel.wizards.isEmpty ? [
                          CustomWizardCard(
                            isLoading: true,
                            wizard: MockWizard(),
                          )
                        ] : viewModel.wizards.isNotEmpty ? [
                          Text(
                            'Qui puoi trovare i Maghi.',
                            style: CustomTypography.body['2-regular']!.copyWith(
                                color: CustomColors.text[40]
                            ),
                          ),
                          SizedBox(
                            height: Adaptive.px(24),
                          ),
                          ...viewModel.wizards.map((WizardDto value) {
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
                          if (viewModel.loadingStatus == LoadingStatus.loading) ...[
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
                            alignment: viewModel.loadingStatus == LoadingStatus.error ? Alignment.topLeft : Alignment.center,
                            child: CustomEmptyCard(
                              title: '',
                              description: viewModel.loadingStatus == LoadingStatus.error ? 'Errore nel caricamento... Riprovare più tardi' : 'Non sei iscritto a nessun Porto.',
                              icon: viewModel.loadingStatus == LoadingStatus.error ? null : SizedBox(
                                width: Adaptive.px(120),
                                child: Icon(
                                  FontAwesomeIcons.boxOpen,
                                  size: Adaptive.px(83),
                                  color: CustomColors.neutral[70],
                                ),
                              ),
                              type: CustomEmptyCardType.onlyDescription,
                              textAlign: viewModel.loadingStatus == LoadingStatus.error ? TextAlign.left : TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}