import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiqiti/screens/seat_booking_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
          Center(
            child: Container(
              width: 330,
              height: 160,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFA8DADC),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'METR',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'O',
                                style: TextStyle(
                                  color: Color(0xFF3A86FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'BUS',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF5E72D8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Text(
                            "CHEAPEST",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Text(
                          'KES2500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1400HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'ELDORET',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 71,
                              height: 18,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFD9D9D9)
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '4HRS',
                                  style: TextStyle(
                                    color: Color(0xFFD9D9D9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1800HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'KISUMU',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ) ,
                  ),
                  const Gap(15),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const SeatBooking())
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ))
                          )
                        ),
                        child: const Center(
                          child: Text(
                            'BOOK SEAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
          const Gap(20),
          Center(
            child: Container(
              width: 330,
              height: 160,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFA8DADC),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'METR',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'O',
                                style: TextStyle(
                                  color: Color(0xFF3A86FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'BUS',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF5E72D8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Text(
                            "CHEAPEST",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Text(
                          'KES2500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1400HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'ELDORET',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 71,
                              height: 18,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFD9D9D9)
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '4HRS',
                                  style: TextStyle(
                                    color: Color(0xFFD9D9D9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1800HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'KISUMU',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ) ,
                  ),
                  const Gap(15),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const SeatBooking())
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ))
                            )
                        ),
                        child: const Center(
                          child: Text(
                            'BOOK SEAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
          const Gap(20),
          Center(
            child: Container(
              width: 330,
              height: 160,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFA8DADC),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'METR',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'O',
                                style: TextStyle(
                                  color: Color(0xFF3A86FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'BUS',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF5E72D8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Text(
                            "CHEAPEST",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Text(
                          'KES2500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1400HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'ELDORET',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 71,
                              height: 18,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFD9D9D9)
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '4HRS',
                                  style: TextStyle(
                                    color: Color(0xFFD9D9D9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1800HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'KISUMU',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ) ,
                  ),
                  const Gap(15),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const SeatBooking())
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ))
                            )
                        ),
                        child: const Center(
                          child: Text(
                            'BOOK SEAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
          const Gap(20),
          Center(
            child: Container(
              width: 330,
              height: 160,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 3,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFA8DADC),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'METR',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'O',
                                style: TextStyle(
                                  color: Color(0xFF3A86FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'BUS',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF5E72D8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Text(
                            "CHEAPEST",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Text(
                          'KES2500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        )

                      ],
                    ),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1400HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'ELDORET',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 71,
                              height: 18,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFD9D9D9)
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '4HRS',
                                  style: TextStyle(
                                    color: Color(0xFFD9D9D9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFFD9D9D9),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '1800HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'KISUMU',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ) ,
                  ),
                  const Gap(15),
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const SeatBooking())
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFA143E7)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ))
                            )
                        ),
                        child: const Center(
                          child: Text(
                            'BOOK SEAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
