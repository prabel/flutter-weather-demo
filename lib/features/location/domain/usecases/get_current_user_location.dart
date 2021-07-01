import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weeath_app_demo/core/error/failures.dart';
import 'package:weeath_app_demo/core/usecases/usecase.dart';
import 'package:weeath_app_demo/features/location/domain/entities/location_failures.dart';
import 'package:weeath_app_demo/features/location/domain/repositories/location_repository.dart';

abstract class GetCurrentUserLocation extends UseCase<Position, NoParams> {}

class GetCurrentUserLocationImpl extends GetCurrentUserLocation {
  GetCurrentUserLocationImpl(this.locationRepository);

  final LocationRepository locationRepository;

  @override
  Future<Either<Failure, Position>> execute(NoParams params) async {
    LocationPermission permission = await locationRepository.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await locationRepository.requestPermission();
      if (permission == LocationPermission.denied) {
        return Left(PermissionDeniedFailure());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Left(PermissionDeniedFailure());
    }

    final bool isLocationServiceEnabled = await locationRepository.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Left(LocationServiceDisabledFailure());
    }

    return locationRepository.getCurrentPosition().then(
          (value) => Right(value),
          onError: (e) => Left(ClientFailure(e)),
        );
  }
}
