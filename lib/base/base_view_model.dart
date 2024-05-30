import 'package:flutter/material.dart';
import 'package:vodth_mobile/core/routes/routes_export.dart';

class BaseViewModel extends ChangeNotifier {
  late bool disposed;

  BaseViewModel() {
    disposed = false;
  }

  @override
  void notifyListeners() {
    if (disposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }

  String? perPage(BuildContext context) {
    try {
      return context.routeData.queryParams.getString('perPage');
    } catch (e) {
      return null;
    }
  }
}
