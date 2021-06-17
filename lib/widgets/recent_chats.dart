import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/message_model.dart';
import '../screens/screen.dart';

// import '../app_theme.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Container(
    //       padding: EdgeInsets.only(top: 30),
    //       child: Row(
    //         children: [
    //           Text(
    //             'Recent Chats',
    //             style: MyTheme.heading2,
    //           ),
    //           Spacer(),
    //           Icon(
    //             Icons.search,
    //             color: MyTheme.kPrimaryColor,
    //           )
    //         ],
    //       ),
    //     ),
     return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0), // 10
      child: Column(
            children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0), // 20
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Recent Contacts',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_horiz,
              ),
              iconSize: 30.0,
              color: Colors.blueGrey,
              onPressed: () {},
            ),
          ],
        ),
      ),
      Container(
        height: 100.0,
        child: ListView.builder(
          // padding: EdgeInsets.only(left: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: recentChats.length,
        
          itemBuilder: (BuildContext context, int index) {
            final recentChat = recentChats[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatRoom(
                          user: recentChat.sender,
                        )
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15.0,5.0,15.0,0.0),// EdgeInsets.all(15.0),  // 15,5,15,0
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage:
                          AssetImage(recentChat.avatar),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      recentChat.sender.name,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
            ],
          ),
    );
  }
}
