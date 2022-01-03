import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:newsapptele/model/nes_moel.dart';

class NewsController extends GetxController{
  RxInt currentIndex=0.obs;
  getData(String cat)async{
    final url=Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=${cat}&apiKey=0af20f2beeff4ef0a9145deee7dfc94b");
  http.Response response = await http.get(url);
  
  if(response.statusCode==200)
  {
    try{
      return Articles.fromJson(jsonDecode(response.body));
    }catch(e)
    {
      Get.snackbar("error", e.toString());
    }
  }
  }
}