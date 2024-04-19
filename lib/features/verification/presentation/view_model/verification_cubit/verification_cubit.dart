import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/data.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());
  String selectType = identities.first.type;

  changeTypeIdentity(String value) {
    selectType = value;
    emit(IdentityChanged());
  }
}
