import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:spiro_mobile/connection/apiconnection.dart';
import 'package:better_player/better_player.dart';
import 'package:spiro_mobile/quiz/quizscreen.dart';

// ignore: must_be_immutable
class DetailedScreen extends StatefulWidget {
  final data;
  final user;
  final image;
  final tags;
  int likes;
  int views;

  final video;
  DetailedScreen(
      {Key key,
      this.data,
      this.user,
      this.image,
      this.tags,
      this.likes,
      this.views,
      this.video})
      : super(key: key);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
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
        backgroundColor: Colors.red[900],
        actions: [
          IconButton(
            icon: Icon(
              EvaIcons.share,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.user,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.tags,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.music_video,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Views: ${widget.views}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.thumb_up,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Likes: ${widget.likes}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(
                        child: BetterPlayer.network(
                          'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
                          betterPlayerConfiguration: BetterPlayerConfiguration(
                              aspectRatio: 16 / 9,
                              looping: true,
                              autoPlay: false,
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Quizpage()));
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Lesson Quiz",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add to WishList",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getQuizjson() {}
}
