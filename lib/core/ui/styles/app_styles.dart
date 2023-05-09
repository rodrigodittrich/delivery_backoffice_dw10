import 'package:delivery_backoffice_dw10/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'colors_app.dart';

class AppStyles {
  static AppStyles? _instance;
 
  AppStyles._();
  
  static AppStyles get instance{
    _instance??=  AppStyles._();
    return _instance!;
   }

   ButtonStyle get primaryButton => ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ),
    backgroundColor: ColorsApp.instance.primary,
    textStyle: TextStyles.instance.textButtonLabel
   );
}

extension AppStylesExtension on BuildContext {
  AppStyles get appStylkes => AppStyles.instance;
}