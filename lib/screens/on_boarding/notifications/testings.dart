// import 'package:flutter/material.dart';

// import 'models/notification_model.dart';

// class GridItem extends StatefulWidget {
//   final Key? key;
//   final Item? item;
//   final ValueChanged<bool> isSelected1;

//   GridItem({this.item, required this.isSelected1, this.key});

//   @override
//   _GridItemState createState() => _GridItemState();
// }

// class _GridItemState extends State<GridItem> {
//   bool isSelected = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         setState(() {
//            isSelected = !isSelected;
//           widget.isSelected1(isSelected);
//         });
//       },
//       child: Stack(
//         children: <Widget>[
//           Image.asset(
//             widget.item!.imageUrl,
//             color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
//             colorBlendMode: BlendMode.color,
//           ),
//           isSelected
//               ? Align(
//                   alignment: Alignment.bottomRight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.check_circle,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }
// }

// class TestingWork extends StatefulWidget {
//   const TestingWork({Key? key}) : super(key: key);

//   @override
//   _TestingWorkState createState() => _TestingWorkState();
// }

// class _TestingWorkState extends State<TestingWork> {
//    List<Item> itemList = [
//       Item(imageUrl: "lib/assets/matImage1.png", rank: 1),
//       Item(imageUrl: 'lib/assets/matImage1.png', rank: 2),
//       Item(imageUrl: 'lib/assets/matImage1.png', rank: 1),
//       Item(imageUrl: 'lib/assets/matImage1.png', rank: 2)
//     ];
//     List<Item> selectedList = [];
//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(selectedList.isEmpty
//             ? "Multi Selection"
//             : "${selectedList.length} item selected"),
//         actions: <Widget>[
//           selectedList.length < 1
//               ? Container()
//               : InkWell(
//                   onTap: () {
//                     setState(() {
//                       for (int i = 0; i < selectedList.length; i++) {
//                         itemList.remove(selectedList[i]);
//                       }
//                       selectedList = [];
//                     });
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(Icons.delete),
//                   ))
//         ],
//       ),
//       // body: Center(child: Text('hello world', style: TextStyle(fontSize: 100),)),
//       body: GridView.builder(
//           itemCount: itemList.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4,
//               childAspectRatio: 0.56,
//               crossAxisSpacing: 2,
//               mainAxisSpacing: 2),
//           itemBuilder: (context, index) {
//             return GridItem(
//                 item: itemList[index],
//                 isSelected1: (bool value) {
//                   setState(() {
//                     if (value) {
//                       selectedList.add(itemList[index]);
//                     } else {
//                       selectedList.remove(itemList[index]);
//                     }
//                   });
//                   print("$index : $value");
//                   print(selectedList[0].imageUrl);
//                 },
//                 key: Key(itemList[index].rank.toString()));
//           }),
//     );
//   }
// }

