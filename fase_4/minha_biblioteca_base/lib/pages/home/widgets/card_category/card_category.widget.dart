import 'package:flutter/material.dart';
import '../../../../colors.dart';
import '../../../../models/category.model.dart';

class CardCategory extends StatelessWidget {
  final Category category;
  const CardCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        elevation: 10,
        shadowColor: primaryColor,
        child: Container(
          child: InkWell(
            splashColor: secondaryColor.withOpacity(.6),
            onTap: () {},
            child: Center(
              child: Text(category.name),
            ),
          ),
        ),
      ),
    );
  }
}
