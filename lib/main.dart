import 'package:flutter/material.dart';
import 'package:vodth_mobile/initializer.dart';
import 'package:vodth_mobile/my_app.dart';
import 'package:vodth_mobile/views/widgets/app_scope.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.load();

  runApp(AppScope(builder: (context, router) {
    return MyApp(router: router);
  }));
}
