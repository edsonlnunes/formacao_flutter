import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_test/services/firebase_notification.service.dart';
import 'package:login_test/services/local_notification.service.dart';
import 'package:login_test/widgets/my_drawer/my_drawer.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    FirebaseNotificationService(
      localNotificationService: LocalNotificationService(),
    ).initilize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
              radius: 60,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(FirebaseAuth.instance.currentUser!.displayName!),
            Text(FirebaseAuth.instance.currentUser!.email!),
            Text(FirebaseAuth.instance.currentUser!.phoneNumber ?? ""),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
