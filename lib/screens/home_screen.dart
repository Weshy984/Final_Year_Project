//import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tiqiti/reusable_widgets/reusable_widgets.dart';
import 'package:tiqiti/screens/profile_screen.dart';
import 'package:tiqiti/screens/search_screen.dart';
import 'package:tiqiti/screens/ticket_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //_fromTextController, _toTextController,
 late TextEditingController _dateTextController;
 bool isRoundTripSelected = false;
 String? _selectedLocation;
 String? _destination;// Variable to hold the selected location
 List<String> locations = [
   'Nyeri',
   'Karatina',
   'Sagana',
   'Thika',
   'Juja',
   'Kenyatta Road',
   'Kimbo',
   'Ruiru',
   'Githurai',
   'Roysambu',
   'Olsopps',
   'Ngara',
   'Nairobi'
 ];
 /*DateTime? _selectedDate; // Track selected date

 Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
   final DateTime? picked = await showDatePicker(
     context: context,
     initialDate: _selectedDate ?? DateTime.now(),
     firstDate: DateTime.now(),
     lastDate: DateTime(2101),
   );

   if (picked != null && picked != _selectedDate) {
     setState(() {
       _selectedDate = picked;
       // Update the controller
       controller.text = _selectedDate.toString();
     });
   }
 }*/
 @override
 void initState(){
   //TODO:implement initState
   super.initState();
   //_fromTextController=TextEditingController();
   //_toTextController=TextEditingController();
   _dateTextController=TextEditingController();
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
                        MaterialPageRoute(builder: (context)=> const SearchScreen()));
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
                              items: locations.map((String location) {
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
                              items: locations.map((String location) {
                                  return DropdownMenuItem<String>(
                                    value: location,
                                    child: Text(location),
                                  );
                                }).toList(),
                              onChanged: (String? newValue) {
                                  setState(() {
                                    _destination = newValue;
                                  });
                                },
                            ),
                            makeInput(
                                label: "Travel Date",
                                icon: Icons.calendar_today_outlined,
                                controller: _dateTextController,
                                type: TextInputType.datetime
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
                                       // reusableTextField2("Enter Destination", Icons.place, _toTextController),
                    const Gap(10),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>const SearchScreen())
                              );
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
                    const Gap(15)
                  ],
                ),
              ),
            ),
          ),
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
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> const SearchScreen()));
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
                TicketView(),
                TicketView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
