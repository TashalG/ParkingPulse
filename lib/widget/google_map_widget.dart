import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  final LatLng _initialPosition = const LatLng(45.0918, -64.3598); // Default to Wolfville, NS

  void _addMarker(LatLng position) {
    final markerId = MarkerId(position.toString());
    final marker = Marker(
      markerId: markerId,
      position: position,
      infoWindow: InfoWindow(
        title: "Parking Spot",
        snippet: "Lat: ${position.latitude}, Lng: ${position.longitude}",
      ),
    );

    setState(() {
      _markers.clear(); // Ensure only one marker exists
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
          _addMarker(position); // Add a marker at the tapped position
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _removeMarker, // Clear all markers when pressed
        child: const Icon(Icons.delete),
      ),
    );
  }
}