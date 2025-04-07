import 'package:flutter/material.dart';

import '../services/camera_service.dart';
import '../services/location_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationService _locationService = LocationService();
  String? latitude;
  String? longitude;

  void _getLocation() async {
    final location = await _locationService.requestLocationPermission();
    if (location != null) {
      setState(() {
        latitude = location.latitude?.toString();
        longitude = location.longitude?.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OutlinedButton(
            child: const Text("카메라"),
            onPressed: () => CameraService.openCamera(context),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            child: const Text("Get Location"),
            onPressed: _getLocation,
          ),
          const SizedBox(height: 16),
          Text("Latitude: ${latitude ?? ""}"),
          Text("Longitude: ${longitude ?? ""}"),
        ],
      ),
    );
  }
}
