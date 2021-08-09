import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(
    MaterialApp(
      home: myGPSapp(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class myGPSapp extends StatefulWidget {
  @override
  _myGPSappState createState() => _myGPSappState();
}

class _myGPSappState extends State<myGPSapp> {
  mybutton() async {
    var p = await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(p);
  }

  var lat1 = 24.9140082;
  var long1 = 79.5823718;
  @override
  Widget build(BuildContext context) {
    var cp = CameraPosition(
      target: LatLng(lat1, long1),
      zoom: 19,
      tilt: 50,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: cp,
        mapType: MapType.hybrid,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mybutton,
        child: Icon(Icons.add),
      ),
    );
  }
}
