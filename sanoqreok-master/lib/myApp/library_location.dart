import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sanoqreok/design/locationDesign.dart';
import '../design/appBar.dart';
import 'dart:async';

class library_location extends StatefulWidget {
  @override
  State<library_location> createState() => _library_locationState();
}

class _library_locationState extends State<library_location> {
  late GoogleMapController gmc;

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: simpleappBar("مكتبات"),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Card(
            child: Column(children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 250,
                      height: 180,
                      padding: const EdgeInsets.all(5),
                      child: GoogleMap(
                        markers: loc().jarir,
                        mapType: MapType.normal,
                        initialCameraPosition: const CameraPosition(
                            target:
                                LatLng(24.77391546416979, 46.756571274331165),
                            zoom: 10),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      )),
                  Image.asset(
                    "assets/jarir.png",
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 250,
                      height: 180,
                      padding: const EdgeInsets.all(5),
                      child: GoogleMap(
                        markers: loc().kalemat,
                        mapType: MapType.normal,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(29.174676495694186, 48.08701780679124),
                          zoom: 10,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      )),
                  Image.asset(
                    "assets/kalemat.png",
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 250,
                      height: 180,
                      padding: const EdgeInsets.all(5),
                      child: GoogleMap(
                        markers: loc().obekan,
                        mapType: MapType.normal,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(24.717722200113695, 46.64879401275961),
                          zoom: 10,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      )),
                  Image.asset(
                    "assets/obekan.png",
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
