import 'package:flutter/material.dart';

import '../models/task.model.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> with SingleTickerProviderStateMixin {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  late AnimationController iconAnimationController;
  late Animation<double> iconAnimation;
  late Animation<Color?> colorAnimation;

  final formKey = GlobalKey<FormState>();

  var isImportant = false;
  var isContainerOpened = false;
  var containerHeight = 0.0;

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
  void initState() {
    super.initState();

    iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    iconAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(iconAnimationController);
    colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.green,
    ).animate(iconAnimationController);

    // iconAnimationController.repeat(reverse: true);
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
                AnimatedBuilder(
                  animation: iconAnimationController,
                  builder: (_, __) {
                    return Text(
                      "Adicionar tarefa",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: colorAnimation.value),
                    );
                  },
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
              duration: const Duration(milliseconds: 300),
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
                        iconAnimationController.forward();
                        containerHeight = 60;
                      } else {
                        iconAnimationController.reverse();
                        containerHeight = 0;
                      }
                    });
                  },
                  child: AnimatedIcon(
                    progress: iconAnimation,
                    icon: AnimatedIcons.menu_close,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isImportant = !isImportant;
                    });
                  },
                  child: Icon(isImportant ? Icons.star : Icons.star_border),
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
