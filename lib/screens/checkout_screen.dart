import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mysql1/mysql1.dart';


import '../models/buses.dart';
import '../models/tickets.dart';



class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late List<Busses> buses;
  late List<TicketDetails> tickets;



  @override
  void initState() {
    super.initState();
    fetchBusDetails();
    fetchTicketDetails();// Fetch ticket details when the widget initializes
  }
  Future<List<Busses>> fetchBusDetails() async {
    // Connect to your MySQL database
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host:'10.0.2.2',
        port:3306,
        user:'root',
        //password:'',
        db:'tiketi'
    ));

    // Execute a query to fetch bus details
    var results = await conn.query('SELECT * FROM busses');

    // Extract bus details from the query results
    List<Busses> buses = [];
    for (var row in results) {
      buses.add(Busses(
        busID: row['busID'],
        sacco: row['sacco'] ?? '', // Handle null
        busPlate: row['busPlate'] ?? '', // Handle null
      ));
    }

    // Close the connection
    await conn.close();

    return buses;
  }
  Future<List<TicketDetails>> fetchTicketDetails() async {
    // Connect to your MySQL database
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host:'10.0.2.2',
        port:3306,
        user:'root',
        //password:'',
        db:'tiketi'
    ));

    // Execute a query to fetch ticket details
    var results = await conn.query('SELECT * FROM tickets');

    // Extract ticket details from the query results
    List<TicketDetails> tickets = [];
    for (var row in results){
      tickets.add(TicketDetails(
        ticketID: row['ticketID'],
        source: row['source'] ?? '', // Handle null
        destination: row['destination'] ?? '', // Handle null
        date: row['date'] ?? '', // Handle null
        departureTime: row['departureTime'] ?? '', // Handle null
        seatno: row['seatno'] ?? '', // Handle null
        travelTime: row['travelTime'] ?? '', // Handle null
      ));
    }

    // Close the connection
    await conn.close();

    return tickets;
  }
  @override
  Widget build(BuildContext context) {
   // String truncatedSource = tickets.source?.substring(0, 3) ?? ''; // Check for null and provide default value
    //String truncatedDestination = tickets.destination?.substring(0, 3) ?? '';
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
              //height: MediaQuery.of(context).size.height * 0.75,
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
                            Text("",
                             // buses.busPlate,
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
                            Text("",
                             // buses.sacco,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("",
                             // truncatedSource,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text("",
                              //tickets.source,
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
                            Text("",
                              //truncatedDestination,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Gap(10),
                            Text("",
                             // tickets.destination,
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
                        backgroundColor: const WidgetStatePropertyAll<Color>(
                            Color(0xFFE63946)),
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
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
                        backgroundColor: const WidgetStatePropertyAll<Color>(
                            Color(0xFFA8DADC)),
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
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
