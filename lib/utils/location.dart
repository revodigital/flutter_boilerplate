import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

enum LocationServiceStatus {
  idle,
  asking,
  granted,
  rejected
}

class LocationService {
  Future<bool> requestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      PermissionStatus status = await Permission.locationWhenInUse.request();
      return (status == PermissionStatus.restricted || status == PermissionStatus.provisional || status == PermissionStatus.granted || status == PermissionStatus.limited);
    }

    return false;
  }

  Future<bool> getPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      bool status = await Permission.locationWhenInUse.isGranted;
      return status;
    }

    return false;
  }

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      final result = await requestPermission();
      if (result == true) {
        Position locationData = await Geolocator.getCurrentPosition();
        return locationData;
      } else {
        return null;
      }
    }

    return null;
  }
}