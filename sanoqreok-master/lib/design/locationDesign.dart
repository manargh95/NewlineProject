import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class loc {

  Set<Marker> jarir = {
    Marker(
        markerId: MarkerId("1"),
        position: LatLng(24.77391546416979, 46.756571274331165),
        infoWindow: InfoWindow(title: "j"),
        onTap: () {},
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),

  };
  Set<Marker> kalemat = {


    Marker(
        markerId: MarkerId("2"),
        position: LatLng(29.174676495694186, 48.08701780679124),
        infoWindow: InfoWindow(title: "k"),
        onTap: () {},
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),

  };

  Set<Marker> obekan = {

    Marker(
        markerId: MarkerId("3"),
        position: LatLng(24.717722200113695, 46.64879401275961),
        infoWindow: InfoWindow(title: "o"),
        onTap: () {},
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
  };
}