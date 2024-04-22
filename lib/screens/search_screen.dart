import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mysql1/mysql1.dart';
import 'package:tiqiti/models/routes.dart';
import 'package:tiqiti/models/tickets.dart';
//import 'package:tiqiti/models/tickets.dart';
import 'package:tiqiti/screens/seat_booking_screen.dart';

//import '../models/trips.dart';

class SearchScreen extends StatelessWidget {
  //List<Trips> trips = [];
  final List<routes> route;
   const SearchScreen({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body:ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 154,
            decoration: const BoxDecoration(color: Color(0xFF1D3557)),
            child: Column(
              children: [
                const Gap(20),
                Row(
                    children: [
                      IconButton(
                          onPressed:(){
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,)),
                      const Gap(60),
                      const Center(
                        child: Column(
                          children: [
                            Text("Eldoret to Kisumu",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text("June 24 2023",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                const Gap(20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Container(
                          width: 180,
                          height: 40,
                          padding: const EdgeInsets.only(right: 5,left: 5),
                          decoration: ShapeDecoration(
                              color: const Color(0xff404781),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                              )),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Recommended",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("9 trips",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: Container(
                          width: 180,
                          height: 40,
                          padding: const EdgeInsets.only(right: 5,left: 5),
                          decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              )),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Cheapest",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text("KES 2500",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 40,
                        padding: const EdgeInsets.only(right: 5,left: 5),
                        decoration: ShapeDecoration(
                            color: const Color(0xff404781),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Fastest",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text("4 hrs",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                )
              ],
            ),
          ),
          const Gap(20),

          // Center(
          //   child: Container(
          //     width: 330,
          //     height: 160,
          //     decoration: ShapeDecoration(
          //       color: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         side: const BorderSide(
          //           width: 3,
          //           strokeAlign: BorderSide.strokeAlignOutside,
          //           color: Color(0xFFA8DADC),
          //         ),
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //     ),
          //     child: Column(
          //       children: [
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: 'METR',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'O',
          //                       style: TextStyle(
          //                         color: Color(0xFF3A86FF),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'BUS',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 width: 80,
          //                 height: 20,
          //                 decoration: ShapeDecoration(
          //                   color: const Color(0xFF5E72D8),
          //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //                 ),
          //                 child: const Text(
          //                   "CHEAPEST",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //               ),
          //               const Text(
          //                 'KES2500',
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 17,
          //                   fontWeight: FontWeight.w700,
          //                 ),
          //               )
          //
          //             ],
          //           ),
          //         ),
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child:Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     '1400HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'ELDORET',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 71,
          //                     height: 18,
          //                     decoration: ShapeDecoration(
          //                       color: Colors.white,
          //                       shape: RoundedRectangleBorder(
          //                         side: const BorderSide(
          //                             width: 1,
          //                             strokeAlign: BorderSide.strokeAlignOutside,
          //                             color: Color(0xFFD9D9D9)
          //                         ),
          //                         borderRadius: BorderRadius.circular(15),
          //                       ),
          //                     ),
          //                     child: const Center(
          //                       child: Text(
          //                         '4HRS',
          //                         style: TextStyle(
          //                           color: Color(0xFFD9D9D9),
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w900,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //
          //                 ],
          //               ),
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Text(
          //                     '1800HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'KISUMU',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //
          //             ],
          //           ) ,
          //         ),
          //         const Gap(15),
          //         SizedBox(
          //           height: 46,
          //           child: ElevatedButton(
          //               onPressed: (){
          //                 Navigator.push(context,
          //                     MaterialPageRoute(builder: (context)=> const SeatBooking())
          //                 );
          //               },
          //               style: ButtonStyle(
          //                 backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
          //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //                   const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          //                     bottomLeft: Radius.circular(15),
          //                     bottomRight: Radius.circular(15),
          //                   ))
          //                 )
          //               ),
          //               child: const Center(
          //                 child: Text(
          //                   'BOOK SEAT',
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 27,
          //                     fontWeight: FontWeight.w700,
          //                   ),
          //                 ),
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // const Gap(20),
          // Center(
          //   child: Container(
          //     width: 330,
          //     height: 160,
          //     decoration: ShapeDecoration(
          //       color: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         side: const BorderSide(
          //           width: 3,
          //           strokeAlign: BorderSide.strokeAlignOutside,
          //           color: Color(0xFFA8DADC),
          //         ),
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //     ),
          //     child: Column(
          //       children: [
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: 'METR',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'O',
          //                       style: TextStyle(
          //                         color: Color(0xFF3A86FF),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'BUS',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 width: 80,
          //                 height: 20,
          //                 decoration: ShapeDecoration(
          //                   color: const Color(0xFF5E72D8),
          //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //                 ),
          //                 child: const Text(
          //                   "CHEAPEST",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //               ),
          //               const Text(
          //                 'KES2500',
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 17,
          //                   fontWeight: FontWeight.w700,
          //                 ),
          //               )
          //
          //             ],
          //           ),
          //         ),
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child:Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     '1400HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'ELDORET',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 71,
          //                     height: 18,
          //                     decoration: ShapeDecoration(
          //                       color: Colors.white,
          //                       shape: RoundedRectangleBorder(
          //                         side: const BorderSide(
          //                             width: 1,
          //                             strokeAlign: BorderSide.strokeAlignOutside,
          //                             color: Color(0xFFD9D9D9)
          //                         ),
          //                         borderRadius: BorderRadius.circular(15),
          //                       ),
          //                     ),
          //                     child: const Center(
          //                       child: Text(
          //                         '4HRS',
          //                         style: TextStyle(
          //                           color: Color(0xFFD9D9D9),
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w900,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //
          //                 ],
          //               ),
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Text(
          //                     '1800HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'KISUMU',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //
          //             ],
          //           ) ,
          //         ),
          //         const Gap(15),
          //         SizedBox(
          //           height: 46,
          //           child: ElevatedButton(
          //               onPressed: (){
          //                 Navigator.push(context,
          //                     MaterialPageRoute(builder: (context)=> const SeatBooking())
          //                 );
          //               },
          //               style: ButtonStyle(
          //                   backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
          //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //                       const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          //                         bottomLeft: Radius.circular(15),
          //                         bottomRight: Radius.circular(15),
          //                       ))
          //                   )
          //               ),
          //               child: const Center(
          //                 child: Text(
          //                   'BOOK SEAT',
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 27,
          //                     fontWeight: FontWeight.w700,
          //                   ),
          //                 ),
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // const Gap(20),
          // Center(
          //   child: Container(
          //     width: 330,
          //     height: 160,
          //     decoration: ShapeDecoration(
          //       color: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         side: const BorderSide(
          //           width: 3,
          //           strokeAlign: BorderSide.strokeAlignOutside,
          //           color: Color(0xFFA8DADC),
          //         ),
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //     ),
          //     child: Column(
          //       children: [
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: 'METR',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'O',
          //                       style: TextStyle(
          //                         color: Color(0xFF3A86FF),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'BUS',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 width: 80,
          //                 height: 20,
          //                 decoration: ShapeDecoration(
          //                   color: const Color(0xFF5E72D8),
          //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //                 ),
          //                 child: const Text(
          //                   "CHEAPEST",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //               ),
          //               const Text(
          //                 'KES2500',
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 17,
          //                   fontWeight: FontWeight.w700,
          //                 ),
          //               )
          //
          //             ],
          //           ),
          //         ),
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child:Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     '1400HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'ELDORET',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 71,
          //                     height: 18,
          //                     decoration: ShapeDecoration(
          //                       color: Colors.white,
          //                       shape: RoundedRectangleBorder(
          //                         side: const BorderSide(
          //                             width: 1,
          //                             strokeAlign: BorderSide.strokeAlignOutside,
          //                             color: Color(0xFFD9D9D9)
          //                         ),
          //                         borderRadius: BorderRadius.circular(15),
          //                       ),
          //                     ),
          //                     child: const Center(
          //                       child: Text(
          //                         '4HRS',
          //                         style: TextStyle(
          //                           color: Color(0xFFD9D9D9),
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w900,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //
          //                 ],
          //               ),
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Text(
          //                     '1800HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'KISUMU',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //
          //             ],
          //           ) ,
          //         ),
          //         const Gap(15),
          //         SizedBox(
          //           height: 46,
          //           child: ElevatedButton(
          //               onPressed: (){
          //                 Navigator.push(context,
          //                     MaterialPageRoute(builder: (context)=> const SeatBooking())
          //                 );
          //               },
          //               style: ButtonStyle(
          //                   backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
          //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //                       const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          //                         bottomLeft: Radius.circular(15),
          //                         bottomRight: Radius.circular(15),
          //                       ))
          //                   )
          //               ),
          //               child: const Center(
          //                 child: Text(
          //                   'BOOK SEAT',
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 27,
          //                     fontWeight: FontWeight.w700,
          //                   ),
          //                 ),
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // const Gap(20),
          // Center(
          //   child: Container(
          //     width: 330,
          //     height: 160,
          //     decoration: ShapeDecoration(
          //       color: Colors.white,
          //       shape: RoundedRectangleBorder(
          //         side: const BorderSide(
          //           width: 3,
          //           strokeAlign: BorderSide.strokeAlignOutside,
          //           color: Color(0xFFA8DADC),
          //         ),
          //         borderRadius: BorderRadius.circular(15),
          //       ),
          //     ),
          //     child: Column(
          //       children: [
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Text.rich(
          //                 TextSpan(
          //                   children: [
          //                     TextSpan(
          //                       text: 'METR',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'O',
          //                       style: TextStyle(
          //                         color: Color(0xFF3A86FF),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     TextSpan(
          //                       text: 'BUS',
          //                       style: TextStyle(
          //                         color: Color(0xFFE63946),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container(
          //                 width: 80,
          //                 height: 20,
          //                 decoration: ShapeDecoration(
          //                   color: const Color(0xFF5E72D8),
          //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          //                 ),
          //                 child: const Text(
          //                   "CHEAPEST",
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //               ),
          //               const Text(
          //                 'KES2500',
          //                 style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 17,
          //                   fontWeight: FontWeight.w700,
          //                 ),
          //               )
          //
          //             ],
          //           ),
          //         ),
          //         const Gap(20),
          //         Padding(
          //           padding: const EdgeInsets.only(left: 10,right: 10),
          //           child:Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     '1400HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'ELDORET',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //               Row(
          //                 children: [
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 71,
          //                     height: 18,
          //                     decoration: ShapeDecoration(
          //                       color: Colors.white,
          //                       shape: RoundedRectangleBorder(
          //                         side: const BorderSide(
          //                             width: 1,
          //                             strokeAlign: BorderSide.strokeAlignOutside,
          //                             color: Color(0xFFD9D9D9)
          //                         ),
          //                         borderRadius: BorderRadius.circular(15),
          //                       ),
          //                     ),
          //                     child: const Center(
          //                       child: Text(
          //                         '4HRS',
          //                         style: TextStyle(
          //                           color: Color(0xFFD9D9D9),
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w900,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     width: 30,
          //                     decoration: const ShapeDecoration(
          //                       shape: RoundedRectangleBorder(
          //                         side: BorderSide(
          //                           width: 1,
          //                           strokeAlign: BorderSide.strokeAlignCenter,
          //                           color: Color(0xFFD9D9D9),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //
          //                 ],
          //               ),
          //               const Column(
          //                 crossAxisAlignment: CrossAxisAlignment.end,
          //                 children: [
          //                   Text(
          //                     '1800HRS',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                   Text(
          //                     'KISUMU',
          //                     style: TextStyle(
          //                       color: Colors.black,
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //
          //             ],
          //           ) ,
          //         ),
          //         const Gap(15),
          //         SizedBox(
          //           height: 46,
          //           child: ElevatedButton(
          //               onPressed: (){
          //                 Navigator.push(context,
          //                     MaterialPageRoute(builder: (context)=> const SeatBooking())
          //                 );
          //               },
          //               style: ButtonStyle(
          //                   backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
          //                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //                       const RoundedRectangleBorder(borderRadius: BorderRadius.only(
          //                         bottomLeft: Radius.circular(15),
          //                         bottomRight: Radius.circular(15),
          //                       ))
          //                   )
          //               ),
          //               child: const Center(
          //                 child: Text(
          //                   'BOOK SEAT',
          //                   style: TextStyle(
          //                     color: Colors.white,
          //                     fontSize: 27,
          //                     fontWeight: FontWeight.w700,
          //                   ),
          //                 ),
          //               )),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
  // Widget centerCard(TicketDetails ticket){
  //   String travelTime = ticket.traveltime != null
  //       ? DateFormat('HH:mm').format(ticket.traveltime! as DateTime)
  //       : 'N/A';
  //   String departureTime = ticket.departuretime != null
  //       ? DateFormat('HH:mm').format(ticket.departuretime! as DateTime)
  //       : 'N/A';
  //   return ListView.builder(
  //     itemCount: route.length,
  //     itemBuilder: (context, index) {
  //       return FutureBuilder(
  //           future: fetchTicketDetails(route[index]),
  //           builder: (context, AsyncSnapshot<TicketDetails?> snapshot){
  //             if (snapshot.connectionState == ConnectionState.waiting){
  //               return const CircularProgressIndicator();
  //             }else if(snapshot.hasError){
  //               return Text('Error:${snapshot.error}');
  //             }else if(snapshot.hasData){
  //               TicketDetails? ticket = snapshot.data;
  //               //calculate arrival time
  //               //DateTime arrivalTime = ticket!.departuretime.add(Duration(minutes:ticket.traveltime!.minute));
  //               return Center(
  //                 child: Container(
  //                   width: 330,
  //                   height: 160,
  //                   decoration: ShapeDecoration(
  //                     color: Colors.white,
  //                     shape: RoundedRectangleBorder(
  //                       side: const BorderSide(
  //                         width: 3,
  //                         strokeAlign: BorderSide.strokeAlignOutside,
  //                         color: Color(0xFFA8DADC),
  //                       ),
  //                       borderRadius: BorderRadius.circular(15),
  //                     ),
  //                   ),
  //                   child: Column(
  //                     children: [
  //                       const Gap(20),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 10,right: 10),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Text(
  //                               route[index].saccoName,
  //                               style: const TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 17,
  //                                 fontWeight: FontWeight.w700,
  //                               ),
  //                             ),
  //                             Container(
  //                               width: 80,
  //                               height: 20,
  //                               decoration: ShapeDecoration(
  //                                 color: const Color(0xFF5E72D8),
  //                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  //                               ),
  //                               child: const Text(
  //                                 "CHEAPEST",
  //                                 style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontWeight: FontWeight.w400,
  //                                   fontSize: 15,
  //                                 ),
  //                               ),
  //                             ),
  //                             Text(
  //                               'KSH ${route[index].price as String}',
  //                               style: const TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 17,
  //                                 fontWeight: FontWeight.w700,
  //                               ),
  //                             )
  //
  //                           ],
  //                         ),
  //                       ),
  //                       const Gap(20),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 10,right: 10),
  //                         child:Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   ticket.departuretime.toString(),
  //                                   style: const TextStyle(
  //                                     color: Colors.black,
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.w700,
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   route[index].source,
  //                                   style: const TextStyle(
  //                                     color: Colors.black,
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.w500,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             Row(
  //                               children: [
  //                                 Container(
  //                                   width: 30,
  //                                   decoration: const ShapeDecoration(
  //                                     shape: RoundedRectangleBorder(
  //                                       side: BorderSide(
  //                                         width: 1,
  //                                         strokeAlign: BorderSide.strokeAlignCenter,
  //                                         color: Color(0xFFD9D9D9),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Container(
  //                                   width: 71,
  //                                   height: 18,
  //                                   decoration: ShapeDecoration(
  //                                     color: Colors.white,
  //                                     shape: RoundedRectangleBorder(
  //                                       side: const BorderSide(
  //                                           width: 1,
  //                                           strokeAlign: BorderSide.strokeAlignOutside,
  //                                           color: Color(0xFFD9D9D9)
  //                                       ),
  //                                       borderRadius: BorderRadius.circular(15),
  //                                     ),
  //                                   ),
  //                                   child: Center(
  //                                     child: Text(
  //                                       ticket.traveltime.toString(),
  //                                       style: const TextStyle(
  //                                         color: Color(0xFFD9D9D9),
  //                                         fontSize: 14,
  //                                         fontWeight: FontWeight.w900,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Container(
  //                                   width: 30,
  //                                   decoration: const ShapeDecoration(
  //                                     shape: RoundedRectangleBorder(
  //                                       side: BorderSide(
  //                                         width: 1,
  //                                         strokeAlign: BorderSide.strokeAlignCenter,
  //                                         color: Color(0xFFD9D9D9),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //
  //                               ],
  //                             ),
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.end,
  //                               children: [
  //                                 Text(
  //                                   arrivalTime.toString(),
  //                                   style: const TextStyle(
  //                                     color: Colors.black,
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.w700,
  //                                   ),
  //                                 ),
  //                                 Text(
  //                                   route[index].destination,
  //                                   style: const TextStyle(
  //                                     color: Colors.black,
  //                                     fontSize: 14,
  //                                     fontWeight: FontWeight.w500,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //
  //                           ],
  //                         ) ,
  //                       ),
  //                       const Gap(15),
  //                       SizedBox(
  //                         height: 46,
  //                         child: ElevatedButton(
  //                             onPressed: (){
  //                               Navigator.push(context,
  //                                   MaterialPageRoute(builder: (context)=> const SeatBooking())
  //                               );
  //                             },
  //                             style: ButtonStyle(
  //                                 backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
  //                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //                                     const RoundedRectangleBorder(borderRadius: BorderRadius.only(
  //                                       bottomLeft: Radius.circular(15),
  //                                       bottomRight: Radius.circular(15),
  //                                     ))
  //                                 )
  //                             ),
  //                             child: const Center(
  //                               child: Text(
  //                                 'BOOK SEAT',
  //                                 style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: 27,
  //                                   fontWeight: FontWeight.w700,
  //                                 ),
  //                               ),
  //                             )),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             } else {
  //               return const Text("No available data");
  //             }
  //           }
  //       );
  //     },
  //   ),
  // }
  Future<TicketDetails?> fetchTicketDetails(routes route) async {
    final conn = await MySqlConnection.connect(
      ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        db: 'tiketi',
      ),
    );

    var results = await conn.query(
      'SELECT * FROM tickets WHERE routeID = ?',
      [route.routeID],
    );

    await conn.close();

    if (results.isNotEmpty) {
      var row = results.first;
      return TicketDetails(
        ticketID: row['ticketID'],
        source: row['source'],
        destination: row['destination'],
        date: row['date'],
        departureTime: row['departureTime'],
        seatno: row['seatno'],
        travelTime: row['travelTime'] != null ? row['travel_time_minutes'] : null, // Handle nullable property
      );
    } else {
      return null;
    }
  }
}
// class TripCard extends StatelessWidget {
//   //final //Trips trip;
//   final routes route;
//   //final TicketDetails ticket;
//   const TripCard({super.key, required this.route});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         width: 330,
//         height: 160,
//         decoration: ShapeDecoration(
//           color: Colors.white,
//           shape: RoundedRectangleBorder(
//             side: const BorderSide(
//               width: 3,
//               strokeAlign: BorderSide.strokeAlignOutside,
//               color: Color(0xFFA8DADC),
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         child: Column(
//           children: [
//             const Gap(20),
//             Padding(
//               padding: const EdgeInsets.only(left: 10,right: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     route.saccoName,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Container(
//                     width: 80,
//                     height: 20,
//                     decoration: ShapeDecoration(
//                       color: const Color(0xFF5E72D8),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                     ),
//                     child: const Text(
//                       "CHEAPEST",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ),
//                   Text(
//                     route.price as String,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   )
//
//                 ],
//               ),
//             ),
//             const Gap(20),
//             Padding(
//               padding: const EdgeInsets.only(left: 10,right: 10),
//               child:Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         '1800hrs',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       Text(
//                         route.source,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         width: 30,
//                         decoration: const ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               width: 1,
//                               strokeAlign: BorderSide.strokeAlignCenter,
//                               color: Color(0xFFD9D9D9),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 71,
//                         height: 18,
//                         decoration: ShapeDecoration(
//                           color: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             side: const BorderSide(
//                                 width: 1,
//                                 strokeAlign: BorderSide.strokeAlignOutside,
//                                 color: Color(0xFFD9D9D9)
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                         ),
//                         child: const Center(
//                           child: Text(
//                             "4h 40min",
//                             style: TextStyle(
//                               color: Color(0xFFD9D9D9),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w900,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 30,
//                         decoration: const ShapeDecoration(
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               width: 1,
//                               strokeAlign: BorderSide.strokeAlignCenter,
//                               color: Color(0xFFD9D9D9),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       const Text(
//                         "22hrs 40min",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       Text(
//                         route.destination,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ],
//               ) ,
//             ),
//             const Gap(15),
//             SizedBox(
//               height: 46,
//               child: ElevatedButton(
//                   onPressed: (){
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context)=> const SeatBooking())
//                     );
//                   },
//                   style: ButtonStyle(
//                       backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           const RoundedRectangleBorder(borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(15),
//                             bottomRight: Radius.circular(15),
//                           ))
//                       )
//                   ),
//                   child: const Center(
//                     child: Text(
//                       'BOOK SEAT',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 27,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

