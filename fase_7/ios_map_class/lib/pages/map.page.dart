import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../widgets/custom_draggable_sheet.widget.dart';
import '../widgets/error_settings_map.widget.dart';

// AIzaSyA6-p_3vhnknry6ePI2wWBlKEM7iqr-QUw

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with WidgetsBindingObserver {
  GoogleMapController? _controllerMap;
  CameraPosition? initialPosition;
  late String mapStyle;

  final pins = ValueNotifier(<Marker>[]);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    rootBundle
        .loadString('assets/map/style.json')
        .then((style) => mapStyle = style);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
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
        future: _determinePosition(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            final error = snapshot.error as String;
            if (error == 'SERVICE_NOT_ENABLE') {
              return ErrorSettingsMap(
                textButton: "Habilitar localização",
                textError:
                    "O serviço de localização está desabilitado. Você precisa habilitar para utilizar este aplicativo",
                onPressed: () async {
                  await Geolocator.openLocationSettings();
                },
              );
            }

            if (error == 'PERMISSION_LOCATION_DENIED') {
              return ErrorSettingsMap(
                textButton: "Conceder permissão de localização",
                textError:
                    "O aplicativo precisa da permissão de localização para funcionar.",
                onPressed: () async {
                  final permission = await Geolocator.requestPermission();
                  if (permission == LocationPermission.deniedForever) {
                    await Geolocator.openAppSettings();
                  }
                },
              );
            }
          }

          return Stack(
            children: [
              ValueListenableBuilder(
                  valueListenable: pins,
                  builder: (_, value, __) {
                    return GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: snapshot.data!,
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        _controllerMap = controller;
                        _controllerMap!.setMapStyle(mapStyle);
                      },
                      markers: value.toSet(),
                      onLongPress: (latLng) {
                        final newPin = Marker(
                          markerId: MarkerId(
                            DateTime.now().millisecondsSinceEpoch.toString(),
                          ),
                          position: latLng,
                        );
                        // pins.value = List.from(value)..add(newPin);
                        final updatedPins = List<Marker>.from(value);
                        updatedPins.add(newPin);
                        pins.value = updatedPins;
                      },
                    );
                  }),
              Positioned(
                right: 20,
                top: kToolbarHeight,
                child: Container(
                  width: 40,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          CupertinoIcons.map_fill,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          final cameraUpdate =
                              CameraUpdate.newCameraPosition(initialPosition!);

                          // final cameraUpdate = CameraUpdate.newLatLng(
                          //   LatLng(
                          //     initialPosition!.target.latitude,
                          //     initialPosition!.target.longitude,
                          //   ),
                          // );

                          // _controllerMap!.moveCamera(cameraUpdate);
                          _controllerMap!.animateCamera(cameraUpdate);
                        },
                        child: const Icon(
                          CupertinoIcons.location,
                          color: Colors.grey,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CustomDraggableSheet(),
            ],
          );
        },
      ),
    );
  }

  Future<CameraPosition> _determinePosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('SERVICE_NOT_ENABLE');
    }

    final permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('PERMISSION_LOCATION_DENIED');
    }

    final currentPosition = await Geolocator.getCurrentPosition();

    final cameraPosition = CameraPosition(
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      zoom: 14,
    );

    initialPosition = cameraPosition;

    return cameraPosition;
  }
}
