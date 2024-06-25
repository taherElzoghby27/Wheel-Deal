import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/data.dart';
import 'package:cars/core/consts/strings.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:cars/features/profile/domain/entities/user_verification_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/identity_type_model.dart';
import '../../../domain/use_cases/user_verification_use_case.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final UserVerificationUseCase _userVerificationUseCase;

  VerificationCubit(this._userVerificationUseCase)
      : super(const VerificationState());
  String selectType = identities.first.type;
  IdentityTypeModel identityTypeModel = IdentityTypeModel(
    type: StringsEn.idCard,
  );
  XFile? imagePickerResult;

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
    imagePickerResult = await picker.pickImage(
      source: cameraOrGallery == StringsEn.camera
          ? ImageSource.camera
          : ImageSource.gallery,
    );
    if (imagePickerResult != null) {
      if (status == StringsEn.scanTheFront) {
        identityTypeModel.frontImage = File(imagePickerResult!.path);
        emit(
          state.copyWith(
            frontImage: File(imagePickerResult!.path),
            frontImageState: RequestState.loaded,
          ),
        );
      } else if (status == StringsEn.scanTheBack) {
        identityTypeModel.backImage = File(imagePickerResult!.path);
        emit(
          state.copyWith(
            backImage: File(imagePickerResult!.path),
            backImageState: RequestState.loaded,
          ),
        );
      } else {
        identityTypeModel.selfieImage = File(imagePickerResult!.path);
        emit(
          state.copyWith(
            selfieImage: File(imagePickerResult!.path),
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

  userVerification() async {
    if (state.frontImage != null) {
      emit(
        state.copyWith(
          userVerificationState: RequestState.loading,
        ),
      );
      await _userVerificationUseCase
          .call(
            UserVerificationEntity(
              image: File(imagePickerResult!.path),
            ),
          )
          .then(
            (value) => value.fold(
              (left) {
                emit(
                  state.copyWith(
                    failureUserVerification: left.message,
                    userVerificationState: RequestState.failure,
                  ),
                );
              },
              (right) {
                emit(
                  state.copyWith(
                    userVerificationResult: right,
                    userVerificationState: RequestState.loaded,
                  ),
                );
              },
            ),
          );
    } else {
      emit(
        state.copyWith(
          failureUserVerification: StringsEn.hintPickedImage,
          userVerificationState: RequestState.failure,
        ),
      );
    }
  }
}
