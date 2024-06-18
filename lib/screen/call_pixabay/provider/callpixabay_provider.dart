import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../apiservices/api_services.dart';

class HomeProvider extends ChangeNotifier {
  Map data = {};
  bool isLoading = true;

  Future<void> fetchData(String category) async {
    isLoading = true;
    notifyListeners();
    String? json = await ApiServices().apiCalling(category);
    if (json != null) {
      data = jsonDecode(json);
      log('--- Fetched Data --');
    } else {
      log('--- Null Data ---');
    }
    isLoading = false;
    notifyListeners();
  }

  HomeProvider() {
    fetchData('nature');
  }
}
