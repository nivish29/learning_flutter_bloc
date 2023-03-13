import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/bloc/internet_bloc/internet_state.dart';

enum InternetState2 { Initial, Lost, Gained }

class InternetCubit extends Cubit<InternetState2> {
  Connectivity _Connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetCubit() : super(InternetState2.Initial) {
    connectivitySubscription =
        _Connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState2.Gained);
      } else {
        emit(InternetState2.Lost);
      }
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    connectivitySubscription?.cancel();
    return super.close();
  }
}
