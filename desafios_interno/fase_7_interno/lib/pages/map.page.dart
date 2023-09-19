import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/my_bottom_navigation_bar.widget.dart';
import '../widgets/my_floating_action_buttons.widget.dart';
import '../widgets/search_input_button.widget.dart';
import '../widgets/shortcut_list.widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with WidgetsBindingObserver {
  GoogleMapController? controller;
  CameraPosition? cameraPosition;
  late String mapStyle;
  bool canShowMap = false;

  Future<void> _determineInitialPosition() async {
    final position = await _getPosition();

    cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 17,
    );
  }

  Future<Position> _getPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('SERVICE_NOT_ENABLE');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('LOCATION_PERMISSION_DENIED');
    }
    final position = await Geolocator.getCurrentPosition();

    return position;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    rootBundle.loadString('assets/map/dark-theme.json').then((string) {
      mapStyle = string;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    log("state", error: state);
    if (state == AppLifecycleState.resumed) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _determineInitialPosition(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            final error = snapshot.error as String;
            if (error == "SERVICE_NOT_ENABLE") {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text("Serviço de localização desabilitado"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () async {
                      await Geolocator.openLocationSettings();
                      setState(() {});
                    },
                    child: const Text("Habilitar serviço"),
                  )
                ],
              );
            }
            if (error == "LOCATION_PERMISSION_DENIED") {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text("Permissão de localização negada."),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () async {
                      final permission = await Geolocator.requestPermission();
                      if (permission == LocationPermission.deniedForever) {
                        await Geolocator.openAppSettings();
                      }
                      setState(() {});
                    },
                    child: const Text("Conceder permissão"),
                  )
                ],
              );
            }
          }

          return Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: cameraPosition!,
                onMapCreated: (GoogleMapController mapController) {
                  controller = mapController;
                  controller!.setMapStyle(mapStyle);
                },
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: MyFloatingActionButtons(
                  controller: controller,
                  cameraPosition: cameraPosition,
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Column(
                  children: const [
                    SearchInputButton(),
                    ShortcutList(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
