import 'package:flutter/material.dart';
import 'common/httpHandler.dart';
import 'model/media.dart';

import 'media_list_item.dart';

class MediaList extends StatefulWidget {
  late final String mediaType;
  late final String video;
  MediaList(this.video, this.mediaType);

  @override
  _MediaListState createState() => new _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> media = [];
  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    loadMovies();
  }

  @override
  void didUpdateWidget(covariant MediaList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    loadMovies();
  }

  void loadMovies() async {
    var movies =
        await HttpHandler(widget.video, widget.mediaType).fetchMovies();

    setState(() {
      scrollController.animateTo(0,
          duration: Duration(milliseconds: 50), curve: Curves.easeOut);
      media.clear();
      media.addAll(movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: media.length,
          controller: scrollController,
          itemBuilder: (BuildContext context, int index) => Column(
                children: [MediaListItem(media[index])],
              )),
    );
  }
}
