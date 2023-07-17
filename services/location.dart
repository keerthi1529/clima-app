import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
class Location{
  double latitude=0;
  double longitude=0;
 Future <void> getCurrentLocation() async{
    PermissionStatus permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude =position.latitude;
        longitude=position.longitude;
      }
      catch (e){
        print(e);
      }
    }
    else if (permissionStatus.isDenied) {
      print('Location permission denied by the user');
      // Handle the denial scenario
    } else if (permissionStatus.isPermanentlyDenied) {
      print('Location permission permanently denied');
      // Prompt the user to open app settings and grant permission manually
    }
  }
}