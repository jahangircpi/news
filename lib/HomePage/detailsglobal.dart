import 'package:flutter/material.dart';
import 'package:news/CategoryPage/categorypage.dart';
import 'package:news/Controller/getxcontroller.dart';
import 'package:news/Service/headlineservice.dart';
import 'package:get/get.dart';

import 'detailspage.dart';

class detailsglobal extends StatelessWidget {
  var ctx = Get.put(controller());
  var extrem = NewsApi();

  var country;
  var fullcountryname;
  detailsglobal({this.country, this.fullcountryname});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var articlelist = ctx.topheadlinelists.value.articles;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          fullcountryname,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 0,
              child: Container(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: CatLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PhysicalModel(
                        color: Colors.cyan,
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            Get.dialog(Dialog(
                              child: Container(
                                height: 400,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              ),
                            ));

                            extrem
                                .fetchdata2(
                              country: country,
                              category: "${CatLists[index].title}",
                            )
                                .then((value) {
                              print(value);
                              ctx.category.value = value;

                              Get.back();
                              Get.to(
                                  categorypage(title: CatLists[index].title));
                            });
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black)),
                                  child: Image.network(
                                    CatLists[index].imageurl,
                                    fit: BoxFit.cover,
                                    height: size.height * 0.13,
                                    width: size.width * 0.35,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    CatLists[index].title.toString().capitalize,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
          Expanded(child: Container(
            child: Obx(() {
              try {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: ctx.countries.value.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return container(
                        detailsurl: ctx.countries.value.articles[index].url,
                        imageurl:
                            ctx.countries.value.articles[index].urlToImage,
                        title: ctx.countries.value.articles[index].title,
                        description:
                            ctx.countries.value.articles[index].description,
                        height: size.height * 0.24,
                        source: ctx.countries.value.articles[index].source.name
                            .toString());
                  },
                );
              } catch (e) {
                return Center(child: CircularProgressIndicator());
              }
            }),
          ))
        ],
      )),
    );
  }
}

Widget container({imageurl, title, description, height, detailsurl, source}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        Get.to(detailspage(
          detailsurl: detailsurl,
          source: source,
        ));
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: Image.network(
                  imageurl == null
                      ? "https://i.pinimg.com/originals/10/b2/f6/10b2f6d95195994fca386842dae53bb2.png"
                      : imageurl,
                  width: double.infinity,
                  height: height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title == null ? "Title will be displayed here" : title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(description == null
                ? "Description will be displayed here"
                : description),
          ],
        ),
      ),
    ),
  );
}

class categorylist {
  var title;
  var imageurl;
  categorylist({this.title, this.imageurl});
}

List<categorylist> CatLists = [
  categorylist(
      title: "business",
      imageurl:
          "https://img.freepik.com/free-photo/business-brainstorming-graph-chart-report-data-concept_53876-31213.jpg?size=626&ext=jpg"),
  categorylist(
      title: "entertainment",
      imageurl:
          "https://images.unsplash.com/photo-1601407422822-a53f7f7a09c4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
  categorylist(
      title: "general",
      imageurl:
          "https://images.unsplash.com/photo-1503497928123-ae945f95fd2f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
  categorylist(
      title: "health",
      imageurl:
          "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
  categorylist(
      title: "science",
      imageurl:
          "https://images.unsplash.com/photo-1517976487492-5750f3195933?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
  categorylist(
      title: "sports",
      imageurl:
          "https://images.unsplash.com/photo-1612811549877-c45e76353a7d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
  categorylist(
      title: "technology",
      imageurl:
          "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80")
];
