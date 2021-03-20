import 'package:flutter/material.dart';
import 'package:news/Controller/getxcontroller.dart';
import 'package:news/HomePage/GlobalCountriesfullName.dart';

import 'package:news/Service/headlineservice.dart';
import 'package:get/get.dart';
import 'detailsglobal.dart';
import 'globalcoutries.dart';

class homepageglobal extends StatelessWidget {
  var ct = Get.put(controller());
  var apicalledglobal = NewsApi();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.cyan.withOpacity(0.9),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "News",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0.60),
        ),
        body: SafeArea(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: FullCountriesName.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    apicalledglobal
                        .fetchdata3(
                      countriesname[index].name,
                    )
                        .then((value) {
                      ct.countries.value = value;
                      Get.back();
                      Get.to(detailsglobal(
                        country: countriesname[index].name,
                        fullcountryname: FullCountriesName[index].name,
                      ));
                    });
                    print(index);
                  },
                  child: PhysicalModel(
                    color: Colors.cyan.withOpacity(0.9),
                    shadowColor: Colors.white.withOpacity(0.40),
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                    elevation: 30,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Text(
                            FullCountriesName[index].name,
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ))),
                  ),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
