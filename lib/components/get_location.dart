import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_revo_boilerplate/components/background.dart';
import 'package:flutter_revo_boilerplate/components/button.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/location.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomGetLocation extends StatelessWidget {
  final IconData closeIcon;
  final Function onResult;

  const CustomGetLocation({
    super.key,
    required this.onResult,
    required this.closeIcon
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Adaptive.px(24),),
              GestureDetector(
                onTap: () {
                  onResult(LocationServiceStatus.rejected);
                },
                child: Icon(
                  closeIcon,
                  size: Adaptive.px(24),
                  color: CustomColors.neutral[30],
                ),
              ),
              SizedBox(height: Adaptive.px(60),),
              SvgPicture.asset(
                './assets/icons/location.svg',
                height: Adaptive.px(80),
              ),
              SizedBox(height: Adaptive.px(24),),
              Text(
                'Attiva la geolocalizzazione per risultati più precisi',
                style: CustomTypography.title[1],
              ),
              SizedBox(height: Adaptive.px(16),),
              Text(
                'Attiva la geolocalizzazione del tuo smartphone per visualizzare i ristoranti nella tua zona in classifica.',
                style: CustomTypography.body['1-regular']!.copyWith(
                  color: CustomColors.neutral[30]
                ),
              )
            ],
          ),
          Column(
            children: [
              CustomButton(
                type: CustomButtonType.primary,
                fit: CustomButtonFit.full,
                label: 'Attiva geolocalizzazione',
                isLoading: false,
                onPressed: () async {
                  bool result = await LocationService().requestPermission();

                  if (result){
                    onResult(LocationServiceStatus.granted);
                  } else {
                    onResult(LocationServiceStatus.rejected);
                  }
                }
              ),
              SizedBox(height: Adaptive.px(16),),
              CustomButton(
                type: CustomButtonType.tertiary,
                fit: CustomButtonFit.full,
                label: 'Non ora',
                isLoading: false,
                onPressed: (){
                  onResult(LocationServiceStatus.rejected);
                }
              ),
              SizedBox(height: Adaptive.px(40),),
            ],
          )
        ],
      ),
    );
  }
}