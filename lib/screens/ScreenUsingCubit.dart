import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/bloc/internet_bloc/internet_bloc.dart';
import 'package:learning_flutter_bloc/bloc/internet_bloc/internet_state.dart';
import 'package:learning_flutter_bloc/cubit/internet_state.dart';

class HomeScreenUsingCubit extends StatelessWidget {
  const HomeScreenUsingCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            //   child: BlocBuilder<InternetBloc, InternetState>(
            //   builder: (context, state) {
            //     // == is used to check value
            //     // 'is' is used to check data type
            //     // bloc builder is used to create an ui
            //     // bloc listener is used to make some background task
            //     // bloc consumer is mixture of both bloc listener and bloc builder
            //     if (state is InternetGainedState) {
            //       return Text('Connected');
            //     } else if (state is InternetLostState) {
            //       return Text('Not Connected');
            //     } else {
            //       return Text('Loading...');
            //     }
            //     return Text('Loading');
            //   },
            // ),
            child: BlocConsumer<InternetCubit, InternetState2>(
          listener: (context, state) {
            // TODO: implement listener
            if (state == InternetState2.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Internet Connected'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ));
            } else if (state == InternetState2.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Disconnected'),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state == InternetState2.Gained) {
              return Text('Connected');
            } else if (state == InternetState2.Lost) {
              return Text('Not Connected');
            } else {
              return Text('Loading...');
            }
            return Text('Loading');
          },
        )),
      ),
    );
  }
}
