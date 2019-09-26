import 'package:flutter/material.dart';
import 'package:whatsapp/pages/calls_screen.dart';
import 'package:whatsapp/pages/camera_screen.dart';
import 'package:whatsapp/pages/chat_screen.dart';
import 'package:whatsapp/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget  {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {

  // ignore: unused_field
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1,length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.camera_alt),),
            Tab(text: "DESC",),
            Tab(text: "STATUS",),
            Tab(text: "CALLS",)
          ],
            controller: _tabController,
          indicatorColor: Colors.white,
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(
            Icons.more_vert,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
          children: <Widget>[
            CameraScreen(),
            ChatScreen(),
            StatusScreen(),
            CallsScreen(),
          ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
          child: Icon(
              Icons.message,
              color: Colors.white,
          ),
          onPressed: () => print("open chat"),
      ),
    );
  }
}
