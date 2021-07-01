import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/core/usecases/usecase.dart';
import 'package:weeath_app_demo/features/location/domain/repositories/location_repository.dart';
import 'package:weeath_app_demo/features/location/domain/usecases/get_current_user_location.dart';

part 'current_location_bloc.freezed.dart';

part 'current_location_state.dart';

class CurrentLocationBloc extends Cubit<CurrentLocationState> {
  CurrentLocationBloc(this.getCurrentUserLocation) : super(const CurrentLocationState.initial());

  factory CurrentLocationBloc.fromContext(BuildContext context) {
    return CurrentLocationBloc(
      GetCurrentUserLocationImpl(
        context.read<LocationRepository>(),
      ),
    );
  }

  final GetCurrentUserLocation getCurrentUserLocation;

  Future<void> loadUserLocation() async {
    emit(const CurrentLocationState.loading());
    final Either<Failure, Position> eitherResults = await getCurrentUserLocation.execute(NoParams());
    eitherResults.fold(
      (Failure failure) => emit(CurrentLocationState.failed(failure)),
      (Position position) => emit(CurrentLocationState.userLocation(position)),
    );
  }
}
