import 'package:flutter/material.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          hintText: "Buscar no Mercado Livre",
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
