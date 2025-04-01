import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkingpulse/controllers/database_controller.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  final LatLng _initialPosition = const LatLng(45.0918, -64.3598); // Default to Wolfville, NS

  getMarkers() async
  {
    final parkingList = await DatabaseController.instance().getAvailableParkingLots();
    for (var parkingLot in parkingList) 
    {
      PlaceMarker(LatLng(parkingLot['latitude'] ,parkingLot['longitude']),parkingLot['adress']);
    }
  }
  void PlaceMarker(LatLng position, String _address) {
    final markerId = MarkerId(position.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
      infoWindow: InfoWindow(
        title: _address,
        snippet: "Lat: ${position.latitude}, Lng: ${position.longitude}",
      ),
    );

    setState(() {
      _markers.add(marker);
    });
  }

  void _removeMarker() {
    setState(() {
      _markers.clear(); // Remove all markers
    });
  }

  @override
  Widget build(BuildContext context) {
    getMarkers();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        markers: _markers,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        onTap: (position) {
          //PlaceMarker(position); // Add a marker at the tapped position
        },
      ),
    );
  }
}