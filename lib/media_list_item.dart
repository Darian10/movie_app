import 'package:flutter/material.dart';

import 'model/media.dart';
import 'media_item.dart';

class MediaListItem extends StatelessWidget {
  final Media media;

  // ignore: use_key_in_widget_constructors
  const MediaListItem(this.media);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          var route = MaterialPageRoute(
              builder: (BuildContext context) => MediaItem(media));

          Navigator.of(context).push(route);
        },
        child: Card(
          child: Column(
            children: [
              Stack(
                children: [
                  FadeInImage.assetNetwork(
                      placeholder: "assets/placeholder.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                      fadeInDuration: const Duration(milliseconds: 40),
                      image: media.getBackDropUrl()),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[900]?.withOpacity(0.5)),
                        constraints: const BoxConstraints(minHeight: 55),
                      )),
                  Positioned(
                      left: 10,
                      bottom: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            media.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              media.getGenres(),
                              style: const TextStyle(color: Colors.white),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
