import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../widgets/chips_list.widget.dart';
import '../../widgets/error_settings_map.widget.dart';
import '../../widgets/search_input_button.widget.dart';

// AIzaSyA6-p_3vhnknry6ePI2wWBlKEM7iqr-QUw

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage>
    with WidgetsBindingObserver {
  GoogleMapController? _controllerMap;
  CameraPosition? initialPosition;
  late String mapStyle;
  final pins = ValueNotifier(<Marker>[]);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    rootBundle
        .loadString('assets/map-style/dark-theme.json')
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
    return FutureBuilder(
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
              textButton: "Habilitar serviço",
              textError: "Serviço de localização desabilitado",
              onPressed: () async {
                await Geolocator.openLocationSettings();
              },
            );
          }

          if (error == 'PERMISSION_LOCATION_DENIED') {
            return ErrorSettingsMap(
              textButton: "Conceder permissão",
              textError: "Permissão de localização negada.",
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
              },
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Column(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      _controllerMap?.animateCamera(
                        CameraUpdate.newCameraPosition(initialPosition!),
                      );
                    },
                    backgroundColor: Colors.grey[900],
                    child: const Icon(Icons.near_me_outlined),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: const Color(0xFF8bb3f8),
                    child: const Icon(
                      Icons.directions,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Column(
                children: const [
                  SearchInputButton(),
                  ChipsList(),
                ],
              ),
            )
          ],
        );
      },
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
