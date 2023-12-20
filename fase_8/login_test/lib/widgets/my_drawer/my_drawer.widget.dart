import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../pages/home.page.dart';
import '../../pages/login/login.page.dart';
import '../../pages/messages.page.dart';
import '../../pages/settings.page.dart';
import '../../stores/app.store.dart';
import 'my_drawer.store.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final store = GetIt.I.get<MyDrawerStore>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFFece2d3),
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: FirebaseAuth.instance.currentUser != null
                        ? NetworkImage(
                            FirebaseAuth.instance.currentUser!.photoURL!,
                          )
                        : null,
                    radius: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(FirebaseAuth.instance.currentUser?.displayName ?? ""),
                ],
              ),
            ),
          ),
          Observer(builder: (_) {
            return ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              selected: store.selectedMenu == 0,
              onTap: () {
                store.selectMenu(0);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
            );
          }),
          Observer(builder: (_) {
            return ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favoritos'),
              selected: store.selectedMenu == 1,
              onTap: () => store.selectMenu(1),
            );
          }),
          Observer(builder: (_) {
            return ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Mensagens'),
              selected: store.selectedMenu == 2,
              onTap: () {
                store.selectMenu(2);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const MessagesPage(),
                  ),
                );
              },
            );
          }),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Aplicativo',
            ),
          ),
          Observer(builder: (_) {
            return ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              selected: store.selectedMenu == 3,
              onTap: () {
                store.selectMenu(3);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SettinsPage(),
                  ),
                );
              },
            );
          }),
          Observer(builder: (_) {
            return ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              selected: store.selectedMenu == 4,
              onTap: () => store.selectMenu(4),
            );
          }),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Sair'),
            onTap: () async {
              await AppStore().logout();
              if (!mounted) return;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
          const Spacer(),
          const SafeArea(
            child: Align(
              child: Text("versão 1.0.0"),
            ),
          )
        ],
      ),
    );
  }
}
