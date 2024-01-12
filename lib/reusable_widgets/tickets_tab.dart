import 'package:flutter/material.dart';

class TicketsTab extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  //final Function onTap;
  const TicketsTab({super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
          padding: const EdgeInsets.all(3.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xFFD9D9D9)
          ),
          child: Row(
            children: [
              /* container holds first element*/
              Container(
                width: MediaQuery.of(context).size.width*.44,
                padding: const EdgeInsets.symmetric(vertical:7),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                    color: Colors.white
                ),
                child: Center(child: Text(firstTab, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
              ),
              /* container second element*/
              Container(
                width: MediaQuery.of(context).size.width*.44,
                padding: const EdgeInsets.symmetric(vertical: 7),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
                    color: Colors.transparent
                ),
                child: Center(child: Text(secondTab, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400))),
              )
            ],
          ),
        )
    );
  }
}
