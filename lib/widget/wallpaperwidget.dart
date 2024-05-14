import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/photomodel.dart';

Widget wallpaper(List<Photomodel> listphoto, BuildContext context) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      padding: EdgeInsets.all(4.0),
      crossAxisCount: 2,
      mainAxisSpacing: 6.0,
      childAspectRatio: 0.6,
      crossAxisSpacing: 6.0,
      children: listphoto.map(
        (Photomodel photomodel) {
          return GridTile(
            child: Hero(
              tag: photomodel.src.Protrait!,
              child: CachedNetworkImage(
                imageUrl: photomodel.src.Protrait!,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          );
        },
      ).toList(),
    ),
  );
}
