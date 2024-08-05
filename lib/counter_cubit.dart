import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int counter = 0;
  final List<Color> listOfColor =[
    Colors.red,
    Colors.orange,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.lightGreen,
    Colors.green,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,

  ];

  void incrementCounter() {
    final randomNumber =Random().nextInt(listOfColor.length);
    final randomColor = listOfColor[randomNumber];


    counter++;
    emit(CounterChange(counter,randomColor));

    Future.delayed(Duration(milliseconds: 200),incrementCounter);
  }
}
