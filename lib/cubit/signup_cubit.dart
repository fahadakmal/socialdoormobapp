import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialdoormobile/data/repositery.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final Repositery repositery;

  SignupCubit({this.repositery}) : super(SignupInitial());
}
