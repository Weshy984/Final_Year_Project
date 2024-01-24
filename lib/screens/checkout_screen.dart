import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';



class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body: ListView(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: const BoxDecoration(color: Color(0xFF1D3557)),
              child: Column(
                children: [
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      const Text(
                        "Ticket",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      const Text(
                        "I87546",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )
                    ],
                  ),
                ],
              )),
          const Gap(30),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  const Gap(40),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bus No',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              'KCQ684K',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Bus Name',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
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
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ELD',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              'Eldoret',
                              style: TextStyle(
                                color: Color(0xDDD9D9D9),
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 2.5, color: const Color(0xFFD9D9D9))),
                        ),
                        Expanded(
                            child: Stack(children: [
                          SizedBox(
                            height: 24,
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => const SizedBox(
                                            width: 3,
                                            height: 1,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9))),
                                          )),
                                );
                              },
                            ),
                          ),
                          const Center(
                              child: Icon(
                            Icons.directions_bus,
                            color: Color(0xFFD9D9D9),
                          ))
                        ])),
                        Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 2.5, color: const Color(0xFFD9D9D9))),
                        ),
                        const Spacer(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'KSM',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              'Kisumu',
                              style: TextStyle(
                                color: Color(0xDDD9D9D9),
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              (constraints.constrainWidth() / 10).floor(),
                              (index) => const SizedBox(
                                    width: 5,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  )));
                    },
                  ),
                  const Gap(10),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Departure Time',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              '1400HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Arrival Time',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              '1800HRS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(15),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ticket No.',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              'I87546',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              '06/24/2023',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(15),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Info.',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
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
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Seat No.',
                              style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text(
                              '6C',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Gap(15),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 20,
                          width: 10,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 15)
                                          .floor(),
                                      (index) => const SizedBox(
                                            width: 5,
                                            height: 1,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: Colors.black),
                                            ),
                                          )));
                            },
                          ),
                        )),
                        const SizedBox(
                          height: 20,
                          width: 10,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(15),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(21),
                            bottomLeft: Radius.circular(21))),
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    padding: const EdgeInsets.only(
                      top: 22,
                      bottom: 22,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: BarcodeWidget(
                          data:
                              'https://github.com/Weshy984/Final_Year_Project.git',
                          barcode: Barcode.code128(),
                          drawText: false,
                          color: const Color(0xff3b3b3b),
                          width: double.infinity,
                          height: 60,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color(0xFFE63946)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                    child: const Row(
                      children: [
                        Icon(Icons.download_rounded),
                        Gap(10),
                        Text(
                          'DOWNLOAD',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 64,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color(0xFFA8DADC)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                    child: const Row(
                      children: [
                        Icon(Icons.ios_share_rounded),
                        Gap(10),
                        Text(
                          'SHARE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
