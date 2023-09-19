import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.grey[900],
      selectedItemColor: const Color(0xFF8bb3f8),
      unselectedItemColor: Colors.grey,
      onTap: (value) {},
      items: const [
        BottomNavigationBarItem(
          label: "Explorar",
          icon: Icon(Icons.location_on),
        ),
        BottomNavigationBarItem(
          label: 'Ir',
          icon: Icon(Icons.commute),
        ),
        BottomNavigationBarItem(
          label: 'Salvo',
          icon: Icon(Icons.bookmark_border),
        ),
        BottomNavigationBarItem(
          label: 'Contribuir',
          icon: Icon(Icons.add_circle_outline),
        ),
        BottomNavigationBarItem(
          label: 'Novidades',
          icon: Icon(Icons.notifications_none),
        ),
      ],
    );
  }
}
