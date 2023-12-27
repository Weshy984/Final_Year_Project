import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiqiti/reusable_widgets/reusable_widgets.dart';
import 'package:tiqiti/screens/search_screen.dart';
import 'package:tiqiti/screens/ticket_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fromTextController = TextEditingController();
  final TextEditingController _toTextController = TextEditingController();
  final TextEditingController _dateTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body:ListView(
          children: [
            const SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50,left: 10),
                      child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/logo.png"
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('TIQITI',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontFamily: 'JetBrains Mono',
                                    fontWeight: FontWeight.w700,)
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              'Convenience in transportation',
                              style: TextStyle(
                                color: Color(0xFF9291B1),
                                fontSize: 18,
                                fontFamily: 'Cambo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40,left: 20),
                      child: Image(image: AssetImage("assets/images/person_icon.png")),)
                  ],
                )
            ),
            const Gap(20),
            Padding(padding: const EdgeInsets.only(left: 20,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Choose Route',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> const SearchScreen()));
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        color: Color(0xFFE63946),
                        fontSize: 20,
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Container(
                height: 380,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: (){
                                if (kDebugMode) {
                                  print("one way trip");
                                }
                              },
                              child: const Text(
                                'One-way ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'JetBrains Mono',
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                          ),
                          const Gap(20),
                          GestureDetector(
                            onTap: (){
                              if (kDebugMode) {
                                print("round trip");

                              }},
                            child: const Text(
                                'Round-trip',
                                style: TextStyle(
                                  color: Color(0xFF9291B1),
                                  fontSize: 20,
                                  fontFamily: 'JetBrains Mono',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                )
                            ),
                          )
                        ],
                      ),
                      const Gap(20),
                      reusableTextField2("Enter Pickup", Icons.navigation_outlined, _fromTextController),
                      const Gap(20),
                      reusableTextField2("Enter Destination", Icons.place, _toTextController),
                      const Gap(20),
                      reusableTextField2("Travel Date", Icons.calendar_today_outlined, _dateTextController),
                      const Gap(20),
                      reusableTextField2("Return Date", Icons.add, _dateTextController),
                      const Gap(20),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>const SearchScreen())
                                );
                                print("btn clicked");
                              },
                              style: ButtonStyle(
                                  backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xffa8dadc)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                              ),
                              child: const Text('Search',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Upcoming Trips',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> const SearchScreen()));
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        color: Color(0xFFE63946),
                        fontSize: 20,
                        fontFamily: 'JetBrains Mono',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Gap(20),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  TicketView(),
                  TicketView(),
                  TicketView(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
