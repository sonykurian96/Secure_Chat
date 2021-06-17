import 'package:chattie_ui/custom_UI/ownMessageModel.dart';
import 'package:chattie_ui/custom_UI/replyCard.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../widgets/widgets.dart';

// server
class ChatRoom extends StatefulWidget {
  const ChatRoom({Key key, @required this.user}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
  final User user;
}

class _ChatRoomState extends State<ChatRoom> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(
                widget.user.avatar,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: MyTheme.chatSenderName,
                ),
                Text(
                  'online',
                  style: MyTheme.bodyText1.copyWith(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.videocam_outlined,
                size: 28,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.call,
                size: 28,
              ),
              onPressed: () {}),
          PopupMenuButton<String>(
            padding: EdgeInsets.all(0),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("View Contact"),
                  value: "View Contact",
                ),
                PopupMenuItem(
                  child: Text("Media, links, and docs"),
                  value: "Media, links, and docs",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Notification"),
                  value: "Mute Notification",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            },
          ),
        ],
        elevation: 0,
      ),
      // backgroundColor: Colors.white, //MyTheme.kPrimaryColor,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(image: new AssetImage('assets/images/chat_background.jpg'), fit: BoxFit.cover,),
            ),
          ),
          FooterLayout(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                  ReplyCard(
                    message:
                        "prajwal : aa sab mere hi udao ................................",
                    time: "8:08 pm",
                  ),
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                  ReplyCard(
                    message:
                        "prajwal : aa sab mere hi udao ................................",
                    time: "8:08 pm",
                  ),
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                  ReplyCard(
                    message:
                        "prajwal : aa sab mere hi udao ................................",
                    time: "8:08 pm",
                  ),
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                  ReplyCard(
                    message:
                        "prajwal : aa sab mere hi udao ................................",
                    time: "8:08 pm",
                  ),
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                  ReplyCard(
                    message:
                        "prajwal : aa sab mere hi udao ................................",
                    time: "8:08 pm",
                  ),
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                  ReplyCard(
                    message:
                        "prajwal : aa sab mere hi udao ................................",
                    time: "8:08 pm",
                  ),
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                  ReplyCard(
                    message:
                        "prajwal : aa sab mere hi udao ................................",
                    time: "8:08 pm",
                  ),
                  OwnMessageCard(
                    message: "yaha pe bhi prajwal ki udayenge",
                    time: "7:50 pm",
                  ),
                ],
              ),
            ),
            footer: BuildChatComposer(),
          ),
        ],
      ),
    );
  }
}
