import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../../shared/views/widgets/error.modal.dart';
import '../../../../../themes/app_colors.dart';
import 'add_category.store.dart';
import 'image_viewer.widget.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final store = AddCategoryStore(GetIt.I());

  void addCategory() async {
    if (!formKey.currentState!.validate()) return;

    await store.addCategory(nameController.text);

    if (!mounted) return;

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                    if (store.failure != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ErrorModal.show(
                          context: context,
                          message: store.failure!,
                          onTap: () => store.clearFailure(),
                        );
                      });
                    }

                    return const SizedBox.shrink();
                  }),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Nova Categoria',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: appColors.secondaryColor,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                      color: appColors.secondaryColor,
                    )
                  ],
                ),
                const Divider(
                  thickness: 1,
                  height: 0,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: nameController,
                  cursorColor: appColors.primaryColor,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Nome da categoria'),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Obrigatório';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Escolha uma imagem para deixar mais visivel a categoria',
                  style: TextStyle(
                    color: appColors.secondaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ImageViewer(store: store),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                        appColors.primaryColor!.withOpacity(.1),
                      ),
                    ),
                    onPressed: addCategory,
                    child: Observer(
                      builder: (context) {
                        return store.isLoading
                            ? CircularProgressIndicator(
                                color: appColors.primaryColor,
                              )
                            : Text(
                                'Adicionar',
                                style: TextStyle(
                                  color: appColors.primaryColor,
                                ),
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
