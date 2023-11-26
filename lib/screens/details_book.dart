import 'package:desafio2pedro/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;
  const BookDetailPage({Key? key, required this.book});

  Future<void> _launchUrl(String _url) async {
    if (!await launch(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhe Livros"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue],
          ),
        ),
        child: SafeArea(
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
              ElevatedButton(
                onPressed: () {
                  String bookUrl = book.download_url;
                  _launchUrl(bookUrl);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                child: Text("Baixar"),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  textStyle: TextStyle(fontSize: 18.0),
                ),
                child: Text("Outro Botão"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
