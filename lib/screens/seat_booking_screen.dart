import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiqiti/services/mpesa_service.dart';
import 'package:mysql1/mysql1.dart';

import 'checkout_screen.dart';

class SeatBooking extends StatefulWidget {
  final String source;
  final String destination;
  final String saccoName;
  const SeatBooking({super.key, required this.source, required this.destination, required this.saccoName});

  @override
  State<SeatBooking> createState() {
    return _SeatBookingState( this.source,this.destination,this.saccoName);
  }
}

class _SeatBookingState extends State<SeatBooking> {
  String source;
  String destination;
  String saccoName;
  _SeatBookingState(this.source,this.destination,this.saccoName);
  List<String> selectedSeats = [];
  String selectedSeatText = ''; // To store selected seats
  Set<String> bookedSeats = {};// To store booked seats from the database

  // Function to update selected seat text
  void updateSelectedSeatText() {
    setState(() {
      if (selectedSeats.isNotEmpty) {
        // If there are selected seats, display them
        selectedSeatText = selectedSeats.join(', '); // Concatenate selected seats with comma
      } else {
        // If no seats are selected, display a default message
        selectedSeatText = 'Null';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateSelectedSeatText(); // Call updateSelectedSeatText initially
    fetchBookedSeats(); // Fetch booked seats from the database
  }

  // Function to toggle seat selection
  void toggleSeatSelection(String seat) {
    setState(() {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
      } else {
        selectedSeats.add(seat);
      }
      updateSelectedSeatText();
    });
  }

  // Function to check seat availability
  bool isSeatAvailable(String seat) {
    return !bookedSeats.contains(seat);
  }

  // Fetch booked seats from the database
  Future<void> fetchBookedSeats() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        db: 'tiketi'));

    var results = await conn.query('SELECT seatID FROM bookings WHERE busID = ? AND dateBooked = ?', ['bus_id_here', 'date_booked_here']);

    Set<String> seats = {};
    for (var row in results) {
      seats.add(row['seatID'].toString());
    }

    setState(() {
      bookedSeats = seats;
    });

    await conn.close();
  }
  // Function to show the payment dialog
  void _showPaymentDialog(BuildContext context) {
    final phoneController = TextEditingController();
    final amountController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mpesa Payment'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: amountController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the amount';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid amount';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Pay'),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  // Show a loading indicator
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(child: CircularProgressIndicator());
                    },
                  );

                  String phoneNumber = phoneController.text;
                  String amount = amountController.text;
                  final mpesaService = MpesaService();

                  try {
                    await mpesaService.lipaNaMpesaOnline(phoneNumber, amount);
                    Navigator.of(context).pop(); // Close loading indicator
                    // Save transaction details to MySQL database
                    await saveTransactionToDatabase(phoneNumber, amount);

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment initiated successfully')));

                    Future.delayed(const Duration(seconds: 3), () {
                      //Navigator.of(context).pop();
                      String? seat = selectedSeatText;
                      String? amountPaid = amount;
                      String? phone = phoneNumber;
                      String? saccoN = saccoName;
                      String? start = source;
                      String? end = destination;
                      // Use a GlobalKey to access the navigator state
                      GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
                      navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) =>
                          CheckoutScreen(
                            selectedSeat: seat,
                            amountPaid: amountPaid,
                            phoneNumber: phone,
                            saccoName: saccoN,
                            source: start,
                            destination: end,
                          ),
                      ));
                    });





                    // Check if transaction was successfully saved
                    // bool transactionSaved = await checkTransactionSaved(phoneNumber, amount);
                    // print(phoneNumber);
                    // print(amount);
                    // if (transactionSaved) {
                    //
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Payment and transaction saved successfully')));
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save transaction')));
                    // }
                  } catch (e) {
                    Navigator.of(context).pop(); // Close loading indicator
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to initiate payment')));
                    print('Failed to initiate payment: $e');
                  }
                  Navigator.of(context).pop();
                }
              },
            ),

          ],
        );
      },
    );

  }
  // Function to save transaction details to MySQL database
  Future<void> saveTransactionToDatabase(String phoneNumber, String amount) async {
    final selectedSeat = selectedSeatText; // Get the selected seats from your state
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'tiketi',
    ));

    try {
      await conn.query('INSERT INTO transactions (phone, amount, seat_No) VALUES (?, ?, ?)',
          [phoneNumber, amount, selectedSeat]);
      print('Transaction saved successfully');
    } catch (e) {
      print('Failed to save transaction');
    } finally {
      await conn.close();
    }
  }
  // Function to check if transaction was successfully saved to database
  Future<bool> checkTransactionSaved(String phoneNumber, String amount) async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'tiketi',
    ));

    try {
      var result = await conn.query('SELECT COUNT(*) AS count FROM transactions WHERE phone = ? AND amount = ?',
          [phoneNumber, amount]);
      var count = result.first['count'] as int;
      print('Count of transactions: $count');
      return count > 0;
    } catch (e) {
      print('Failed to check transaction: $e');
      return false;
    } finally {
      await conn.close();
    }
  }

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
                      Center(
                        child: Text(
                          saccoName ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '1400HRS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              source ?? '',
                              style: const TextStyle(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              '1800HRS',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              destination ?? '',
                              style: const TextStyle(
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
                          width: 20,
                          height: 20,
                          decoration: const ShapeDecoration(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: Colors.green,
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
                    width: MediaQuery.of(context).size.width * 0.75,
                    //height: 520,
                    padding: const EdgeInsets.only(left: 10, right: 10,top: 20,bottom: 20),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: SizedBox(
                      height: 500,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:3, // Adjust according to your layout
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1, // Adjust according to your layout
                        ),
                        itemCount: 14, // Total number of seats
                        itemBuilder: (context, index) {
                          // Calculate seat number dynamically
                          String seatNumber = '${index + 1}';
                          bool isAvailable = !bookedSeats.contains(seatNumber);
                          bool isSelected = selectedSeats.contains(seatNumber);

                          Color seatColor;
                          if (!isAvailable) {
                            seatColor =  Colors.grey; // Booked seats in grey
                          } else if (isSelected) {
                            seatColor = Colors.green; // Selected seats in red
                          } else {
                            seatColor = Colors.blue ; // Available seats in green
                          }

                          return GestureDetector(
                            onTap: () {
                              if (isAvailable) {
                                toggleSeatSelection(seatNumber);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: seatColor,
                                // selectedSeats.contains(seatNumber)
                                //     ? Colors.green // Selected seat color
                                //     : isSeatAvailable(seatNumber)
                                //     ? Colors.blue // Available seat color
                                //     : Colors.grey, // Unavailable seat color
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  seatNumber,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                ]
            ),
          ),
          const Gap(20),
          Container(
            width: MediaQuery.of(context).size.width,
            //height: 140,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    const Column(
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
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Seat:$selectedSeatText",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'KES 2500',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                const Gap(20),
                Center(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed:(){
                        print("transaction started");
                        _showPaymentDialog(context);
                        // Future.delayed(const Duration(seconds: 5), () {
                        //   Navigator.of(context).pop();
                        // });



                      },
                      style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll<Color>(Color(0xFFE63946)),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
