import 'dart:async';



import 'package:counter_app/Modules/Counter/Cubit/States.dart';
import 'package:counter_app/Modules/Counter/DataSource/dataSource.dart';
import 'package:counter_app/Modules/Counter/repo/CounterRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MyCubit extends Cubit<States> {
  MyCubit() : super(InitState());
  static MyCubit get(context) => BlocProvider.of(context);
  int count =0;
  increace()async{
    emit(LoadingincreaceState());

     final prefs = await SharedPreferences.getInstance();

    final data=CounterRepo(Sherdpref(
      prefs,count
    ));
    count=await data.getcounter() ;
    count++;

    emit(SuccessincreaceState());
  }
  decreace()async{
    emit(LoadingdecreaceState());

    final prefs = await SharedPreferences.getInstance();

    final data=CounterRepo(Sherdpref(
        prefs,count
    ));
    count=await data.getcounter() ;
    count--;
    emit(SuccessdecreacState());
  }
  reset()async{
    emit(LoadingresetState());

      count=0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', count);


    emit(SuccessresetState());
  }


}