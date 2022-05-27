import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';

import 'common/httpHandler.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String video = "Peliculas";
  String mediaType = "Populares";

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  List<BottomNavigationBarItem> getBottom() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.thumb_up), label: "Populares"),
      BottomNavigationBarItem(icon: Icon(Icons.update), label: "Proximamente"),
      BottomNavigationBarItem(icon: Icon(Icons.star), label: "Mejor valoradas"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            child: Material(),
          ),
          ListTile(
            title: Text("Peliculas"),
            trailing: Icon(Icons.local_movies),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                video = "Peliculas";
              });
            },
          ),
          Divider(
            height: 5,
          ),
          ListTile(
            title: Text("Television"),
            trailing: Icon(Icons.live_tv),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                video = "Television";
              });
            },
          ),
          Divider(
            height: 5,
          ),
          ListTile(
            title: Text("Cerrar"),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
          Divider(
            height: 5,
          )
        ],
      )),
      body: PageView(
        children: [MediaList(video, mediaType)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: getBottom(),
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (int item) {
          setState(() {
            if (item == 0) {
              mediaType = "Populares";
              _currentIndex = 0;
            } else if (item == 1) {
              mediaType = "Proximamente";
              _currentIndex = 1;
            } else if (item == 2) {
              mediaType = "Mejor valoradas";
              _currentIndex = 2;
            }
          });
        },
      ),
    );
  }
}
