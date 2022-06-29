import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';

import '../data/data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  _buildDrawerOption(Icon icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0
        )
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                image: AssetImage(
                  currentUser.backgroundImageUrl
                ),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor
                        )
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(
                            currentUser.profileImageUrl
                          ),
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                      )
                    )
                  ],
                )
              )
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            "Home",
            () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))
            }
          ),
          _buildDrawerOption(
            const Icon(Icons.chat),
            "Chat",
            () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))
            }
          ),
          _buildDrawerOption(
            const Icon(Icons.location_on),
            "Map",
            () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))
            }
          ),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            "Your Profile",
            () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfileScreen(user: currentUser)))
            }
          ),
          _buildDrawerOption(
            const Icon(Icons.settings),
            "Settings",
            () => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()))
            }
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                const Icon(Icons.directions_run),
                "Logout",
                () => {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()))
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}