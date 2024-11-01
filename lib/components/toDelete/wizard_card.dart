import 'package:flutter/cupertino.dart';
import 'package:flutter_revo_boilerplate/api/generated/openapi.models.swagger.dart';
import 'package:flutter_revo_boilerplate/components/list_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomWizardCard extends StatelessWidget {
  final bool isLoading;
  final WizardDto wizard;

  const CustomWizardCard({
    super.key,
    required this.wizard,
    required this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: CustomListTile(
        label: wizard.firstName ?? wizard.lastName ?? 'NAN',
        onPress: () {}
      ),
    );
  }
}