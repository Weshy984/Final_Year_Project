import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
//import 'package:tiqiti/reusable_widgets/thick_container.dart';
import 'package:tiqiti/reusable_widgets/tickets_tab.dart';
import 'package:tiqiti/screens/ticket_view.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body: ListView(
        children: [
          const Gap(40),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child:Image(image: AssetImage("assets/images/logo1.jpeg")),
                ),
                Gap(20),
                Text(
                  'Your Tickets',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),

          ),
          const Gap(20),
          const Center(child: TicketsTab(firstTab: "Upcoming", secondTab: "Previous",)),
          const Gap(20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.85,
              //height: MediaQuery.of(context).size.height*0.65,
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const Gap(20),
                  Row(
                    children: [
                      const Text("ELD",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 2.5, color: const Color(0xFFA8DADC))),
                      ),
                      Expanded(child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate((constraints.constrainWidth()/6).floor(), (index) => const SizedBox(
                                      width: 3,
                                      height: 1,
                                      child: DecoratedBox(decoration: BoxDecoration(
                                          color: Color(0xFFA8DADC)
                                      )),
                                    )),
                                  );
                                },
                              ),
                            ),
                            const Center(child: Icon(Icons.directions_bus, color: Color(0xFFA8DADC),))
                          ]
                      )),
                      Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 2.5, color: const Color(0xFFA8DADC))),
                      ),
                      const Spacer(),
                      const Text("KSM",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                    ],
                  ),
                  const Gap(3),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text("Eldoret",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xDDD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Text("4H 40M",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xDDD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          )),
                      SizedBox(
                        width: 100,
                        child: Text("Kisumu",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Color(0xDDD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  LayoutBuilder(
                      builder: (BuildContext context , BoxConstraints constraints ) {
                        return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                              width: 5, height: 1,
                              child:  DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color(0xFFA8DADC)                               ),
                              ),
                            ))
                        );
                      },
                    ),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('10 JULY',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Date',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('1400HRS',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Departure Time',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('6C',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Seat No',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  LayoutBuilder(
                    builder: (BuildContext context , BoxConstraints constraints ) {
                      return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                            width: 5, height: 1,
                            child:  DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.cyan                               ),
                            ),
                          ))
                      );
                    },
                  ),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('I87546',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Ticket No.',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('78DYSD63VZ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Passport',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  LayoutBuilder(
                    builder: (BuildContext context , BoxConstraints constraints ) {
                      return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                            width: 5, height: 1,
                            child:  DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color(0xFFA8DADC)                               ),
                            ),
                          ))
                      );
                    },
                  ),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('543384 9023',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'E-Ticket No',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('7283193',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Booking Code',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  LayoutBuilder(
                    builder: (BuildContext context , BoxConstraints constraints ) {
                      return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                            width: 5, height: 1,
                            child:  DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color(0xFFA8DADC)                               ),
                            ),
                          ))
                      );
                    },
                  ),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('KCQ684K',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Bus No',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'METR',
                                  style: TextStyle(
                                    color: Color(0xFFE63946),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'O',
                                  style: TextStyle(
                                    color: Color(0xFF3A86FF),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'BUS',
                                  style: TextStyle(
                                    color: Color(0xFFE63946),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(3),
                          Text(
                            'Company',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  LayoutBuilder(
                    builder: (BuildContext context , BoxConstraints constraints ) {
                      return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                            width: 5, height: 1,
                            child:  DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Color(0xFFA8DADC)                               ),
                            ),
                          ))
                      );
                    },
                  ),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image(
                                  image:
                                  AssetImage("assets/images/visa.png")),
                              Text(
                                '**75**',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Gap(3),
                          Text(
                            'Payment info',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('KES 2500',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),),
                          Gap(3),
                          Text(
                            'Price',
                            style: TextStyle(
                              color: Color(0xFFD9D9D9),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Gap(20)
                ],
              ),
            ),
          ),
          const Gap(30),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: TicketView(),
          )
        ],
      ),
    );
  }
}
