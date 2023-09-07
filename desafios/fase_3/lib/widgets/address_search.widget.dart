import 'package:flutter/material.dart';

class AddressSearch extends StatelessWidget {
  const AddressSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.pin_drop_outlined,
          size: 18,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Informe o seu cep",
          style: TextStyle(
            fontSize: 13,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
      ],
    );
  }
}
