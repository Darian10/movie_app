import 'package:flutter/material.dart';
import 'package:movie_app/media_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
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
      const BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up), label: "Populares"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.update), label: "Proximamente"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.star), label: "Mejor valoradas"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
        actions: [
          IconButton(
            icon: const Icon(
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
          const DrawerHeader(
            child: Material(),
          ),
          ListTile(
            title: const Text("Peliculas"),
            trailing: const Icon(Icons.local_movies),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                video = "Peliculas";
              });
            },
          ),
          const Divider(
            height: 5,
          ),
          ListTile(
            title: const Text("Television"),
            trailing: const Icon(Icons.live_tv),
            onTap: () {
              Navigator.of(context).pop();
              setState(() {
                video = "Television";
              });
            },
          ),
          const Divider(
            height: 5,
          ),
          ListTile(
            title: const Text("Cerrar"),
            trailing: const Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          ),
          const Divider(
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
