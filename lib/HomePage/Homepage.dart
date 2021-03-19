import 'package:covid/Controller/controllercovid.dart';
import 'package:covid/DetailsPage/detailspage.dart';
import 'package:covid/Services/servicecovid19.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  var ctx = Get.put(controller());
  var apicalled = Apicovid19();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            title: Text("COVID-19"),
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.blue.withOpacity(0.8)),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.white,
              tabs: [
                Text(
                  "বাংলাদেশ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "World",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
          body: Obx(() {
            try {
              return TabBarView(physics: BouncingScrollPhysics(), children: [
                bangladeshsummary(),
                Container(
                  child: Column(
                    children: [
                      date(),
                      summary(),
                      serarch(),
                      Expanded(
                        child: Container(
                            color: Colors.cyan,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: ctx.onlyCountry.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: PhysicalModel(
                                    color: Colors.cyan,
                                    shadowColor: Colors.cyan,
                                    elevation: 10,
                                    child: Container(
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(detailspage(
                                              details: ctx.onlyCountry[index]));
                                        },
                                        child: Container(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: PhysicalModel(
                                                color: Colors.transparent,
                                                shadowColor: Colors.white
                                                    .withOpacity(0.5),
                                                elevation: 1,
                                                child: Text(
                                                  ctx.onlyCountry[index]
                                                      .country,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                )
              ]);
            } catch (e) {
              return Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }

//Bangladesh Tap
  bangladeshsummary() {
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 0,
            child: Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Column(
                        children: [
                          ClipPath(
                            clipper: imageClipper(),
                            child: Container(
                              child: Image.network(
                                  "https://image.freepik.com/free-vector/coronavirus-infection-banner-with-virus-red-cells_1017-24634.jpg"),
                            ),
                          ),
                          PhysicalModel(
                            color: Colors.cyan,
                            elevation: 5,
                            shape: BoxShape.circle,
                            shadowColor: Colors.cyan,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  ctx.countrieslists.value.countries[13]
                                      .country,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Case Update",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Newest Update:"),
                        Text(ctx.countrieslists.value.countries[13].date
                            .toString()
                            .split(' ')[0]
                            .toString()),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withAlpha(850)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Text(
                                ctx.countrieslists.value.countries[13]
                                    .newConfirmed
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red.withAlpha(900)),
                              ),
                            ),
                            Text(
                              "Infected",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Text(
                                ctx.countrieslists.value.countries[13].newDeaths
                                    .toString(),
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                            ),
                            Text(
                              "Deaths",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Text(
                                ctx.countrieslists.value.countries[13]
                                    .newRecovered
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 30, color: Colors.green),
                              ),
                            ),
                            Text(
                              "Recovered",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Total Reports",
                style: TextStyle(fontSize: 30),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withAlpha(850)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Text(
                                ctx.countrieslists.value.countries[13]
                                    .totalConfirmed
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red.withAlpha(900)),
                              ),
                            ),
                            Text(
                              "Infected",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Text(
                                ctx.countrieslists.value.countries[13]
                                    .totalDeaths
                                    .toString(),
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                              ),
                            ),
                            Text(
                              "Deaths",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.green),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Text(
                                ctx.countrieslists.value.countries[13]
                                    .totalRecovered
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 30, color: Colors.green),
                              ),
                            ),
                            Text(
                              "Recovered",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ],
    ));
  }

  // world tab
  date() {
    return Container(
      child: Column(
        children: [
          Text(
            "Date",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: Text(
                ctx.countrieslists.value.global.date.toString().split(" ")[0],
                style: TextStyle(fontSize: 15, color: Colors.black)),
          ),
        ],
      ),
    );
  }

  summary() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    color: Color(0xFF4761F4),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ctx.countrieslists.value.global.newConfirmed
                                .toString(),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Infected",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    color: Color(0xFFF47272),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ctx.countrieslists.value.global.newDeaths
                                .toString(),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Deaths",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    color: Color(0xFf3CD698),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ctx.countrieslists.value.global.newRecovered
                                .toString(),
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Recovered",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text("Total Reports", style: TextStyle(fontSize: 30)),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    color: Color(0xFF4761F4),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ctx.countrieslists.value.global.totalConfirmed
                                .toString(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Infected",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    color: Color(0xFFF47272),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ctx.countrieslists.value.global.totalDeaths
                                .toString(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Deaths",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    color: Color(0xFf3CD698),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ctx.countrieslists.value.global.totalRecovered
                                .toString(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Recovered",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  serarch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (v) {
          ctx.onlyCountry.value = ctx.searchFor
              .where((e) => e.country.toLowerCase().contains(v.toLowerCase()))
              .toList();
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
              borderSide: BorderSide(),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
              borderSide: BorderSide(),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(18.0)),
                borderSide: BorderSide(color: Colors.red),
                gapPadding: 100),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(18.0),
              ),
              borderSide: BorderSide(),
            ),
            hintText: "Search country"),
      ),
    );
  }
}

class imageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.80);
    path.quadraticBezierTo(
        size.width * 0.50, size.height, size.width, size.height * 0.80);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
