import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/utils.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mood;
  bool _isLoaded;
  DocumentSnapshot documentSnapshot;

  @override
  void initState() {
    _isLoaded = false;
    mood = null;
    Fluttertoast.showToast(
        msg: "Logged in as ${currentUser.email}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 12.0);
    super.initState();
  }

  void getSnapshot() async {
    documentSnapshot =
        await firestore.collection(mood).doc("${random.nextInt(1)}").get();
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (mood != null) {
      getSnapshot();
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("My application"),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: double.infinity),
          child: Container(
            color: Colors.grey[300],
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Hi there, ${currentUser.displayName}! How are you feeling today?",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.sentiment_very_satisfied,
                                      color: Colors.black,
                                    ),
                                    iconSize: 35,
                                    tooltip: "Happy",
                                    onPressed: () {
                                      setState(() {
                                        mood = "Happy";
                                      });
                                    },
                                  ),
                                  Text(
                                    "Happy",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.sentiment_dissatisfied,
                                        color: Colors.black,
                                      ),
                                      iconSize: 35,
                                      tooltip: "Stressed",
                                      onPressed: () {
                                        setState(() {
                                          mood = "Stressed";
                                        });
                                      }),
                                  Text(
                                    "Stressed",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.sentiment_neutral,
                                      color: Colors.black,
                                    ),
                                    iconSize: 35,
                                    tooltip: "Bored",
                                    onPressed: () {
                                      setState(() {
                                        mood = "Bored";
                                      });
                                    },
                                  ),
                                  Text(
                                    "Bored",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.sentiment_very_dissatisfied,
                                      color: Colors.black,
                                    ),
                                    iconSize: 35,
                                    tooltip: "Depressed",
                                    onPressed: () {
                                      setState(() {
                                        mood = "Depressed";
                                      });
                                    },
                                  ),
                                  Text(
                                    "Depressed",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  (mood == null)
                      ? Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Text(
                            "select option",
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ))
                      : (!_isLoaded)
                          ? Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Text("loading"))
                          : ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minWidth: double.infinity),
                              child: Column(
                                children: [
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          documentSnapshot.data()['title'],
                                          style: ttl,
                                        ),
                                        Text(
                                          documentSnapshot.data()['text'],
                                          style: txt,
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(14),
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white),
                                  ),
                                ],
                              ))
                ],
              ),
            ),
          ),
        ));
  }
}
