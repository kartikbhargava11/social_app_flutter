import 'package:flutter/material.dart';

import '../widgets/following_users.dart';
import '../widgets/posts_carousel.dart';
import '../widgets/custom_drawer.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor
        ),
        title: Text(
          "FRENZY",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0
          )
        ),
        bottom: TabBar(
          onTap: (int val) {
          },
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 18.0,
          ),
          tabs: const [
            Tab(
              text: "Trending"
            ),
            Tab(
              text: "Latest"
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          const FollowingUsers(),
          PostsCarousel(
            pageController: _pageController,
            title: "Posts",
            posts: posts,
          ),
        ],
      )
    );
  }
}
