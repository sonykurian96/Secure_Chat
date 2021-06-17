import 'package:chattie_ui/backend/methods.dart';
import 'package:chattie_ui/screens/customScreen.dart';
import 'package:chattie_ui/screens/select_contact.dart';

import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tabController; // nullable
  int currentTabIndex = 0;

  void onTabChange() {
    setState(() {
      currentTabIndex = tabController.index; // null check
      print(currentTabIndex);
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(() {
      onTabChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.addListener(() {
      onTabChange();
    });

    tabController.dispose();

    super.dispose();
  }

  IconData iconData() {
    return currentTabIndex == 0 || currentTabIndex == 1
        ? Icons.message_outlined
        : currentTabIndex == 2
            ? Icons.camera_alt
            : Icons.call;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text(
          'Secure Chat',
          style: MyTheme.kAppTitle,
        ),
        actions: [
          IconButton(icon: Icon(Icons.logout),
            onPressed: () => logOut(context),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
        elevation: 0,
      ),
      backgroundColor: MyTheme.kPrimaryColor,
      body: Column(
        children: [
          MyTabBar(tabController: tabController),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: TabBarView(
                controller: tabController,
                children: [
                  CustomScreen(),
                  Center(child: Text('Group')),
                  Center(child: Text('Status')),
                  Center(child: Text('Call')),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (currentTabIndex == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SelectContact()));
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          iconData(),
          color: Colors.white,
        ),
      ),
    );
  }
}
