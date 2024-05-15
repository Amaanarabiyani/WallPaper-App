import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List Wallpaperimages = [
    "images/pexels-eberhardgross-1366919.jpg",
    "images/pexels-eberhardgross-1624496.jpg",
    "images/pexels-vladalex94-1402787.jpg",
    "images/mit.jpg",
    "images/pexels-eberhardgross-443446.jpg"
  ];

  List text = [
    "Mountain",
    "JawalaMukhi",
    "Cars",
    "Fireworks",
    "Water&Mountain"
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wallify",
          style: TextStyle(
            fontFamily: "Poet",
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        leading: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(60),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              "images/pro.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        // margin: EdgeInsets.only(left: 50),
        padding: EdgeInsets.only(top: 0, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                // Material(
                //   elevation: 5.0,
                //   borderRadius: BorderRadius.circular(60),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(60),
                //     child: Image.asset(
                //       "images/pro.jpg",
                //       height: 50,
                //       width: 50,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // SizedBox(width: 95),
                // Text(
                //   "Wallify",
                //   style: TextStyle(
                //     fontFamily: "Trajan Pro",
                //     fontSize: 30,
                //     color: Colors.black,
                //     // fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: Wallpaperimages.length,
              itemBuilder: (context, index, realIndex) {
                final res = Wallpaperimages[index];
                return BuiltImage(res, index);
              },
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: true,
                  animateToClosest: true,
                  pauseAutoPlayOnTouch: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  text[activeIndex],
                  style: TextStyle(
                    fontFamily: "Poet",
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            // Not That Good For Changing The Text,

            // AnimatedTextKit(
            //   isRepeatingAnimation: false,
            //   repeatForever: true,
            //   animatedTexts: [
            //     FlickerAnimatedText(
            //       text[activeIndex],
            //     ),
            //     FlickerAnimatedText(
            //       text[activeIndex],
            //     ),
            //     FlickerAnimatedText(
            //       text[activeIndex],
            //     ),
            //     FlickerAnimatedText(
            //       text[activeIndex],
            //     ),
            //     FlickerAnimatedText(
            //       text[activeIndex],
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),

            // Center(
            //   child: buildindicator(),
            // ),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 05,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotHeight: 15,
                dotWidth: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildindicator() => AnimatedSmoothIndicator(
  //       activeIndex: activeIndex,
  //       count: 5,
  //       effect: ExpandingDotsEffect(
  //         dotHeight: 15,
  //         dotWidth: 15,
  //         activeDotColor: Colors.blue,
  //         dotColor: Colors.blueGrey,
  //       ),
  //     );

  BuiltImage(String url, int index) => Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            url,
            fit: BoxFit.cover,
          ),
        ),
      );
}
