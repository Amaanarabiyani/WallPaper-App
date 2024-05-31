// ignore_for_file: must_be_immutable
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/service/database.dart';

class AllWallpaper extends StatefulWidget {
  String Category;
  AllWallpaper({required this.Category});

  @override
  State<AllWallpaper> createState() => _AllWallpaperState();
}

class _AllWallpaperState extends State<AllWallpaper> {
  getontheLoad() async {
    categoryStream = await DataBaseMethod().getCategory(widget.Category);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheLoad();
  }

  Stream? categoryStream;

  Widget allWallpaper() {
    return StreamBuilder(
      stream: categoryStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6.0,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 6.0,
                ),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        ds["url"],
                        fit: BoxFit.cover,
                        
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }

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
            Expanded(child: allWallpaper()),
          ],
        ),
      ),
    );
  }
}
