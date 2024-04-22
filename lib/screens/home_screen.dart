
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mysql1/mysql1.dart';
import 'package:tiqiti/reusable_widgets/reusable_widgets.dart';
import 'package:tiqiti/screens/book_screen.dart';
import 'package:tiqiti/screens/profile_screen.dart';
import 'package:tiqiti/screens/search_screen.dart';
import 'package:tiqiti/screens/ticket_view.dart';
import 'dart:async';


import '../models/routes.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 late TextEditingController _fromTextController, _toTextController,_dateTextController, _saccoTextController;
 bool isRoundTripSelected = false;
 String? _selectedLocation;
 String? _destination;// Variable to hold the selected location
 String? _sacco;// Variable to hold the selected sacco
 List<String> _locations = [];
 List<String> _destinations = [];
 List<String> _saccos = [];
 final bool _isLoading = false;
 DateTime? _selectedDate;


 @override
 void initState(){
   //TODO:implement initState
   super.initState();
   _dateTextController=TextEditingController();
   _fromTextController=TextEditingController();
   _toTextController=TextEditingController();
   _saccoTextController=TextEditingController();
   fetchLocations();
   fetchDestinations();
   fetchSaccos();
 }
 Future<void> fetchLocations() async {
   // Connect to your MySQL database
   final conn = await MySqlConnection.connect(ConnectionSettings(
       host:'10.0.2.2',
       port:3306,
       user:'root',
       //password:'',
       db:'tiketi'
   ));

   // Execute a query to fetch locations
   var results = await conn.query('SELECT source FROM routes');

   // Extract locations from the query results
   List<String> locations = [];
   for (var row in results) {
     locations.add(row[0] as String);
   }



   // Update state with fetched locations
   setState(() {
     _locations = locations;
   });

   _locations = locations.toSet().toList();


   // Close the connection
   await conn.close();
 }
 Future<void> fetchDestinations() async {
   // Connect to your MySQL database
   final conn = await MySqlConnection.connect(ConnectionSettings(
       host:'10.0.2.2',
       port:3306,
       user:'root',
       //password:'',
       db:'tiketi'
   ));

   // Execute a query to fetch locations
   var results = await conn.query('SELECT destination FROM routes');

   // Extract locations from the query results
   List<String> destinations = [];
   for (var row in results) {
     destinations.add(row[0] as String);
   }


   // Update state with fetched locations
   setState(() {
     _destinations = destinations;
   });

   _destinations = destinations.toSet().toList();

   // Close the connection
   await conn.close();
 }
 Future<void> fetchSaccos() async {
   // Connect to your MySQL database
   final conn = await MySqlConnection.connect(ConnectionSettings(
       host:'10.0.2.2',
       port:3306,
       user:'root',
       //password:'',
       db:'tiketi'
   ));

   // Execute a query to fetch saccos
   var results = await conn.query('SELECT routes.*, saccos.saccoName FROM routes JOIN saccos ON routes.saccoID = saccos.saccoID');

   /// Process the results
   List<String> saccos = [];
   for (var row in results) {
       saccos.add(row['saccoName'] as String);
     }
     //print('Route ID: ${row['routeID']}, SACCO Name: ${row['saccoName']}');


   // Update state with fetched locations
   setState(() {
     _saccos = saccos;
   });

   _saccos = saccos.toSet().toList();

   // Close the connection
   await conn.close();
 }
 Future<List<routes>> searchRoutes(String saccoName, String source, String destination, String travelDate) async {
   final conn = await MySqlConnection.connect(ConnectionSettings(
     host: '10.0.2.2',
     port: 3306,
     user: 'root',
     db: 'tiketi',
   ));

   var results = await conn.query(
     'SELECT * FROM routes WHERE saccoID = (SELECT saccoID FROM saccos WHERE saccoName = ?) AND source = ? AND destination = ? AND date = ?',
     [_saccoTextController.text, _fromTextController.text, _toTextController.text, _selectedDate],
   );

   List<routes> searchResults = [];
   for (var row in results) {
     routes route = routes(
       routeID: row['routeID'],
       source: row['source'],
       destination: row['destination'],
       travelDate: row['date'],
       returnDate: row['returnDate'],
       price: row['amount'],
       saccoName: row['saccoName'],
     );
     searchResults.add(route);
   }

   await conn.close();
   return searchResults;
 }


 void _searchTrips(BuildContext context) {
   // Start the async operation
   searchRoutes(_sacco!, _selectedLocation!, _destination!, _selectedDate!.toString())
       .then((searchResults) {
     if (searchResults.isEmpty) {
       print("failed");
       // Show error dialog if no results are found
       showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             title: const Text('No Routes Found'),
             content: const Text('There are no routes available for the selected criteria.'),
             actions: <Widget>[
               TextButton(
                 onPressed: () {
                   Navigator.of(context).pop(); // Close the dialog
                 },
                 child: const Text('OK'),
               ),
             ],
           );
         },
       );
     } else {

       // Navigate to the SearchScreen if results are found
       Navigator.push(
         context,
         MaterialPageRoute(
           builder: (context) => SearchScreen(route: searchResults),
         ),
       );
       print("success");
     }
   });
 }



 Future<void> _selectDate(BuildContext context) async {
   final DateTime? pickedDate = await showDatePicker(
     context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime.now().subtract(const Duration(days: 365)),
     lastDate: DateTime.now().add(const Duration(days: 365)),
   );
   if (pickedDate != null && pickedDate != _selectedDate) {
     setState(() {
       _selectedDate = pickedDate;
     });
   }
 }


 @override
  Widget build(BuildContext context) {
    Color oneWayTextColor = isRoundTripSelected ? const Color(0xFF9291B1) : Colors.black;
    Color roundTripTextColor = isRoundTripSelected ? Colors.black : const Color(0xFF9291B1);
    return Scaffold(
      backgroundColor: const Color(0xFFF1FAEE),
      body:ListView(
        children: [
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50,left: 10),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/logo.png"
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('TIQITI',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontFamily: 'JetBrains Mono',
                                  fontWeight: FontWeight.w700,)
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(
                            'Convenience in transportation',
                            style: TextStyle(
                              color: Color(0xFF9291B1),
                              fontSize: 18,
                              fontFamily: 'Cambo',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 20),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>const ProfileScreen())
                          );
                        },
                        child: const Image(image: AssetImage("assets/images/person_icon.png"))),)
                ],
              ),
          const Gap(20),
          Padding(padding: const EdgeInsets.only(left: 20,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Choose Route',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const BookingScreen()));
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFFE63946),
                      fontSize: 20,
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Container(
              //height: 380,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: (){
                              if (kDebugMode) {
                                print("one way trip");
                              }
                              setState(() {
                                isRoundTripSelected = false; // One-way trip selected
                              });
                            },
                            child: Text(
                              'One-way ',
                              style: TextStyle(
                                color: oneWayTextColor,
                                fontSize: 20,
                                fontFamily: 'JetBrains Mono',
                                fontWeight: FontWeight.w700,
                              ),
                            )
                        ),
                        const Gap(20),
                        GestureDetector(
                          onTap: (){
                            if (kDebugMode) {
                              print("round trip");
                            }
                            setState(() {
                              isRoundTripSelected = true; // Round trip selected
                            });
                          },
                          child: Text(
                              'Round-trip',
                              style: TextStyle(
                                color: roundTripTextColor,
                                fontSize: 20,
                                fontFamily: 'JetBrains Mono',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              )
                          ),
                        )
                      ],
                    ),
                    const Gap(15),
                    Form(
                        child: Column(
                          children: <Widget>[
                            DropdownButtonFormField(
                              value: _sacco,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.place,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  labelText: "Select Sacco",
                                  labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                                  filled: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  fillColor: const Color(0xffd9d9d9),

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(width: 0,style: BorderStyle.solid)
                                  )
                              ),
                              items: _saccos.map((String sacco) {
                                return DropdownMenuItem<String>(
                                  value: sacco,
                                  child: Text(sacco),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _sacco = newValue;
                                });
                              },
                            ),
                            const Gap(15),
                            DropdownButtonFormField(
                              value: _selectedLocation,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.navigation_outlined,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  labelText: "Enter pickup location",
                                  labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                                  filled: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  fillColor: const Color(0xffd9d9d9),

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(width: 0,style: BorderStyle.solid)
                                  )
                              ),
                              items: _locations.map((String location) {
                                return DropdownMenuItem<String>(
                                  value: location,
                                  child: Text(location),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedLocation = newValue;
                                  });
                                },
                            ),
                            const Gap(15),
                            DropdownButtonFormField(
                              value: _destination,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.place,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  labelText: "Select Destination",
                                  labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                                  filled: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  fillColor: const Color(0xffd9d9d9),

                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      borderSide: const BorderSide(width: 0,style: BorderStyle.solid)
                                  )
                              ),
                              items: _destinations.map((String destination) {
                                  return DropdownMenuItem<String>(
                                    value: destination,
                                    child: Text(destination),
                                  );
                                }).toList(),
                              onChanged: (String? newValue) {
                                  setState(() {
                                    _destination = newValue;
                                  });
                                },
                            ),
                            TextButton(
                              onPressed: () { _selectDate(context); },
                              child: makeInput(
                                  label: _selectedDate == null
                                      ? 'Select Date'
                                      : 'Selected Date: ${_selectedDate.toString().substring(0, 10)}',
                                  icon: Icons.calendar_today_outlined,
                                  controller: _dateTextController,
                                  type: TextInputType.datetime
                              ),
                            ),
                            Visibility(
                                visible: isRoundTripSelected, // Show only when round trip is selected
                                child: makeInput(
                                  label: "Return Date",
                                  icon: Icons.add,
                                  controller: _dateTextController,
                                  type: TextInputType.datetime
                                ))
                          ],
                        )
                    ),
                    const Gap(10),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: (){
                              _searchTrips;
                              if (kDebugMode) {
                                print("btn clicked");
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xffa8dadc)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                            ),
                            child: const Text('Search',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),)
                        ),
                      ),
                    ),
                ]
              ),
            ),
          ),),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upcoming Trips',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'JetBrains Mono',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    const TicketView();
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      color: Color(0xFFE63946),
                      fontSize: 20,
                      fontFamily: 'JetBrains Mono',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Gap(20),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:EdgeInsets.only(left: 20),
            child: Row(
              children: [
                TicketView(),

              ],
            ),
          ),


        ],
      ),
    );
  }
}
