import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body: ListView(
        padding: const EdgeInsets.only(left: 20 ,right: 20),
        children: [
          const Gap(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                  height:70,
                  width: 70,
                  child: Image(image: AssetImage("assets/images/person_icon.png"),),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Jane Doe',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  //Gap(3),
                  const Text(
                    'Kansas',
                    style: TextStyle(
                      color: Color(0xFFC6B6B1),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(3),
                  Container(
                    width: 180,
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFF526799),
                          ),
                          child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                        const Gap(5),
                        const Text(
                          'Premium',
                          style: TextStyle(
                            color: Color(0xFF1D3557),
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        )

                      ],
                    ),
                  )
                ],

              ),
              GestureDetector(
                onTap: (){},
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Color(0xFFE63946),
                    fontSize: 25,
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              )
            ],
          ),
          const Gap(30),
          const Divider(color: Color(0xFFD9D9D9),),
          const Gap(20),
          Stack(
            children:[
              Container(
                width: double.infinity,
                height: 100,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1D3557),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(width: 18, color: const Color(0xFF5E72D8) ),
                    ),
                  )
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(FluentSystemIcons.ic_fluent_lightbulb_filament_filled, color:Color(0xFF1D3557) , size: 27,),
                    ),
                    Gap(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You\'ve got a new award",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text("You had 49 Flights so far",
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ],
              )
                  ]
                )
              ),
            ]
          ),
          const Gap(30),
          const Text(
            'Accumulated Miles',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(20),
          Container(
            //width: MediaQuery.of(context).size.width*0.85,
            //height: 430,
            padding: const EdgeInsets.only(left: 20,right: 20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const Gap(10),
                const Center(
                  child:Text(
                    '174583',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 65,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Miles accrued',
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '10 July 2023',
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const Gap(10),
                const Divider(color: Colors.cyan,),
                const Gap(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '23 043',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gap(3),
                        Text(
                          'Miles',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 18,
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
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'O',
                                style: TextStyle(
                                  color: Color(0xFF3A86FF),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'BUS',
                                style: TextStyle(
                                  color: Color(0xFFE63946),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(3),
                        Text(
                          'Received From',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
                const Gap(10),
                const Divider(color: Colors.cyan,),
                const Gap(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '25',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gap(3),
                        Text(
                          'Miles',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'BUS CO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gap(3),
                        Text(
                          'Received From',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
                const Gap(10),
                const Divider(color: Colors.cyan,),
                const Gap(10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2693',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gap(3),
                        Text(
                          'Miles',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'EXUNA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Gap(3),
                        Text(
                          'Received From',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ],
                    ),

                  ],
                ),
                const Gap(20),
                Center(
                  child: GestureDetector(
                    onTap: (){},
                    child: const Text(
                      'HOW TO GET MORE MILES?',
                      style: TextStyle(
                        color: Color(0xFFE63946),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const Gap(10)
              ],
            ),
          ),
          const Gap(20),
        ]
      )
    );
  }
}
