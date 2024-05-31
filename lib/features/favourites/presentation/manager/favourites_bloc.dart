import 'package:bloc/bloc.dart';
import 'package:cars/core/consts/enums.dart';
import 'package:cars/features/favourites/domain/use_cases/add_favourite_use_case.dart';
import 'package:cars/features/favourites/domain/use_cases/delete_favourite_use_case.dart';
import 'package:cars/features/home/domain/entities/car_entity.dart';
import 'package:equatable/equatable.dart';

import '../../domain/use_cases/get_favourites_use_case.dart';

part 'favourites_event.dart';

part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  final GetFavouritesUseCase _getFavouritesUseCase;
  final AddFavUseCase _addFavUseCase;
  final DeleteFavUseCase _deleteFavUseCase;

  FavouritesBloc(
    this._getFavouritesUseCase,
    this._addFavUseCase,
    this._deleteFavUseCase,
  ) : super(const FavouritesState()) {
    on<FavouritesEvent>(
      (event, emit) async {
        if (event is AddFavEvent) {
          await addFavouriteEventMethod(emit, event);
        } else if (event is DeleteFavEvent) {
          await deleteFavouriteEventMethod(emit, event);
        } else if (event is GetFavEvent) {
          await getFavEventMethod(emit);
        }
      },
    );
  }

  List<CarEntity> favouritesList = [];

  Future<void> getFavEventMethod(Emitter<FavouritesState> emit) async {
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

  Future<void> deleteFavouriteEventMethod(
    Emitter<FavouritesState> emit,
    DeleteFavEvent event,
  ) async {
    emit(
      state.copyWith(deleteFavouritesState: RequestState.loading),
    );
    await _deleteFavUseCase.call(event.carEntity.id.toInt()).then(
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
              deleteCarFromFavList(event.carEntity);
              emit(
                state.copyWith(
                  deleteFavouritesState: RequestState.loaded,
                ),
              );
            },
          ),
        );
  }

  Future<void> addFavouriteEventMethod(
    Emitter<FavouritesState> emit,
    AddFavEvent event,
  ) async {
    emit(
      state.copyWith(addFavouritesState: RequestState.loading),
    );
    await _addFavUseCase.call(event.carEntity.id.toInt()).then(
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
              addCarToFavList(event.carEntity);
              emit(
                state.copyWith(
                  addFavouritesState: RequestState.loaded,
                ),
              );
            },
          ),
        );
  }

  void addCarToFavList(CarEntity carEntity) {
    favouritesList.add(carEntity);
  }

  void deleteCarFromFavList(CarEntity carEntity) {
    favouritesList = favouritesList
        .where(
          (item) => item.id == carEntity.id,
        )
        .toList();
  }
}
