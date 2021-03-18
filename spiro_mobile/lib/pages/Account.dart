import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        backgroundColor: Colors.black,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "joe biden",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            EvaIcons.facebook,
                            color: Colors.blue,
                          ),
                          Text(
                            "joebidenpresident@gmail.com",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Become an Educator',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "video preference",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'download option',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'Video Playback Option',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Text(
                "Acount settings",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'Account',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'Learning Reminders',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Text(
                "Support",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'About Spiro',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'About an Educator',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                title: Text(
                  'FAQs',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
