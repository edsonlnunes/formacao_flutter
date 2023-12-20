import 'package:mobx/mobx.dart';

part 'my_drawer.store.g.dart';

class MyDrawerStore = MyDrawerStoreBase with _$MyDrawerStore;

abstract class MyDrawerStoreBase with Store {
  @observable
  int _selectedMenu = 0;

  int get selectedMenu {
    return _selectedMenu;
  }

  @action
  void selectMenu(int index) => _selectedMenu = index;
}
