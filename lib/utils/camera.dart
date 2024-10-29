/*import 'package:permission_handler/permission_handler.dart';

enum CameraServiceStatus {
  idle,
  asking,
  granted,
  rejected
}

class CameraService {
  Future<bool> requestPermission() async {
    PermissionStatus status = await Permission.camera.request();
    return (status == PermissionStatus.restricted || status == PermissionStatus.provisional || status == PermissionStatus.granted || status == PermissionStatus.limited);
  }

  Future<bool> getPermission() async {
    PermissionStatus status = await Permission.camera.status;
    return (status == PermissionStatus.restricted || status == PermissionStatus.provisional || status == PermissionStatus.granted || status == PermissionStatus.limited);
  }
}*/