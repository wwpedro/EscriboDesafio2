import 'package:desafio2pedro/controllers/book_controller.dart';
import 'package:desafio2pedro/models/book_model.dart';
import 'package:desafio2pedro/screens/components/list_books.dart';
import 'package:desafio2pedro/screens/components/load.dart';
import 'package:desafio2pedro/screens/components/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BookModel> _books = <BookModel>[];
  List<BookModel> _booksDisplay = <BookModel>[];

  bool _isloading = true;

  @override
  void initState() {
    super.initState();
    fetchBooks().then((value) {
      setState(() {
        _isloading = false;
        _books.addAll(value);
        _booksDisplay = _books;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Livraria Online",
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (!_isloading) {
                return index == 0
                    ? SearchComponent(
                        hintText: "Titulo do Livro",
                        onChanged: (searchtext) {
                          searchtext = searchtext.toLowerCase();
                          setState(() {
                            _booksDisplay = _books.where((book) {
                              var nameLowerCase = book.title.toLowerCase();
                              return nameLowerCase.contains(searchtext);
                            }).toList();
                          });
                        },
                      )
                    : ListBooks(book: _booksDisplay[index]);
              } else {
                return const LoadPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
