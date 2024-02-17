import 'package:demo_ui/provider/auth_provider.dart';
import 'package:demo_ui/widgets/subscription_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/students_model.dart';
import '../utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.white54,
                child: FutureBuilder(
                  future: provider.getUserProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          const CircleAvatar(
                            maxRadius: 65,
                            backgroundImage:
                                AssetImage("assets/profile/6195145.jpg"),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/profile/download.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/profile/GooglePlus-logo-red.png"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/profile/1_Twitter-new-icon-mobile-app.jpg"),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "assets/profile/600px-LinkedIn_logo_initials.png"),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            provider.user!.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 26,
                                color: pColor),
                          ),
                          Text(
                            provider.user!.instituteName,
                            style: const TextStyle(fontSize: 11, color: pColor),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Master manipulator, deal-maker and entrepreneur",
                              style: TextStyle(fontSize: 20, color: pColor),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: ListView(
                            children: [
                              Card(
                                color: pColor,
                                margin: const EdgeInsets.only(
                                    left: 35, right: 35, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: ListTile(
                                  leading: Image.asset(
                                    'assets/icons/subscription_icon.png',
                                    color: Colors.white,
                                    width: 27,
                                    height: 27,
                                  ),
                                  title: const Text(
                                    'My Subscriptions',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  trailing: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SubscriptionInfo()));
                                    },
                                    icon: const Icon(
                                        Icons.arrow_forward_ios_outlined),
                                  ),
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.only(
                                    left: 35, right: 35, bottom: 10),
                                color: pColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.privacy_tip_sharp,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Privacy',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: pColor,
                                margin: const EdgeInsets.only(
                                    left: 35, right: 35, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.history,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Purchase History',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: pColor,
                                margin: const EdgeInsets.only(
                                    left: 35, right: 35, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const ListTile(
                                  leading: Icon(Icons.help_outline,
                                      color: Colors.white),
                                  title: Text(
                                    'Help & Support',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: pColor,
                                margin: const EdgeInsets.only(
                                    left: 35, right: 35, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.privacy_tip_sharp,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Settings',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  trailing: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: pColor,
                                margin: const EdgeInsets.only(
                                    left: 35, right: 35, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.add_reaction_sharp,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Invite a Friend',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: pColor,
                                margin: const EdgeInsets.only(
                                    left: 35, right: 35, bottom: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ))
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
