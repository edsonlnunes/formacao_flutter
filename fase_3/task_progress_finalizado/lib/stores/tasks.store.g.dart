// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on TasksStoreBase, Store {
  Computed<double>? _$progressComputed;

  @override
  double get progress =>
      (_$progressComputed ??= Computed<double>(() => super.progress,
              name: 'TasksStoreBase.progress'))
          .value;
  Computed<List<Task>>? _$filteredTasksComputed;

  @override
  List<Task> get filteredTasks => (_$filteredTasksComputed ??=
          Computed<List<Task>>(() => super.filteredTasks,
              name: 'TasksStoreBase.filteredTasks'))
      .value;

  late final _$tasksAtom = Atom(name: 'TasksStoreBase.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$numberChipSelectedAtom =
      Atom(name: 'TasksStoreBase.numberChipSelected', context: context);

  @override
  int get numberChipSelected {
    _$numberChipSelectedAtom.reportRead();
    return super.numberChipSelected;
  }

  @override
  set numberChipSelected(int value) {
    _$numberChipSelectedAtom.reportWrite(value, super.numberChipSelected, () {
      super.numberChipSelected = value;
    });
  }

  late final _$TasksStoreBaseActionController =
      ActionController(name: 'TasksStoreBase', context: context);

  @override
  void toggleCompletedTask(int taskId) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.toggleCompletedTask');
    try {
      return super.toggleCompletedTask(taskId);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumberChip(int numberChip) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.setNumberChip');
    try {
      return super.setNumberChip(numberChip);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
numberChipSelected: ${numberChipSelected},
progress: ${progress},
filteredTasks: ${filteredTasks}
    ''';
  }
}
