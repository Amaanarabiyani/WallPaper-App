import 'package:flutter/material.dart';
import 'package:wallpaper_app/admin/admin.dart';

class AddWalpaper extends StatefulWidget {
  const AddWalpaper({super.key});

  @override
  State<AddWalpaper> createState() => _AddWalpaperState();
}

class _AddWalpaperState extends State<AddWalpaper> {
  final List<String> categoryItems = ["Nature", "Foods", "City", "Wildlife"];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add WallPaper",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Route route = MaterialPageRoute(builder: (context) => AdminPanel());
            Navigator.push(context, route);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Center(
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 5.0,
                  child: Container(
                    width: 250,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: categoryItems
                        .map(
                          (item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ),
                        )
                        .toList(),
                    onChanged: ((value) => setState(() {
                          this.value = value;
                        })),
                    hint: Text("Select Category"),
                    value: value,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
