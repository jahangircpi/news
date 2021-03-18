import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/CategoryPage/webviewcategory.dart';
import 'package:news/Controller/getxcontroller.dart';

class categorypage extends StatelessWidget {
  var country;
  var title;
  categorypage({this.title});
  var ctctx = Get.put(controller());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
          title.toString().capitalize,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(flex: 0, child: Container()),
          Expanded(child: Container(
            child: Obx(() {
              try {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: ctctx.category.value.articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print("yes");
                          Get.to(webviewCategory(
                            details: ctctx.category.value.articles[index].url,
                            source: ctctx
                                .category.value.articles[index].source.name,
                          ));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Image.network(
                                    ctctx.category.value.articles[index]
                                                .urlToImage ==
                                            null
                                        ? "https://i.pinimg.com/originals/10/b2/f6/10b2f6d95195994fca386842dae53bb2.png"
                                        : ctctx.category.value.articles[index]
                                            .urlToImage,
                                    width: double.infinity,
                                    height: size.height * 0.24,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                ctctx.category.value.articles[index].title ==
                                        null
                                    ? "Title will be displayed here"
                                    : ctctx
                                        .category.value.articles[index].title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(ctctx.category.value.articles[index]
                                          .description ==
                                      null
                                  ? "Description will be displayed here"
                                  : ctctx.category.value.articles[index]
                                      .description),
                            ],
                          ),
                        ),
                      ),
                    );
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
