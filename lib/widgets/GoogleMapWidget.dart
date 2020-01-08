import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  double _lat = -20.161643;
  double _lon = -44.88121470;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps Location"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(_lat, _lon),
          zoom: 17,
        ),
        markers: Set.of(_getMarkers()),
      ),
    );
  }

  List<Marker> _getMarkers() {
    return [
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(_lat, _lon),
        infoWindow: InfoWindow(
          title: "Home",
          snippet: "Casa do Igor em Divinópolis",
        ),
      )
    ];
  }
}
