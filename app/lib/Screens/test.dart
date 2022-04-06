// Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(children: <Widget>[
//           //Top









//  Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Recommended for you',
//                   style: TextStyle(fontWeight: FontWeight.w900),
//                 ),
//               ),
//             ),






  // Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //             child: Container(
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 'How are you feeling?',
  //                 style: TextStyle(fontWeight: FontWeight.w900),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Container(
  //                     width: MediaQuery.of(context).size.width - 20,
  //                     margin: EdgeInsets.all(10),
  //                     child: TagsList())
  //               ]),
  //         ]),










    // Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Expanded(
    //               flex: 8,
    //               child: Text(
    //                 'What you might currently want',
    //                 style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
    //               ),
    //             ),
    //             Expanded(
    //               flex: 2,
    //               child: TextButton(
    //                   onPressed: () {},
    //                   child: Text(
    //                     'Browse',
    //                     style: TextStyle(color: mainColorTheme, fontSize: 11),
    //                   )),
    //             )
    //           ],
    //         ),
    //       ),
    //       Container(
    //           height: MediaQuery.of(context).size.height / 4,
    //           child: FutureBuilder<List<Recipe>>(
    //               future: getRecipes(),
    //               builder: (BuildContext context,
    //                   AsyncSnapshot<List<Recipe>> snapshot) {
    //                 if (snapshot.hasData) {
    //                   return ListView.builder(
    //                     scrollDirection: Axis.horizontal,
    //                     itemCount: snapshot.data?.length,
    //                     itemBuilder: (BuildContext context, int index) {
    //                       return RecipeCard(
    //                           imageURL: snapshot.data![index].imageURL,
    //                           recipeName: snapshot.data![index].name,
    //                           ingredientCount:
    //                               snapshot.data![index].ingredientCount);
    //                     },
    //                   );
    //                 } else {
    //                   return Text('Something when wrong');
    //                 }
    //               })),