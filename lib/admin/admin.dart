import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'package:wallpaper_app/admin/add_wallpaper.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffededeb),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2),
                padding: EdgeInsets.only(top: 45.0, left: 20, right: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 53, 51, 51),
                      Colors.black,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(
                      MediaQuery.of(context).size.width,
                      110.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Form(
                  child: Column(
                    children: [
                      Text(
                        "Let's Start From\nAdmin",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                          fontFamily: "Trajan Pro",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5.0,
                                  bottom: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: usernamecontroller,
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return "Please Enter UserName";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5.0,
                                  bottom: 5.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: passwordcontroller,
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return "Please Enter passwod";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(
                                      fontFamily: "poppins",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Route route = MaterialPageRoute(
                                  //     builder: (context) => AddWalpaper());
                                  // Navigator.push(context, route);
                                  LoginAdmin();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'poppins',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((Snapshot) {
      Snapshot.docs.forEach((result) {
        if (result.data()["id"] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Your Id Is Not Correct",
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontFamily: "Trajan Pro",
              ),
            ),
          ));
        }
        if (result.data()["Password"] != passwordcontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Your Password Is Not Correct",
              style: TextStyle(
                // fontWeight: FontWeight.w100,
                fontFamily: "Trajan Pro",
              ),
            ),
          ));
        } else {
          Route route = MaterialPageRoute(builder: (context) => AddWalpaper());
          Navigator.push(context, route);
        }
      });
    });
  }
}
