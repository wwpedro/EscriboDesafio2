import 'package:desafio2pedro/models/book_model.dart';
import 'package:desafio2pedro/screens/details_book.dart';
import 'package:flutter/material.dart';

class ListBooks extends StatelessWidget {
  final BookModel book;
  const ListBooks({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailPage(book: book),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 5.0),
              width: 120,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Image.network(
                        book.cover_url,
                        height: 150,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            book.author,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
