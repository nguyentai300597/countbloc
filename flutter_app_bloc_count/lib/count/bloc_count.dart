
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_count/count/event_bloc.dart';
import 'package:flutter_app_bloc_count/count/state_count.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class countbloc extends Bloc<eventcount,countstate>{
  int count=0;
  @override
  // TODO: implement initialState
  countstate get initialState => Success(count);

  @override
  Stream<countstate> mapEventToState(eventcount event) async*{
    // TODO: implement mapEventToState
   if(event is incremrnt)
     {
       print("da nhan");
       yield loading();

       await Future.delayed(Duration(seconds: 1));
       count++;
       yield Success(count);
       print(count);
     }
  }

}