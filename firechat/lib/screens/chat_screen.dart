import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechat/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = "/chat";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String curUserEmail;
  String chatText;
  final controller = TextEditingController();

  Future<void> addChat() async {
    final curUser = await _auth.currentUser();
    final chat = Chat(user: curUser.email, text: chatText);
    await Firestore.instance
        .collection("chats")
        .document()
        .setData(chat.toJson());
    controller.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _auth.currentUser().then((usr) {
      setState(() {
        curUserEmail = usr.email;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                      stream:
                          Firestore.instance.collection('chats').snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return new Text("Error");
                        }

                        if (snapshot.connectionState !=
                            ConnectionState.waiting) {
                          return ListView(
                              reverse: true,
                              children: snapshot.data.documents.reversed
                                  .map((document) {
                                print(document.data);
                                return Container(
                                  color: document['user'] == curUserEmail
                                      ? Colors.cyan
                                      : Colors.blue,
                                  child: ListTile(
                                    title: Text(document['text']),
                                    subtitle: Text(document['user']),
                                  ),
                                );
                              }).toList());
                        } else {
                          return new Text("Loading...");
                        }
                      })),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Hello",
                      ),
                      controller: controller,
                      onChanged: (newText) {
                        chatText = newText;
                      },
                    ),
                  ),
                ),
                FlatButton(
                  child: Icon(Icons.send),
                  onPressed: () {
                    addChat();
                  },
                )
              ],
            ),
            SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
