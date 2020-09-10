
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List> fetchWpPosts() async {
  final response = await http.get('https://ruvem.ru/wp-json/wp/v2/posts?_embed&per_page=100',headers:{"Accept":"application/json"});
  var convertDataToJson =  jsonDecode(response.body);
  return convertDataToJson;
}

//НА БУДУЩЕЕ - МЕТОДЫ РАБОТЫ С ПОЛНОЙ СТАТЬЕЙ (ВЫВОД КОММЕНТАРИЕВ,ТЕГОВ И ПОЛУЧЕНИЯ ДАННЫХ ВСЕЙ НОВОСТИ ЧЕРЕЗ АПИ

Future<List> fetchWpComments() async {
  final response = await http.get('https://ruvem.ru/wp-json/wp/v2/comments?post=',headers:{"Accept":"application/json"});
  var convertDataToJson =  jsonDecode(response.body);
  return convertDataToJson;
}

Future<List> fetchWpFullPost() async {
  final response = await http.get('https://ruvem.ru/wp-json/wp/v2/posts/',headers:{"Accept":"application/json"});
  var convertDataToJson =  jsonDecode(response.body);
  return convertDataToJson;
}

Future<List> fetchWpPostTag() async {
  final response = await http.get('https://ruvem.ru/wp-json/wp/v2/tags?post=',headers:{"Accept":"application/json"});
  var convertDataToJson =  jsonDecode(response.body);
  return convertDataToJson;
}
