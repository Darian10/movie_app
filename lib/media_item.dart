import 'package:flutter/material.dart';
import 'package:movie_app/model/media.dart';

// ignore: must_be_immutable
class MediaItem extends StatelessWidget {
  late Media media;

  MediaItem(this.media, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(media.title),
        ),
        body: Column(
          children: [
            FadeInImage.assetNetwork(
                placeholder: "assets/placeholder.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                fadeInDuration: const Duration(milliseconds: 40),
                image: media.getBackDropUrl()),
            const Divider(),
            Text(media.overview),
          ],
        ));
  }
}
