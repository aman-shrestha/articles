import 'package:articles/app/modules/home/multi_data_model.dart';
import 'package:articles/app/modules/home/views/home.dart';
import 'package:articles/app/modules/home/views/home_detail_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/api_client.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isReady = false;
  MultiData? multiData;

  _getMultiData() async {
    setState(() {
      isReady = true;
    });

    try {
      multiData = await ApiServices().getMultiDataWithOutModel();
    } catch (e) {
      print("Error fetching data: $e");
    }

    setState(() {
      isReady = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getMultiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ARTICLES"),
      ),
      body: isReady
          ? Center(
              child: CircularProgressIndicator(),
            )
          : multiData == null
              ? Center(
                  child: Text("Failed to load data"),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "Total Results " + multiData!.totalResults.toString(),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: multiData!.articles?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeDetailView(
                                      image: multiData!
                                          .articles![index].urlToImage!,
                                      title: multiData!.articles![index].title
                                          .toString(),
                                      description: multiData!
                                          .articles![index].description
                                          .toString(),
                                      autor: multiData!.articles![index].author
                                          .toString(),
                                      publishedAt: multiData!
                                          .articles![index].publishedAt
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    if (multiData!
                                                .articles![index].urlToImage !=
                                            null &&
                                        multiData!.articles![index].urlToImage!
                                            .isNotEmpty)
                                      Image.network(
                                        multiData!.articles![index].urlToImage!,
                                        fit: BoxFit.cover,
                                        height: 200,
                                        width: double.infinity,
                                      )
                                    else
                                      Container(
                                        height: 200,
                                        color: Colors.black,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.image,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                "NO IMAGE",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ListTile(
                                      title: Text(
                                        multiData!.articles![index].title ??
                                            'No title',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        multiData!
                                                .articles![index].description ??
                                            'No description',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
