import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vodth_mobile/core/theme/m3/m3_color.dart';
import 'package:vodth_mobile/firebase_options.dart';

class Initializer {
  static Future<void> load() async {
    // remove # from url
    setPathUrlStrategy();

    // core
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // theme
    await M3Color.instance.initialize();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    loadLicenses();
  }

  static void loadLicenses() {
    LicenseRegistry.addLicense(() async* {
      final kantumruyProLicense =
          await rootBundle.loadString('assets/fonts/kantumruy_pro/OFL.txt');
      final poppinsLicense =
          await rootBundle.loadString('assets/fonts/poppins/OFL.txt');

      yield LicenseEntryWithLineBreaks(['KantumruyPro'], kantumruyProLicense);
      yield LicenseEntryWithLineBreaks(['Poppins'], poppinsLicense);
    });
  }
}
