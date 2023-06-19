
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/git_api.dart';

Future<GitApi?>getProfile( String username ) async{
  Map data = {};

  try{
    var uri = 'https://api.github.com/users/$username';
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return GitApi.fromJson(data as Map<String,dynamic>);
    }else{
      throw Exception(response.reasonPhrase.toString());
    }
  }catch(e){
    debugPrint(e.toString());
  }
  return null;
}

Future<List<Followers>> getUserFollowers(String user)async{

  try{
    var uri = 'https://api.github.com/users/$user/followers';
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    //data = jsonDecode(response.body);
    if(response.statusCode == 200){
      var responseBody = response.body;
      List<dynamic> data = jsonDecode(responseBody);
      List<Followers> list = data.map((e) => Followers.fromJson(e as Map<String,dynamic>)).toList();
      debugPrint('${list.length}');
      return list;
    }else{
      throw Exception(response.reasonPhrase.toString());
    }
  }catch(e){
    debugPrint(e.toString());
  }
  return [];
}

Future<List<Followers>>getUserFollowing(String user)async{

  try{
    var uri = 'https://api.github.com/users/$user/following';
    var url = Uri.parse(uri);
    http.Response response = await http.get(url);
    //data = jsonDecode(response.body);
    if(response.statusCode == 200){
     var responseBody = response.body;
      List<dynamic> data = jsonDecode(responseBody);
      List<Followers> list = data.map((e) => Followers.fromJson(e as Map<String,dynamic>)).toList();
      debugPrint('${list.length}');
      return list;
    }else{
      throw Exception(response.reasonPhrase.toString());
    }
  }catch(e){
    debugPrint(e.toString());
  }
  return [];
}