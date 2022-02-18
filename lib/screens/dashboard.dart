import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hulu_app/utils/color_utils.dart';
import 'package:hulu_app/utils/text_utils.dart';
import 'package:iconly/iconly.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndexBottomBar = 0;
  int _currentSlide = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndexBottomBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      appBar: AppBar(
        backgroundColor: ColorUtils.primary,
        elevation: 0,
        title: Text(
         TextUtils.appTitle,
          style: TextStyle(
              color: ColorUtils.secondary,
              fontSize: 24,
              fontWeight: FontWeight.w800),
        ),
        bottom: TabBar(
          padding: const EdgeInsets.only(bottom: 20),
          indicatorColor: ColorUtils.secondary,
          indicatorWeight: 15,
          unselectedLabelColor: ColorUtils.primaryAccent,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: const UnderlineTabIndicator(
              insets: EdgeInsets.symmetric(horizontal: 10.0)),
          tabs: const [
            Text('Popular', style: TextStyle(fontSize: 14)),
            Text('TV Show', style: TextStyle(fontSize: 14)),
            Text('Movies', style: TextStyle(fontSize: 14)),
            Text('Hubs', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentSlide = index;
                      });
                    }),
                items: TextUtils.imgList
                    .map((item) => Center(
                        child:
                            Image.asset(item, fit: BoxFit.cover, width: 1000)))
                    .toList(),
              ),
              Positioned(
                bottom: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: TextUtils.imgList.asMap().entries.map((entry) {
                    return Container(
                      width: 9.0,
                      height: 9.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentSlide == entry.key
                              ? ColorUtils.secondary
                              : Colors.white),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Continue Watching",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    itemCount: TextUtils.imgList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Container(
                        width: 215,
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              TextUtils.imgList[i],
                              fit: BoxFit.cover,
                              height: 125,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 6,
                                  color: ColorUtils.redAccent,
                                ),
                                Container(
                                  width: 100,
                                  height: 6,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              TextUtils.movieTitle[i],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "Left at : 00:56:45",
                              style: TextStyle(
                                  color: ColorUtils.primaryAccent, fontSize: 12),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Suggested for You",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: ColorUtils.secondary, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: TextUtils.imgList2.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Container(
                        width: 150,
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              TextUtils.imgList2[i],
                              fit: BoxFit.cover,
                              width: 150,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              TextUtils.movieTitle2[i],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorUtils.primary,
          selectedItemColor: ColorUtils.secondary,
          unselectedItemColor: ColorUtils.primaryAccent,
          onTap: _onItemTapped,
          currentIndex: _selectedIndexBottomBar,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.home,
                  size: 21.0,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.play,
                  size: 21.0,
                ),
                label: "Play"),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.search,
                  size: 21.0,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  IconlyLight.profile,
                  size: 21.0,
                ),
                label: "Profile"),
          ],
        ),
      ),
    );
  }
}
