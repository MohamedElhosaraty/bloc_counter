import 'package:bloc_counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: state is CounterChange ?
                  state.randomColor : Colors.red),
            ),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterCubit, CounterState>(
              builder: ( context, state) {
                if(state is CounterChange){
                  return  Text(
                    'You have pushed the button this many times:',style: TextStyle(
                    color: state.randomColor,
                    fontSize: 20
                  ),
                  );
                }
                return Text(
                  'You have pushed the button this many times:',style: TextStyle(
                    color: Colors.red,
                    fontSize: 20
                ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state is CounterChange) {
                  return Text(
                      state.counter.toString(),
                      style: TextStyle(
                        color: state.randomColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      )
                  );
                }
                return Text(
                  'Start',
                  style: TextStyle(color: Colors.blue)
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return FloatingActionButton(
            backgroundColor: state is CounterChange ? state.randomColor : Colors.red,
            onPressed: () => context.read<CounterCubit>().incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
