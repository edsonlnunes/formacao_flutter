import 'package:flutter/material.dart';
import 'package:todo_list/models/task.model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> with SingleTickerProviderStateMixin {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late AnimationController controller;
  late Animation<double> animation;

  var containerHeight = 0.0;
  var isContainerOpened = false;
  var isImportant = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  addTask() {
    if (!formKey.currentState!.validate()) return;

    final task = Task(
      title: titleController.text,
      description: descriptionController.text.isEmpty
          ? null
          : descriptionController.text,
      important: isImportant,
    );

    Navigator.of(context).pop(task);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adicionar tarefa",
                  style: theme.textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider(
              thickness: 2,
              height: 0,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "O que você quer fazer hoje?",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo obrigatório";
                }
                return null;
              },
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: containerHeight,
              child: Visibility(
                visible: containerHeight != 0,
                child: TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Adicionar informações",
                  ),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isContainerOpened = !isContainerOpened;
                      if (isContainerOpened) {
                        controller.forward();
                        containerHeight = 50;
                      } else {
                        controller.reverse();
                        containerHeight = 0;
                      }
                    });
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: animation,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isImportant = !isImportant;
                    });
                  },
                  child: Icon(
                    isImportant ? Icons.star : Icons.star_border,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: addTask,
                  child: const Text("Adicionar"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
