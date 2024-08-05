part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChange extends CounterState{

  final int counter ;
  final Color randomColor;


  CounterChange(this.counter, this.randomColor);
}