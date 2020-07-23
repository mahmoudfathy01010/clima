import 'dart:io';

import 'package:geolocator/geolocator.dart';

void main(){
performesTasks();
}

Position _currentPosition;
getLocation() async {
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
}

void performesTasks() async{
  task1();
  print(task2());
  String result= await task2();
  task3(result);
}

void task1(){
  String result='task 1 data';
  print("Hello from task1");
}
Future<String> task2() async{
  Duration threeSceond = Duration(seconds: 3);
  String result;

  await Future.delayed(threeSceond,(){
    result='task 2 data';
    print("Type ${result.runtimeType}");
    print("Hello from task2");
  });
  print("Type ${result.runtimeType}");
  return result;
}
void task3(String task2){
  String result='task 3 data';
  print("Hello from task3 complete with $task2");
}