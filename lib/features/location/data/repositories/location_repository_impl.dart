import 'package:geolocator/geolocator.dart';
import 'package:weeath_app_demo/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<Position> getCurrentPosition() {
    return Geolocator.getCurrentPosition();
  }

  @override
  Future<bool> isLocationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<LocationPermission> requestPermission() {
    return Geolocator.requestPermission();
  }

  @override
  Future<LocationPermission> checkPermission() {
    return Geolocator.checkPermission();
  }
}
