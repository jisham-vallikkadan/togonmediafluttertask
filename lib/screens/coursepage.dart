import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:torfoncourestask/model/topcoursemodel.dart';
import 'package:torfoncourestask/screens/service/courseprovider.dart';

import '../model/categoriesmodel.dart';

class Coursepage extends StatefulWidget {
  const Coursepage({Key? key}) : super(key: key);

  @override
  State<Coursepage> createState() => _CoursepageState();
}

class _CoursepageState extends State<Coursepage> {
  // List colorss = [
  //   Colors.blue[900],
  //   Colors.red[300],
  //   Colors.green[300],
  // ];
  // Random randomcolor = new Random();
  @override
  Widget build(BuildContext context) {
    var topcourse = Provider.of<Courseprovider>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.school_outlined,
              color: Colors.orange,
            ),
            label: 'Course',
            // backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_travel,
              color: Colors.grey,
            ),
            label: 'My Course',
            // backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
            label: 'Wishlist',
            // backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Colors.grey,
            ),
            label: 'Cart',
            // backgroundColor: Colors.black
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        child: Icon(Icons.menu),
        onPressed: () {
          // Add your onPressed code here!
        },
      ),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: Container(
            margin: EdgeInsets.only(left: 10),
            child: Image(
              image: AssetImage('images/logo.jpg'),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Course',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'All Courses >',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 220,

                // color: Colors.blue,
                child: FutureBuilder<List<Topcourse>>(
                  future: topcourse.topcourses(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var coursedetails = snapshot.data![index];
                          return Card(
                            elevation: 5,
                            shape: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 170,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '${coursedetails.thumbnail}'),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                          // color: Colors.red,
                                        ),
                                        height: 120,
                                        width: 180,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          '${coursedetails.title}',
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, bottom: 10),
                                      child: Text(
                                        '${coursedetails.price}',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey),
                                      ),
                                    ),
                                    alignment: Alignment.bottomRight,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                alignment: Alignment.topLeft,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FutureBuilder<List<Categories>>(
                  future: topcourse.categories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          var categoies = snapshot.data![index];
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: topcourse.colorss[
                                topcourse.randomcolor.nextInt(topcourse.colorss.length)]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${categoies.thumbnail}'),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            topLeft: Radius.circular(10)),
                                      ),
                                      height: 100,

                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        '${categoies.name}',
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 3),
                                  child: Text(
                                    '${categoies.numberOfCourses} Courses',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
