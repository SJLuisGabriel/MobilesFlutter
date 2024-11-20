// import 'dart:async';

// import 'package:location/location.dart';
// import 'package:progmsn2024/services/user_location.dart';

// class LocationService {
//   UserLocation? _currentLocation;
//   var location = Location();

//   StreamController<UserLocation> _locationController =
//       StreamController<UserLocation>();

//   Future<UserLocation?> getLocation() async {
//     try {
//       var userLocation = await location.getLocation();
//       _currentLocation = UserLocation(
//         latitude: userLocation.latitude!,
//         longitude: userLocation.longitude!,
//       );
//     } catch (e) {}
//     return _currentLocation;
//   }
// }
