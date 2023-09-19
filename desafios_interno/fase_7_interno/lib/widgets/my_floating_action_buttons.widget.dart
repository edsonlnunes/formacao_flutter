import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyFloatingActionButtons extends StatelessWidget {
  const MyFloatingActionButtons({
    Key? key,
    required GoogleMapController? controller,
    required CameraPosition? cameraPosition,
  })  : _controller = controller,
        _cameraPosition = cameraPosition,
        super(key: key);

  final GoogleMapController? _controller;
  final CameraPosition? _cameraPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            _controller?.animateCamera(
              CameraUpdate.newCameraPosition(_cameraPosition!),
            );
          },
          backgroundColor: Colors.grey[900],
          child: const Icon(
            Icons.near_me_outlined,
          ),
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
        ),
      ],
    );
  }
}
