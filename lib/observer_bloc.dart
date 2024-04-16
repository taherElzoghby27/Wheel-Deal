import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class Observe extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log(bloc.state.toString());
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log(bloc.state.toString());
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log(transition.toString());
    super.onTransition(bloc, transition);
  }
}
