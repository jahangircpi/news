import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/Controller/getxcontroller.dart';
import 'package:news/HomePage/GlobalCountriesfullName.dart';
import 'package:news/Service/headlineservice.dart';
import 'package:get/get.dart';
import 'detailsglobal.dart';
import 'globalcoutries.dart';

class homepageglobal extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  var ct = Get.put(controller());
  var apicalledglobal = NewsApi();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: WillPopScope(
        onWillPop: () {
          return Get.dialog(AlertDialog(
            title: Text("Alert!"),
            content: Text("Are you sure you want to exit?"),
            actions: [
              FlatButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
          ));
        },
        child: Scaffold(
          backgroundColor: Colors.cyan.withOpacity(0.9),
          appBar: AppBar(
            centerTitle: true,
            title: Text("News"),
            elevation: 10,
            backgroundColor: Colors.cyan.withOpacity(0.60),
          ),
          body: SafeArea(child: Obx(() {
            try {
              return Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0), child: search()),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: ct.coname.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  apicalledglobal
                                      .fetchdata3(
                                    ct.coname[index].shortname,
                                  )
                                      .then((value) {
                                    ct.countries.value = value;
                                    Get.back();
                                    Get.to(detailsglobal(
                                      country: countriesname[index].name,
                                      fullcountryname:
                                          FullCountriesName[index].name,
                                    ));
                                  });
                                },
                                child: PhysicalModel(
                                  color: Colors.cyan.withOpacity(0.9),
                                  shadowColor: Colors.white.withOpacity(0.40),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80)),
                                  elevation: 30,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80)),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(28.0),
                                        child: Text(
                                          ct.coname[index].name,
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } catch (e) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
        ),
      ),
    );
  }

  search() {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.only(left: 100),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
              borderSide: BorderSide(color: Colors.red),
              gapPadding: 100),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18.0),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: "Search country",
          hintStyle: TextStyle(color: Colors.white, fontSize: 25)),
      onChanged: (v) {
        ct.coname.value = ct.searchlist
            .where((e) => e.name.toLowerCase().contains(v.toLowerCase()))
            .toList();
      },
    );
  }
}
