import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mysql1/mysql1.dart';
import 'package:tiqiti/reusable_widgets/thick_container.dart';

import '../models/tickets.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  late Future<List<TicketDetails>> _ticketDetails;

  @override
  void initState() {
    super.initState();
    _ticketDetails = fetchTicketDetails(); // Fetch ticket details when the widget initializes
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _ticketDetails,
      builder: (BuildContext context, AsyncSnapshot<List<TicketDetails>> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(), // Show loading indicator while fetching data
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else {
        List<TicketDetails> tickets = snapshot.data ?? [];
        return SizedBox(
          height: MediaQuery.of(context).size.height*0.3,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: ListView.builder(
            itemCount: tickets.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              return buildTicketCard(tickets[index]);
              }
          ),
        );


      }
      },

    );
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
        travelTime: row['travelTime'] ?? '',
        amount: row['amount'] ?? '',
        phoneNumber: row['phoneNumber']?? '',
        saccoName: row['saccoName']?? '',// Handle null
      ));
    }

    // Close the connection
    await conn.close();

    return tickets;
  }
  Widget buildTicketCard(TicketDetails ticket){
    String truncatedSource = ticket.source.substring(0, 3) ?? ''; // Check for null and provide default value
    String truncatedDestination = ticket.destination.substring(0, 3) ?? '';


    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width*0.95,
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
                      Text(truncatedSource,
                        style: const TextStyle(
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
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: List.generate(
                                        (constraints.constrainWidth() / 6)
                                            .floor(), (index) =>
                                    const SizedBox(
                                      width: 3,
                                      height: 1,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.white
                                          )),
                                    )),
                                  );
                                },
                              ),
                            ),
                            const Center(child: Icon(
                              Icons.directions_bus, color: Colors.white,))
                          ]
                      )),
                      const ThickContainer(),
                      const Spacer(),
                      Text(truncatedDestination,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'JetBrains Mono',
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                    ],
                  ),
                  const Gap(3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(ticket.source ?? 'N/A',
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Text(ticket.travelTime ?? 'N/A',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'JetBrains Mono',
                            fontWeight: FontWeight.w700,
                          )),
                      SizedBox(
                        width: 100,
                        child: Text(ticket.destination,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
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
                          color: Colors.white,
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
                      builder: (BuildContext context,
                          BoxConstraints constraints) {
                        return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                (constraints.constrainWidth() / 15)
                                    .floor(), (index) =>
                            const SizedBox(
                              width: 5, height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white),
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
                          color: Colors.white,
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
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket.date,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                          const Gap(3),
                          const Text("Date",
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
                          Text(ticket.departureTime,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                          const Gap(3),
                          const Text("Departure Time",
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
                          Text(ticket.seatno,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              )
                          ),
                          const Gap(3),
                          const Text("Seat No.",
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
