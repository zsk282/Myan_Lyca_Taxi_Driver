import 'package:flutter/material.dart';
// import 'package:floating_search_bar/floating_search_bar.dart';
import '../widgets/SideDrawerWidget.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class ToAndFromSearch extends StatefulWidget{
  @override
  State<ToAndFromSearch> createState() {
    return ToAndFromSearchState();
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class ToAndFromSearchState extends State<ToAndFromSearch> {
  @override
  Widget build(BuildContext context) {
    return withDrawer();
    
    // Container(
    //   child: Column(
    //     children: <Widget>[
    //       withDrawer(),
    //       // withoutDrawer()
    //     ],
    //   ),
    // );
  }
  
  Widget withDrawer(){
    return SearchBar();
  }
  
  Widget withoutDrawer(){

  }
  
  // Widget withDrawer(){
  //   return FloatingSearchBar.builder(
  //     itemCount: 3,
  //     itemBuilder: (BuildContext context, int index) {
  //       return ListTile(
  //         leading: Text(index.toString()),
  //       );
  //     },
  //     // trailing: CircleAvatar(
  //     //   child: Text("RD"),
  //     // ),
  //     drawer: SideDrawerWidget(),
  //     onChanged: (String value) {
  //       print(">>>>>>>>>>>>>>>>>>>>> Clicked on from area <<<<<<<<<<<<<<<<<<<<<<<<<<");
  //       print(value);
  //     },
  //     onTap: () {},
  //     decoration: InputDecoration.collapsed(
  //       hintText: "Search...",
  //     ),
  //   );
  // }

  // Widget withoutDrawer(){
  //   return FloatingSearchBar.builder(
  //     itemCount: 3,
  //     itemBuilder: (BuildContext context, int index) {
  //       return ListTile(
  //         leading: Text(index.toString()),
  //       );
  //     },
  //     // trailing: CircleAvatar(
  //     //   child: Text("RD"),
  //     // ),
  //     // drawer: SideDrawerWidget(),
  //     onChanged: (String value) {
  //       print(">>>>>>>>>>>>>>>>>>>>> Clicked on destination area <<<<<<<<<<<<<<<<<<<<<<<<<<");
  //       print(value);
  //     },
  //     onTap: () {},
  //     decoration: InputDecoration.collapsed(
  //       hintText: "Search...",
  //     ),
  //   );
  // }
}

// import 'package:flappy_search_bar/search_bar_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flappy_search_bar/flappy_search_bar.dart';

// class Post {
//   final String title;
//   final String description;

//   Post(this.title, this.description);
// }

// class Home extends StatelessWidget {
//   Future<List<Post>> search(String search) async {
//   await Future.delayed(Duration(seconds: 2));
//   return List.generate(search.length, (int index) {
//     return Post(
//       "Title : $search $index",
//       "Description :$search $index",
//     );
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SearchBar<Post>(
//             onSearch: search,
//             onItemFound: (Post post, int index) {
//               return ListTile(
//                 title: Text(post.title),
//                 subtitle: Text(post.description),
//               );
//             },
//             loader: Text("Searching Locations"),
//             searchBarStyle: SearchBarStyle(
//               backgroundColor: Colors.lightBlue,
//               padding: EdgeInsets.all(10),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             // icon: Icon(Icons.add_circle),
//           ),
//         ),
//       ),
//     );
//   }
// }