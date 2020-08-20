import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';
export 'event.dart';
export 'state.dart';

class MyCubit extends Cubit<MyState> {
  MyCubit() : super(StateA());

  void changeToStateB() => emit(StateB());
  void changeToStateA() => emit(StateA());
}
