import 'package:fase_5_interno/models/character_detail.model.dart';
import 'package:mobx/mobx.dart';

import '../../../services/api.service.dart';

part 'detail.store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  final _service = ApiService();

  @observable
  bool isLoading = false;

  @observable
  CharacterDetail? characterDetail;

  @action
  Future<void> getDetailsData(int id) async {
    isLoading = true;

    final character = await _service.getCharacterDetail(id);

    characterDetail = character;

    isLoading = false;
  }
}
