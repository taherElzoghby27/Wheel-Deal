import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/verification/data/models/identity_type_model.dart';
import 'package:image_picker/image_picker.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(const VerificationState());
  String selectType = identities.first.type;
  IdentityTypeModel identityTypeModel = IdentityTypeModel(
    type: StringsEn.idCard,
  );

  changeTypeIdentity(String value) {
    selectType = value;
    reset();
    emit(IdentityChanged());
  }

  pickImage({
    required String status,
    required String cameraOrGallery,
  }) async {
    if (status == StringsEn.scanTheFront) {
      emit(state.copyWith(frontImageState: RequestState.loading));
    } else if (status == StringsEn.scanTheBack) {
      emit(state.copyWith(backImageState: RequestState.loading));
    } else {
      emit(state.copyWith(selfieImageState: RequestState.loading));
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
        emit(
          state.copyWith(
            frontImage: File(imagePickerResult.path),
            frontImageState: RequestState.loaded,
          ),
        );
      } else if (status == StringsEn.scanTheBack) {
        identityTypeModel.backImage = File(imagePickerResult.path);
        emit(
          state.copyWith(
            backImage: File(imagePickerResult.path),
            backImageState: RequestState.loaded,
          ),
        );
      } else {
        identityTypeModel.selfieImage = File(imagePickerResult.path);
        emit(
          state.copyWith(
            selfieImage: File(imagePickerResult.path),
            selfieImageState: RequestState.loaded,
          ),
        );
      }
    } else {
      emit(state.copyWith(imageError: StringsEn.messageErrorPhoto));
    }
  }

  reset() {
    state.copyWith(
      frontImage: null,
      frontImageState: RequestState.initial,
      backImage: null,
      backImageState: RequestState.initial,
      selfieImage: null,
      selfieImageState: RequestState.initial,
    );
  }

  changeLoadingCurrent(int value) {
    emit(CurrentLoadingChanged(value));
  }
}
