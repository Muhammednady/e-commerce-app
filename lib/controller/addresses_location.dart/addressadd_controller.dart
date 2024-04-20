import 'package:ecommerceapp/core/constant/connection_status.dart';
import 'package:ecommerceapp/core/constant/routes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAddController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    getCurrentLocation();
  }

  ConnectionStatus connectionStatus = ConnectionStatus.NONE;
  CameraPosition? cameraPosition;
  Position? currentPosition;

  LatLng? latLng;
  List<Marker> markers = [];

  getCurrentLocation() async {
    connectionStatus = ConnectionStatus.LOADING;
    update();
    if (!await Geolocator.isLocationServiceEnabled()) {
      Get.defaultDialog(title: 'alert', middleText: 'Enable Service Location');
    }

    LocationPermission result = await Geolocator.checkPermission();
    if (result == LocationPermission.denied) {
      result = await Geolocator.requestPermission();
    }
    if (result == LocationPermission.deniedForever) {
      Get.defaultDialog(
          title: 'alert',
          middleText: 'Can\'t get Location Without Your Permission');
    }
    if (result == LocationPermission.whileInUse ||
        result == LocationPermission.always) {
      currentPosition = await Geolocator.getCurrentPosition();
      print('========================+++++++++++++0000000000');
      print(currentPosition!);
      cameraPosition = CameraPosition(
          zoom: 14.3,
          target:
              LatLng(currentPosition!.latitude, currentPosition!.longitude));
      markers.add(Marker(
          markerId: const MarkerId('1'),
          position:
              LatLng(currentPosition!.latitude, currentPosition!.longitude)));
    }
    connectionStatus = ConnectionStatus.SUCCESS;
    update();
  }
  List<Placemark> placemarks = [];
  void getFinalLocation(LatLng argument) async {
    latLng = argument;
    print('latlng ::::::::::::: ${latLng}');
    placemarks =
        await placemarkFromCoordinates(latLng!.latitude, latLng!.longitude);
    placemarks[0];
    markers.clear();
    markers.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(latLng!.latitude, latLng!.longitude)));

    //
    update();
  }

  // Map data = {
  //   "street": address.value,
  //   "city": city.value,
  //   "country": country.value,
  //   "latitude": latitude.value,
  //   "longitude": longitude.value,
  //   "title": txtTitle.text,
  //   "notes": txtNotes.text,
  // };

goToAddressDetails(){
    if(placemarks.isNotEmpty){
      Map data = {
        "street": placemarks.first.street,
        "city": placemarks.first.administrativeArea,
        "country": placemarks.first.country,
        "latitude": latLng!.latitude,
        "longitude": latLng!.longitude,
      };
      Get.toNamed(AppRoutes.addressDetails , arguments:data );

    }
    //var addressDetails;
   // Get.toNamed(AppRoutes.addressDetails , arguments: )
}




}
