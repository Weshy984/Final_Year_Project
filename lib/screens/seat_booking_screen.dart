import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiqiti/screens/checkout_screen.dart';

class SeatBooking extends StatefulWidget {
  const SeatBooking({super.key});

  @override
  State<SeatBooking> createState() => _SeatBookingState();
}

class _SeatBookingState extends State<SeatBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body: ListView(
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
                      const Gap(80),
                      const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'METR',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'O',
                                style: TextStyle(
                                  color: Color(0xFF3A86FF),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'BUS',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'ELDORET',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
                            width: 74,
                            height: 30,
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
                                  color: Color(0xFF3A86FF),
                                  fontSize: 18,
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
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'KISUMU',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ) ,
                ),
              ],
            )
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 78,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('SELECT SEAT',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),)
                    ],
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFA8DADC),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFFA8DADC)),
                            ),
                          ),
                        ),
                        const Text(
                          'AVAILABLE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const Gap(2),
                        Container(
                          width: 15,
                          height: 15,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 3,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFA8DADC),
                              ),
                            ),
                          ),
                        ),
                        const Gap(2),
                        const Text(
                          'SELECTED',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Container(
                          width: 18.80,
                          height: 20,
                          decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                        ),
                        const Text(
                          'UNAVAILABLE',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Gap(30),
          const Padding(
            padding: EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'A',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'B',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'C',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'D',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )


              ],
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 30),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    height: 520,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height:50,
                                width:50,
                                child: Image(image: AssetImage("assets/images/entrance.png"))),
                            SizedBox(
                                height:50,
                                width:50,
                                child: Image(image: AssetImage("assets/images/Steering Wheel.png"))),

                          ],

                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFa8dadc)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFd9d9d9)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
                              ),
                              Container(
                                width: 40,
                                height: 41,
                                decoration: const BoxDecoration(color: Color(0xFFA8DADC)),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(3),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 30),
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20,top: 5),
                        child: Text(
                          '2',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 5),
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 5),
                        child: Text(
                          '5',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '6',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Text(
                          '8',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        '9',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              ),
          ),
          const Gap(20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 140,
            padding: const EdgeInsets.only(top: 20),
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your seat',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Total Price',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'SEAT 6C',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'KES 2500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    Spacer()
                  ],
                ),
                const Gap(20),
                Center(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                          onPressed:(){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=> const CheckoutScreen())
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xFFE63946)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                          child: const Text(
                            'PROCEED',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                ),
                  ),
                ),
                //Gap(10)
              ],
            ),
          )
        ],
      ),
    );
  }
}
