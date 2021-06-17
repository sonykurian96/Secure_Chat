import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("Select Contact"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("tune search bar pe dabaya");
                },
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
          ),

          PopupMenuButton<String>(
              itemBuilder: (BuildContext context){
                return [
                  PopupMenuItem(child: Text("Invite a friend"+"\t"*2)),
                  PopupMenuItem(child: Text("Contacts"+"\t"*2)),
                  PopupMenuItem(child: Text("Refresh"+"\t"*2)),
                  PopupMenuItem(child: Text("Help"+"\t"*2)),
                ];
              }
          ),

        ],
      ),

      body : Column(
        children: [
          ListTile(
            title: Text("New group",style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            ),
            leading: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(Icons.group,
                  color: Colors.white,
                )
            ),
          ),
          ListTile(
            title: Text("New contact",style: TextStyle(
                fontWeight: FontWeight.bold
            ),
            ),
            leading: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(Icons.person_add,
                  color: Colors.white,
                )
            ),
            trailing: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Icon(Icons.qr_code,
                color: Theme.of(context).accentColor,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      );
  }
}
