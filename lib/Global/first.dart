//  Obx(() {
//               try {
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   itemCount: ctx.countrieslists.value.countries.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         child: Column(
//                           children: [
//                             Text(
//                               ctx.countrieslists.value.countries[index].country,
//                             ),
//                             Text(
//                               ctx.countrieslists.value.countries[index]
//                                   .totalDeaths
//                                   .toString(),
//                             ),
//                             Text(
//                               ctx.countrieslists.value.countries[index].date
//                                   .toString(),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               } catch (e) {
//                 return Center(child: CircularProgressIndicator());
//               }
//             }),
