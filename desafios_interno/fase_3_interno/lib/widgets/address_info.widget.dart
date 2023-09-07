import 'package:flutter/material.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.pin_drop_outlined,
          color: Colors.black,
          size: 18,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Informe seu CEP",
          style: TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black,
          size: 20,
        ),
      ],
    );
  }
}
