import 'package:bloc/bloc.dart';
import 'package:cars/features/favourites/domain/use_cases/add_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/delete_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/get_favourites_use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:cars/features/home/presentation/view_model/home_bloc/home_bloc.dart';
import 'package:equatable/equatable.dart';

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
  var favouriteList = [];

  bool isFav(String idCar) {
    return favouriteList.any((item) => item.id == idCar);
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
                  addFavouritesState: RequestState.failure,
                  addFavouritesFailureMessage: failure.message,
                ),
              );
            },
            (success) {
              //add car to list
              favouriteList.add(carEntity);
              emit(
                state.copyWith(
                  addFavouritesState: RequestState.loaded,
                ),
              );
            },
          ),
        );
  }

  void deleteFav(CarEntity carEntity) async {
    emit(
      state.copyWith(deleteFavouritesState: RequestState.loading),
    );
    await _deleteFavUseCase.call(carEntity.id).then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  deleteFavouritesState: RequestState.failure,
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

  void getFav() async {
    await _getFavouritesUseCase.call().then(
          (value) => value.fold(
            (failure) {
              emit(
                state.copyWith(
                  getFavouritesState: RequestState.failure,
                  getFavouritesFailureMessage: failure.message,
                ),
              );
            },
            (List<CarEntity> favourites) {
              favouriteList = favourites;
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
    favouriteList.removeWhere((item) => item.id == carEntity.id);
  }
}
