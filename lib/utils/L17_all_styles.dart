import 'package:flutter/cupertino.dart';
import 'package:flutter_with_noman_android_studio/utils/L17_all_size.dart';

import 'L17_all_colors.dart';

class AllStyles{
  static const headingStyle = TextStyle(fontSize: AllSizes.extraLarge,      // ekhane extraLarge "L17_all_size.dart" ei file theke neya
      fontWeight: FontWeight.bold,
    color: AllColors.blackColor   // color 'L17_all_colors.dart' ei file theke import kora
  );
  // same vabe arekta style toiri kori
  static const titleStyle = TextStyle(fontSize: AllSizes.large,      // ekhane extraLarge "L17_all_size.dart" ei file theke neya
      fontWeight: FontWeight.normal,
      color: AllColors.blackColor    // color 'L17_all_colors.dart' ei file theke import kora
  );
  // arekta nebo sutitle er jonno
  static const subtitleStyle = TextStyle(fontSize: AllSizes.medium,      // ekhane extraLarge "L17_all_size.dart" ei file theke neya
      fontWeight: FontWeight.normal,
      color: AllColors.blackColor    // color 'L17_all_colors.dart' ei file theke import kora
  );
}