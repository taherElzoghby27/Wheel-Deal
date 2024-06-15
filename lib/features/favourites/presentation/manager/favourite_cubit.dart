import 'package:bloc/bloc.dart';
import 'package:cars/features/favourites/domain/use_cases/add_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/delete_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/get_favourites_use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/consts/enums.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final GetFavouritesUseCase _getFavouritesUseCase;
  final AddFavUseCase _addFavUseCase;
  final DeleteFavUseCase _deleteFavUseCase;

  FavouriteCubit(
    this._getFavouritesUseCase,
    this._addFavUseCase,
    this._deleteFavUseCase,
  ) : super(const FavouriteState());
  List<CarEntity> favouritesList = [];

  bool isFav(String idCar) {
    return favouritesList.any((item) => item.id == idCar);
  }

  addFav(CarEntity carEntity) async {
    emit(
      state.copyWith(addFavouritesState: RequestState.loading),
    );
    await _addFavUseCase.call(carEntity.id).then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  addFavouritesState: RequestState.error,
                  addFavouritesFailureMessage: failure.message,
                ),
              );
            },
            (success) {
              //add car to list
              favouritesList.add(carEntity);
              emit(
                state.copyWith(
                  addFavouritesState: RequestState.loaded,
                ),
              );
            },
          ),
        );
  }

  deleteFav(CarEntity carEntity) async {
    emit(
      state.copyWith(deleteFavouritesState: RequestState.loading),
    );
    await _deleteFavUseCase.call(carEntity.id).then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  deleteFavouritesState: RequestState.error,
                  deleteFavouritesFailureMessage: failure.message,
                ),
              );
            },
            (success) async {
              //delete car from list
              deleteCarFromFavList(carEntity);
              emit(
                state.copyWith(
                  deleteFavouritesState: RequestState.loaded,
                ),
              );
            },
          ),
        );
  }

  getFav() async {
    await _getFavouritesUseCase.call().then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  getFavouritesState: RequestState.error,
                  getFavouritesFailureMessage: failure.message,
                ),
              );
            },
            (List<CarEntity> favourites) {
              favouritesList = favourites;
              emit(
                state.copyWith(
                  getFavouritesState: RequestState.loaded,
                  favourites: favourites,
                ),
              );
            },
          ),
        );
  }

  void deleteCarFromFavList(CarEntity carEntity) {
    favouritesList.removeWhere((item) => item.id == carEntity.id);
  }
}
