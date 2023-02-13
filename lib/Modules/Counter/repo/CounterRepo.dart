
import 'package:counter_app/Modules/Counter/DataSource/dataSource.dart';

class CounterRepo{
  final  Sherdpref _counterRepo;

  CounterRepo(this._counterRepo);

   getcounter()async{
    try {
      _counterRepo.set();
      int count= await _counterRepo.get() ;
      return  count;
    }catch(e){
      throw "an error";
    }
  }

}