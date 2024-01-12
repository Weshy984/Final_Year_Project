import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiqiti/reusable_widgets/thick_container.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.85,
      //height: MediaQuery.of(context).size.height,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            //shows the top section of ticket
            Container(
              decoration: const ShapeDecoration(
                color: Color(0xFF1D3557),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21),
                  ),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("ELD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      const ThickContainer(),
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
                                        color: Colors.white
                                    )),
                                  )),
                                );
                              },
                            ),
                          ),
                          const Center(child: Icon(Icons.directions_bus, color: Colors.white,))
                        ]
                      )),
                      const ThickContainer(),
                      const Spacer(),
                      const Text("KSM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'JetBrains Mono',
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
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text("4H 40M",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                      )),
                      SizedBox(
                        width: 100,
                        child: Text("Kisumu",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //show the middle part of ticket
            Container(
              color: const Color(0xFFE63946),
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)
                          )
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(12.0),

                    child: LayoutBuilder(
                      builder: (BuildContext context , BoxConstraints constraints ) {
                        return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate((constraints.constrainWidth()/15).floor(), (index) => const SizedBox(
                              width: 5, height: 1,
                              child:  DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white                                ),
                              ),
                            ))
                        );
                      },
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          )
                      ),
                    ),
                  )
                ],
              ),

            ),
            //show the lower part of ticket
            Container(
              decoration: const ShapeDecoration(
                color: Color(0xFFE63946),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21),
                  ),
                ),
              ),
              padding: const EdgeInsets.only(left: 16,top: 10,right: 16,bottom: 16),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('10 JULY',
                           style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                           )
                          ),
                          Gap(3),
                          Text("Date",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700
                            ),
                          )
                          
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('0900HRS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                          Gap(3),
                          Text("Departure Time",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700
                            ),
                          )

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('27',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                          Gap(3),
                          Text("Seat No.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w700
                            ),
                          )

                        ],
                      ),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
