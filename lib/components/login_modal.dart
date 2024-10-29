import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_revo_boilerplate/components/icon_button.dart';
import 'package:flutter_revo_boilerplate/utils/colors.dart';
import 'package:flutter_revo_boilerplate/utils/typography.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLoginModal extends StatelessWidget {
  const CustomLoginModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Adaptive.px(99)), topRight: Radius.circular(Adaptive.px(99))),
        color: CustomColors.primary[100],
      ),
      padding: EdgeInsets.all(Adaptive.px(16)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Perché devo accedere all’app?',
                style: CustomTypography.title[3]!.copyWith(
                  color: CustomColors.text[20]
                ),
              ),
              CustomIconButton(
                icon: FontAwesomeIcons.xmark,
                onPressed: (){
                  Navigator.pop(context);
                }
              )
            ],
          ),
          SizedBox(height: Adaptive.px(16),),
          Text(
            "L'utilizzo della nostra app richiede la registrazione o l'accesso per garantire la sicurezza e l'efficacia delle nostre funzionalità, che sono strettamente legate alle operazioni portuali. Queste funzioni non possono essere utilizzate liberamente per motivi conformità e gestione operativa.\n\nRegistrandoti o accedendo, possiamo assicurarti un'esperienza personalizzata, permettendo l'accesso solo a utenti autorizzati che necessitano di interagire con i servizi del porto. Questa misura ci aiuta a mantenere il porto sicuro e operativo.",
            style: CustomTypography.body['1-medium']!.copyWith(
                color: CustomColors.text[40]
            ),
          ),
        ],
      ),
    );
  }
}