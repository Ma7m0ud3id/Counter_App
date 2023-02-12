import 'dart:async';

import 'package:counter_app/States.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyCubit extends Cubit<States> {
  MyCubit() : super(InitState());
  static MyCubit get(context) => BlocProvider.of(context);
  int count =0;
  increace()async{
    emit(LoadingincreaceState());
    //Future.delayed(Duration(milliseconds: 100), () {
      count++;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', count);
    //});


    emit(SuccessincreaceState());
  }
  decreace()async{
    emit(LoadingdecreaceState());

    //Timer(Duration(milliseconds: 500), () {
      count--;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', count);
    //});

    emit(SuccessdecreacState());
  }
  reset()async{
    emit(LoadingresetState());
    //Timer(Duration(milliseconds: 500), () {
      count=0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', count);
    //});

    emit(SuccessresetState());
  }


}