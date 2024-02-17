import 'package:demo_ui/charts/LineChart.dart';
import 'package:demo_ui/charts/PricePoints.dart';
import 'package:demo_ui/src/pages/revenu_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/colors.dart';


class Revenue extends StatelessWidget {
   const Revenue({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color:  pColor.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset:  const Offset(0, 3),
                ),
              ],
            ),
            width: double.infinity,
            height: 80, // Adjust the height to accommodate text
            padding:
             const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Add padding
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:  [
                 const SizedBox(width: 8),
                IconButtonColumn(
                  icon: Icons.home,
                  text: 'Overview',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  const Revenue(), // Navigate to SecondScreen
                      ),
                    );// Navigator.push(context, MaterialPageRoute(builder: (context) => OverviewPage()));
                  },
                ),
                 const SizedBox(width: 20),
                IconButtonColumn(
                  icon: Icons.people,
                  text: 'Due Fee',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DueFee()));
                  },
                ),
                 const SizedBox(width: 20),
                IconButtonColumn(
                  icon: Icons.list,
                  text: 'Collected Fee',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CollectedFee()));
                  },
                ),
                 const SizedBox(width: 20),
                IconButtonColumn(
                  icon: Icons.assignment,
                  text: 'Expenses',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Expenses()));
                  },
                ),
                 const SizedBox(width: 20),
              ],
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(top: 10),
            child: Container(
              decoration:   const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: pColor,
                width: 1,
              ))),
              child:   const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      shadowColor: pColor,
                      margin: EdgeInsets.only(top: 2),
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.solidPenToSquare,
                              color: pColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Due Fees",
                              style: TextStyle(fontSize: 16,color: pColor),
                            ),
                            Text(
                              "Active Students",
                              style: TextStyle(fontSize: 11,color: pColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("0.0/-",
                                      style: TextStyle(fontSize: 11,color: pColor),),
                                    Text("Total Due",
                                      style: TextStyle(fontSize: 11,color: pColor),),
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("0",
                                      style: TextStyle(fontSize: 11,color: pColor),),
                                    Text(
                                      "Students",
                                      style: TextStyle(fontSize: 11,color: pColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Card(
                      shadowColor: pColor,
                      margin: EdgeInsets.only(top: 2),
                      elevation: 4,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FontAwesomeIcons.solidPenToSquare,
                              color: pColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Due Fees",
                              style: TextStyle(fontSize: 16,color: pColor),
                            ),
                            Text(
                              "Closed Students",
                              style: TextStyle(fontSize: 11,color: pColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("0.0/-",
                                      style: TextStyle(fontSize: 11,color: pColor),),
                                    Text("Total Due",
                                      style: TextStyle(fontSize: 11,color: pColor),),
                                  ],
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("0",
                                      style: TextStyle(fontSize: 11,color: pColor),),
                                    Text(
                                      "Students",
                                      style: TextStyle(fontSize: 11,color: pColor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(
              top: 10,
            ),
            child: Container(
              decoration:   const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: pColor,
                width: 1,
              ))),
              width: double.infinity,
              height: 340,

              child: Padding(
                padding:  const EdgeInsets.only(top: 10,left: 16,right: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:  pColor,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child:  const Center(
                          child: Text(
                            "Collected Fees",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ,fontFamily: 'Mooli' ),
                          ),
                        ),
                      ),
                       const SizedBox(
                        height: 10,
                      ),
                      Card(
                        shadowColor:  pColor,
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding:  const EdgeInsets.all(4.0),
                          child: LineChartWidget(
                            points: pricePoints,
                          ),
                        ),
                      ),
                       const SizedBox(
                        height: 20,
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color:  pColor,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color:  pColor.withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset:  const Offset(0, 3), // Offset for the shadow
                                ),
                              ],

                            ),
                            child:  const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text("0.0/-",style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  Text("Today",style: TextStyle(color: Colors.white,),),

                                ],
                              ),
                            ),
                          ),
                           const SizedBox(
                            width: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:  pColor,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color:  pColor.withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset:  const Offset(0, 3), // Offset for the shadow
                                ),
                              ],

                            ),
                            child:  const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text("0.0",style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  Text("Sept-2023",style: TextStyle(color: Colors.white,),),
                                ],
                              ),
                            ),
                          ),
                           const SizedBox(
                            width: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:  pColor,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color:  const Color(0xB63095A8).withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset:  const Offset(0, 3), // Offset for the shadow
                                ),
                              ],

                            ),
                            child:  const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text("0.0",style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  Text("All Time",style: TextStyle(color: Colors.white,),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
          Padding(
            padding:  const EdgeInsets.only(
              top: 10,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 340,

              child: Padding(
                padding:  const EdgeInsets.only(top: 10,left: 16,right: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:  pColor,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child:  const Center(
                          child: Text(
                            "Expenses",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                                ,fontFamily: 'Mooli' ),
                          ),
                        ),
                      ),
                       const SizedBox(
                        height: 10,
                      ),
                      Card(
                        shadowColor:  pColor,
                        elevation: 4,
                        color: Colors.white,
                        child: Padding(
                          padding:  const EdgeInsets.all(4.0),
                          child: LineChartWidget(
                            points: pricePoints,
                          ),
                        ),
                      ),
                       const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color:  pColor,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color:  const Color(0xB63095A8).withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset:  const Offset(0, 3), // Offset for the shadow
                                ),
                              ],

                            ),
                            child:  const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text("0.0/-",style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  Text("Today",style: TextStyle(color: Colors.white,),),

                                ],
                              ),
                            ),
                          ),
                           const SizedBox(
                            width: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:  pColor,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color:  const Color(0xB63095A8).withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset:  const Offset(0, 3), // Offset for the shadow
                                ),
                              ],

                            ),
                            child:  const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text("0.0",style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  Text("Sept-2023",style: TextStyle(color: Colors.white,),),
                                ],
                              ),
                            ),
                          ),
                           const SizedBox(
                            width: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:  pColor,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color:  const Color(0xB63095A8).withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset:  const Offset(0, 3), // Offset for the shadow
                                ),
                              ],

                            ),
                            child:  const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Text("0.0",style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  Text("All Time",style: TextStyle(color: Colors.white,),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconButtonColumn extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

   const IconButtonColumn({super.key,
    required this.icon,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30.0, color:  pColor),
           const SizedBox(height: 8),
          Text(text, style:  const TextStyle(color: pColor)),
        ],
      ),
    );
  }
}
