import 'package:dataroutine3/features/tasks/domain/entities/category.dart';
import 'package:dataroutine3/features/tasks/presentation/providers/category_state_providers.dart';
import 'package:dataroutine3/features/tasks/presentation/routing/tasks_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mlogger/mlogger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AddCategoryPage extends ConsumerStatefulWidget {
  const AddCategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCategoryPageState();
}

class _AddCategoryPageState extends ConsumerState<AddCategoryPage> {
  TextEditingController titleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final categoryNotifier = ref.read(categoriesProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Добавление новой категории")),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Название категории",
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      categoryNotifier.addCategory(
                        CategoryEntity(id: 0, title: titleController.text),
                      );
                      log.debug(titleController.text);
                    }
                  },
                  child: Text("Сохранить"),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () => context.goNamed(TasksRoutes.categories),
                  child: Text(
                    "Показать все задачи",
                    // style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () => context.goNamed(TasksRoutes.editCategory),
                  child: Text(
                    "Редактировать задачи",
                    // style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
