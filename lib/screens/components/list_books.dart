import 'package:desafio2pedro/models/book_model.dart';
import 'package:desafio2pedro/screens/details_book.dart';
import 'package:flutter/material.dart';

class ListBooks extends StatelessWidget {
  final BookModel book;
  const ListBooks({Key? key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              book.cover_url,
              height: 150,
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text(book.title),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.author),
              ],
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailPage(book: book),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
