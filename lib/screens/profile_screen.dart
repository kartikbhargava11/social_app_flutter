import 'package:flutter/material.dart';

import '../widgets/posts_carousel.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/profile_clipper.dart';

import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({
    required this.user,
    Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _yourPostsPageController;
  late PageController _favouritesPageController;

  @override
  void initState() {
    _yourPostsPageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _favouritesPageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    image: AssetImage(
                        widget.user.backgroundImageUrl
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    color: Theme.of(context).primaryColor,
                    icon: const Icon(Icons.menu),
                    iconSize: 30.0,
                    onPressed: () => _scaffoldKey.currentState!.openDrawer()
                    ,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0,2),
                          blurRadius: 6.0
                        )
                      ]
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120.0,
                        width: 120.0,
                        image: AssetImage(
                          widget.user.profileImageUrl
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],

            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Following',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Followers',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 22.0
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                )
              ],
            ),
            PostsCarousel(pageController: _yourPostsPageController, title: "Your Posts", posts: widget.user.posts!),
            PostsCarousel(pageController: _favouritesPageController, title: "Favourites", posts: widget.user.favourites!),
          ],
        ),
      )
    );
  }
}
