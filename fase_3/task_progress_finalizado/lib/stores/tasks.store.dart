import 'package:mobx/mobx.dart';

import '../models/task.model.dart';

part 'tasks.store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  TasksStoreBase() {
    print("A Store foi criada");
  }

  @observable
  ObservableList<Task> tasks = ObservableList.of(
    [
      Task(id: 1, title: "Instalar o flutter", completed: true),
      Task(id: 2, title: "Instalar o Android Studio", completed: true),
      Task(id: 3, title: "Adicionar as extensões no Android Studio"),
      Task(id: 4, title: "Instalar o VS Code"),
      Task(id: 5, title: "Adicionar as extensões no VS Code"),
      Task(id: 6, title: "Aceitar as licencas do Android"),
      Task(id: 7, title: "Rodar flutter doctor"),
      Task(id: 8, title: "Criar projeto flutter"),
      Task(id: 9, title: "Abrir emulador android/ios"),
      Task(id: 10, title: "Rodar projeto"),
    ],
  );

  @observable
  int numberChipSelected = 1;

  @computed
  double get progress {
    return tasks.where((task) => task.completed).length / tasks.length;
    // quantidade de tarefas concluidas / quantidade total de tarefas
    // 5 / 10 = 50%
  }

  @computed
  List<Task> get filteredTasks {
    if (numberChipSelected == 1) {
      return tasks.toList();
    }

    if (numberChipSelected == 2) {
      return tasks.where((task) => task.completed).toList();
    }

    if (numberChipSelected == 3) {
      return tasks.where((task) => !task.completed).toList();
    }

    return [];
  }

  @action
  void toggleCompletedTask(int taskId) {
    final taskIndex = tasks.indexWhere((task) => task.id == taskId);
    final task = tasks[taskIndex];
    tasks[taskIndex] = task.copyWith(completed: !task.completed);
  }

  @action
  void setNumberChip(int numberChip) {
    numberChipSelected = numberChip;
  }
}
