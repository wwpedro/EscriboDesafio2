import 'dart:convert';
import 'package:desafio2pedro/models/book_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const String url = "https://escribo.com/books.json";

List<BookModel> parserBooks(String responseBody) {
  var list = jsonDecode(responseBody) as List<dynamic>;
  var books = list.map((e) => BookModel.fromJson(e)).toList();
  return books;
}

Future<List<BookModel>> fetchBooks() async {
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return compute(parserBooks, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
