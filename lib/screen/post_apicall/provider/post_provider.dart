import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/post_api.dart';
import '../post_api_call.dart';

class PostApiProvider extends ChangeNotifier {
  List<PostModel> _postList = [];

  List<PostModel> get postList => _postList;

  PostApiProvider() {
    getData();
  }

  Future<void> getData() async {
    try {
      String json = await ApiService().callApi('https://jsonplaceholder.typicode.com/posts');
      List data = jsonDecode(json);

      // Convert into object data
      _postList = data.map((e) => PostModel.fromJson(e)).toList();
      notifyListeners();
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error: $e');
    }
  }
}
