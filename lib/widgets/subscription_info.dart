import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SubscriptionInfo extends StatefulWidget {
  const SubscriptionInfo({super.key});

  @override
  State<SubscriptionInfo> createState() => _SubscriptionInfoState();
}

class _SubscriptionInfoState extends State<SubscriptionInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 240,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: pColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.keyboard_backspace,
                              color: Colors.white,
                              weight: 20,
                              size: 30,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Subscription Info",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          const Icon(
                            Icons.help_outline,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: double.infinity,
                      height: 85,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          )),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "23/10/2023",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: pColor),
                                ),
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 30,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Here is your subscription expiry date",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 10, left: 50, right: 50, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageIcon(
                            AssetImage(
                              "assets/king.png",
                            ),
                            color: Colors.white,
                            size: 45,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ImageIcon(
                            AssetImage(
                              "assets/king.png",
                            ),
                            color: Colors.white,
                            size: 45,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          ImageIcon(
                            AssetImage(
                              "assets/king.png",
                            ),
                            color: Colors.white,
                            size: 45,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          ImageIcon(
                            AssetImage(
                              "assets/king.png",
                            ),
                            color: Colors.white,
                            size: 45,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children:List.generate(10, (index) => Card(
                  elevation: 2,
                  child: ListTile(
                    leading: const Text("1 Month",
                      style: TextStyle(fontSize: 11,color: pColor),),
                    title: const Text("Trail User",
                      style: TextStyle(fontSize: 11,color: pColor),),
                    subtitle: const Text("let me use app for next One Months",
                      style: TextStyle(fontSize: 11,color: pColor),),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pColor, // Background color
                      ),
                      child: const Text(
                        "₹90.00",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
