import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/verification/data/models/identity_type_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());
  String selectType = identities.first.type;
  IdentityTypeModel identityTypeModel = IdentityTypeModel(
    type: StringsEn.idCard,
  );

  changeTypeIdentity(String value) {
    selectType = value;
    emit(IdentityChanged());
  }

  pickImage({
    required String status,
    required String cameraOrGallery,
  }) async {
    if (status == StringsEn.scanTheFront) {
      emit(PickedImagedLoadingFront());
    } else if (status == StringsEn.scanTheBack) {
      emit(PickedImagedLoadingBack());
    } else {
      emit(PickedImagedLoadingSelfie());
    }

    final picker = ImagePicker();
    final imagePickerResult = await picker.pickImage(
      source: cameraOrGallery == StringsEn.camera
          ? ImageSource.camera
          : ImageSource.gallery,
    );
    if (imagePickerResult != null) {
      if (status == StringsEn.scanTheFront) {
        identityTypeModel.frontImage = File(imagePickerResult.path);
        emit(PickedImagedLoadedFront());
      } else if (status == StringsEn.scanTheBack) {
        identityTypeModel.backImage = File(imagePickerResult.path);
        emit(PickedImagedLoadedBack());
      } else {
        identityTypeModel.selfieImage = File(imagePickerResult.path);
        emit(PickedImagedLoadedSelfie());
      }
    } else {
      emit(PickedImagedFailure());
    }
  }
}
