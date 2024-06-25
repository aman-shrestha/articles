import 'package:flutter/material.dart';

class HomeDetailView extends StatelessWidget {
  final String? image;
  final String title;
  final String description;
  final String autor;
  final String publishedAt;

  HomeDetailView({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.autor,
    required this.publishedAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image == null || image!.isEmpty)
                  Container(
                    height: 200,
                    color: Colors.black,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "NO IMAGE",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                else
                  Image.network(
                    image!,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                SizedBox(height: 25),
                Text(
                  "Author",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  autor,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 25),
                Text(
                  "Published Date",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  publishedAt,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 25),
                Text(
                  "TITLE",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 25),
                Text(
                  "DESCRIPTION",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
