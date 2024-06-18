import 'dart:convert';

import 'package:api_call/screen/user_api_call/model/user_model.dart';
import 'package:flutter/cupertino.dart';

import '../../post_apicall/post_api_call.dart';


class UserApiProvider extends ChangeNotifier{

  List<DataModel> _userList = [];

  List<DataModel> get usersList => _userList;

  UserApiProvider(){
    getData();
  }

  Future<void> getData() async {
    String json = await ApiService().callApi('https://jsonplaceholder.typicode.com/users');
    List data = await jsonDecode(json);

    // convert into object data
    _userList = data.map((e) => DataModel.fromJson(e)).toList();
  }
}
