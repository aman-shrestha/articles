// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';

// import '../../../data/api_client.dart';
// import '../post_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool isReady = false;
//   List<PostModel> postModel = [];
//   _getPost() {
//     isReady = true;
//     // isLoading.value = true.obs;
//     ApiServices().getPostWithModel().then(
//       (value) {
//         setState(() {
//           postModel = value!;
//           isReady = false;
//         });
//       },
//     );
//   }

//   @override
//   void initState() {
//     _getPost();
//     // TODO: implement initState
//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: isReady == true
//       //     ? Center(
//       //         child: CircularProgressIndicator(),
//       //       )
//       //     :
//       body: Container(
//         height: 100,
//         color: Colors.green,
//         child: ListView.builder(
//           itemCount: postModel.length,
//           itemBuilder: (context, index) => Column(
//             children: [
//               Text("data"),
//               Card(
//                 child: Text(postModel[index].articles.toString()),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
