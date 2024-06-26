import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../db_helper.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Articles"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DBHelper().getFavorites(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.isEmpty) {
            return Center(child: Text("No favorite articles yet."));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var article = snapshot.data![index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: ListTile(
                  title: Text(
                    article['title'],
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  subtitle: Text(
                    article['description'],
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  leading:
                      article['image'] != null && article['image'].isNotEmpty
                          ? Image.network(article['image'],
                              fit: BoxFit.cover, width: 100)
                          : Container(
                              width: 100,
                              color: Colors.black,
                              child: Icon(Icons.image, color: Colors.white)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
