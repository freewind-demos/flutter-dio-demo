// Flutter Dio HTTP 客户端
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() async {
  final dio = Dio();
  final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  print(response.data);
}
