import 'package:desafio2pedro/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;
  const BookDetailPage({Key? key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe Livros"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Image.network(
                book.cover_url,
              ),
            ),
            const SizedBox(
              height: 22.0,
            ),
            Text(
              book.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Baixar"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
