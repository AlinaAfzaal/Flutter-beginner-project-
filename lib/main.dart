import 'dart:math';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Game",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final primaryColor = Colors.purpleAccent;
  final secondaryColor = Colors.purpleAccent;
  Random n = Random();
  var num = 5;
  var spinNum = 0;
  var total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spin and Win"),
        backgroundColor: primaryColor,
        actions: [
          Center(child: Text("Total Coins: $total", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19,),)),
          const SizedBox(width: 17,)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("You Winning Number is $num",
            style: const TextStyle(fontSize: 20,color: Colors.purpleAccent, fontWeight: FontWeight.bold),)),
         const SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),

            ),
            child: spinNum==5?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                  size: 55,
                ),
                Text("You Won Spin Number is\n $spinNum",
                  style: const TextStyle(fontSize: 20,color: Colors.white,),
                ),
              ],
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.thumb_down,
                  color: Colors.white,
                  size: 55,
                ),
                Text("Try Again Spin Number is\n $spinNum",
                  style: const TextStyle(fontSize: 20,color: Colors.white,),
                ),
              ],
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            spinNum = n.nextInt(6);
            if(spinNum==num){total = total + 1; }
          });
        },
        tooltip: 'Spin',
        child:Icon(Icons.refresh_outlined),
        backgroundColor: primaryColor,
      ),
    );
  }
}
