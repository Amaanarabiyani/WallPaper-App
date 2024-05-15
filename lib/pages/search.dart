import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/model/photomodel.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/widget/wallpaperwidget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Photomodel> photos = [];
  TextEditingController searchcontroller = TextEditingController();
  bool search = false;
  getSearchWallpaper(String searchQuery) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"),
        headers: {
          "Authorization":
              "nbCDaCj7EyKK2dRKUg3icxZkNScOHvglbUEEnGhRa7GKYYeUDh3WFdZF"
        }).then((value) {
      Map result = jsonDecode(value.body);
      result["photos"].forEach((element) {
        Photomodel photomodel = Photomodel.fromJson(element);
        photos.add(photomodel);
        setState(() {
          search = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Wallpaper",
          style: TextStyle(
            fontFamily: "Poet",
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            // Center(
            //   child: Text(
            //     "Search WallPaper",
            //     style: TextStyle(
            //       fontFamily: "",
            //       fontSize: 30,
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xffececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                style: TextStyle(
                  fontFamily: "Poet",
                ),
                controller: searchcontroller,
                decoration: InputDecoration(
                  hintText: "Search Photos",
                  hintStyle: TextStyle(
                    fontFamily: "poppins",
                  ),
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      getSearchWallpaper(searchcontroller.text);
                    },
                    child: search
                        ? GestureDetector(
                            onTap: () {
                              photos = [];
                              photos.clear();

                              search = false;
                              searchcontroller.clear();
                              setState(() {});
                            },
                            child: Icon(Icons.close),
                          )
                        : Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: wallpaper(photos, context),
            )
          ],
        ),
      ),
    );
  }
}
