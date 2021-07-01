import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/core/usecases/usecase.dart';
import 'package:weeath_app_demo/features/location/domain/entities/location_failures.dart';
import 'package:weeath_app_demo/features/location/domain/usecases/get_current_user_location.dart';
import 'package:weeath_app_demo/features/location/presentation/bloc/current_location_bloc.dart';

class MockedGetCurrentUserLocation extends Mock implements GetCurrentUserLocation {}

void main() {
  late GetCurrentUserLocation _getCurrentUserLocation;

  final Failure _permissionFailure = PermissionDeniedFailure();
  final Position _randomPosition = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime(2020),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  setUp(() {
    _getCurrentUserLocation = MockedGetCurrentUserLocation();
  });

  group('Current location BLoC', () {
    blocTest<CurrentLocationBloc, CurrentLocationState>(
      'emits [loading, position] when success',
      build: () {
        when(() => _getCurrentUserLocation.execute(NoParams())).thenAnswer((_) async => Right(_randomPosition));
        return CurrentLocationBloc(_getCurrentUserLocation);
      },
      act: (CurrentLocationBloc bloc) async => bloc.loadUserLocation(),
      expect: () => <CurrentLocationState>[
        const CurrentLocationState.loading(),
        CurrentLocationState.userLocation(_randomPosition),
      ],
      verify: (_) {
        verify(() => _getCurrentUserLocation.execute(NoParams()));
        verifyNoMoreInteractions(_getCurrentUserLocation);
      },
    );

    blocTest<CurrentLocationBloc, CurrentLocationState>(
      'emits [loading, failure] when location permission are denied',
      build: () {
        when(() => _getCurrentUserLocation.execute(NoParams())).thenAnswer((_) async => Left(_permissionFailure));
        return CurrentLocationBloc(_getCurrentUserLocation);
      },
      act: (CurrentLocationBloc bloc) async => bloc.loadUserLocation(),
      expect: () => <CurrentLocationState>[
        const CurrentLocationState.loading(),
        CurrentLocationState.failed(_permissionFailure),
      ],
      verify: (_) {
        verify(() => _getCurrentUserLocation.execute(NoParams()));
        verifyNoMoreInteractions(_getCurrentUserLocation);
      },
    );
  });
}
