// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

abstract class AllWallpaper extends StatefulWidget {
  late String Category;
  AllWallpaper({required this.Category});

  @override
  State<AllWallpaper> createState() => _AllWallpaperState();
}

class _AllWallpaperState extends State<AllWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.Category,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
