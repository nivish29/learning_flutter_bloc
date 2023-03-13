import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/bloc/internet_bloc/internet_bloc.dart';
import 'package:learning_flutter_bloc/screens/HomeScreen.dart';
import 'package:learning_flutter_bloc/screens/ScreenUsingCubit.dart';

import 'cubit/internet_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => InternetBloc(),  //using bloc
      create: (context) => InternetCubit(), //using cubit
      child: MaterialApp(
        title: 'Flutter Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeScreen(),
        home: HomeScreenUsingCubit(),
      ),
    );
  }
}
