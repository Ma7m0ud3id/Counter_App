import 'dart:async';


import 'package:counter_app/Modules/Counter/Cubit/Cubit.dart';
import 'package:counter_app/Modules/Counter/Cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter app',
      theme: ThemeData(
      ),
      home: MyHomePage(),
    );
  }
}/////

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    //save(context);
    index();
    return Scaffold(

      appBar: AppBar(centerTitle: true, title: Text('Counter app'),),
      body: BlocProvider(
        create: (context) => MyCubit(),

        child: BlocConsumer<MyCubit, States>(
            listener: (context, state) {


            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myText(),
                  Row(
                    children: [
                      Expanded(child: increace()),
                      Expanded(child: decreace()),
                      Expanded(child: reset()),
                    ],
                  )
                ],
              );

            }
        ),

      ),);
  }
  static index()async{
    final prefs = await SharedPreferences.getInstance();
    final int? counter = prefs.getInt('counter');
    print('*********************************************= ${counter}');//look in terminal
  }
}

class myText extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        Expanded(
          child: Container(height: MediaQuery
              .of(context)
              .size
              .height * 0.25,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('${MyCubit
                  .get(context)
                  .count}',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),))),
        ),
      ],
    );
  }

}

class increace extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
        primary: Colors.green

    ),
        onPressed: () {
          Timer(Duration(milliseconds: 500), () {
          MyCubit.get(context).increace();
          MyHomePage.index();
          });
        },
        child: Text('Increace',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),));
  }
}

class decreace extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
        primary: Colors.red

    ),
        onPressed: () {
          Timer(Duration(milliseconds: 500), () {
          MyCubit.get(context).decreace();
          MyHomePage.index();
          });
        },
        child: Text('Decreac',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),));
  }
}

class reset extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
        primary: Colors.grey

    ),
        onPressed: () {
         Timer(Duration(milliseconds: 500), () {
          MyCubit.get(context).reset();
          MyHomePage.index();
         });
        },
        child: Text('Reset',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),));
  }
}







