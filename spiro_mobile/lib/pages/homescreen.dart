import 'package:flutter/material.dart';
import 'package:spiro_mobile/connection/apiconnection.dart';

import 'package:spiro_mobile/pages/detailscreen/detailscreen.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/favicon.png',
          fit: BoxFit.contain,
          height: 40,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            onPressed: () {
              print("basket window");
            },
          )
        ],
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Featured",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getPics(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  Map data = snapshot.data;
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Swiper(
                        itemWidth: 500,
                        itemHeight: 300,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailedScreen(
                                            user: data['hits'][index]['user'],
                                            views: data['hits'][index]['views'],
                                            likes: data['hits'][index]['likes'],
                                            tags: data['hits'][index]['tags'],
                                            image: data['hits'][index]
                                                ['userImageURL'],
                                            video: data['hits'][index]['videos']
                                                ['medium']['url'],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 175,
                                        // width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    '${data['hits'][index]['userImageURL']}'))),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, minHeight: 25),
                                            child: Text(
                                              '${data['hits'][index]['user']}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, minHeight: 38),
                                            child: Text(
                                              '${data['hits'][index]['tags']}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Views :"
                                                  '${data['hits'][index]['views']}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "likes:"
                                                  '${data['hits'][index]['likes']}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      // author code
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 1.0),
                                      //   child: Container(
                                      //       child: Text(
                                      //     snapshot.data[index].title,
                                      //     style: TextStyle(
                                      //         color: Colors.grey, fontSize: 10),
                                      //   )),
                                      // ),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   children: [
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Center(
                        child: Text('Not found data'),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                "Top Rated",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getPics(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  Map data = snapshot.data;
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Swiper(
                        itemWidth: 500,
                        itemHeight: 300,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        viewportFraction: 0.5,
                        scale: 0.7,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailedScreen(
                                            user: data['hits'][index]['user'],
                                            views: data['hits'][index]['views'],
                                            likes: data['hits'][index]['likes'],
                                            tags: data['hits'][index]['tags'],
                                            image: data['hits'][index]
                                                ['userImageURL'],
                                            video: data['hits'][index]['videos']
                                                ['medium']['url'],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        // width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    '${data['hits'][index]['userImageURL']}'))),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, minHeight: 25),
                                            child: Text(
                                              '${data['hits'][index]['user']}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, minHeight: 38),
                                            child: Text(
                                              '${data['hits'][index]['tags']}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Views :"
                                                  '${data['hits'][index]['views']}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "likes:"
                                                  '${data['hits'][index]['likes']}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      // author code
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 1.0),
                                      //   child: Container(
                                      //       child: Text(
                                      //     snapshot.data[index].title,
                                      //     style: TextStyle(
                                      //         color: Colors.grey, fontSize: 10),
                                      //   )),
                                      // ),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   children: [
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Center(
                        child: Text('Not found data'),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getPics(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  Map data = snapshot.data;
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Swiper(
                        itemWidth: 500,
                        itemHeight: 300,
                        layout: SwiperLayout.DEFAULT,
                        scrollDirection: Axis.horizontal,
                        itemCount: data.length,
                        viewportFraction: 0.5,
                        scale: 0.7,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailedScreen(
                                            user: data['hits'][index]['user'],
                                            views: data['hits'][index]['views'],
                                            likes: data['hits'][index]['likes'],
                                            tags: data['hits'][index]['tags'],
                                            image: data['hits'][index]
                                                ['userImageURL'],
                                            video: data['hits'][index]['videos']
                                                ['medium']['url'],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 150,
                                        // width: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    '${data['hits'][index]['userImageURL']}'))),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, minHeight: 25),
                                            child: Text(
                                              '${data['hits'][index]['user']}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, minHeight: 38),
                                            child: Text(
                                              '${data['hits'][index]['tags']}',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 200, maxHeight: 100),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "Views :"
                                                  '${data['hits'][index]['views']}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "likes:"
                                                  '${data['hits'][index]['likes']}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                      // author code
                                      // Padding(
                                      //   padding: const EdgeInsets.only(top: 1.0),
                                      //   child: Container(
                                      //       child: Text(
                                      //     snapshot.data[index].title,
                                      //     style: TextStyle(
                                      //         color: Colors.grey, fontSize: 10),
                                      //   )),
                                      // ),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.start,
                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                      //   children: [
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //     Icon(
                                      //       EvaIcons.star,
                                      //       color: Colors.yellow,
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Center(
                        child: Text('Not found data'),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
