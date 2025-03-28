import 'package:dataroutine3/features/tasks/domain/entities/category_entity.dart';
import 'package:dataroutine3/features/tasks/presentation/providers/category_providers.dart';
import 'package:dataroutine3/features/tasks/presentation/routing/tasks_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mlogger/mlogger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class EditCategoryPage extends ConsumerStatefulWidget {
  const EditCategoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddCategoryPageState();
}

class _AddCategoryPageState extends ConsumerState<EditCategoryPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final categoryNotifier = ref.read(categoriesProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text("Удаление категории")),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: idController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Id категории",
                  ),
                ),
                SizedBox(height: 30),

                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Новое название",
                  ),
                ),
                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    if (idController.text.isNotEmpty) {
                      categoryNotifier.updateCategory(
                        CategoryEntity(
                          id: int.parse(idController.text),
                          title: titleController.text,
                        ),
                      );
                    }
                  },
                  child: Text("Обновить"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (idController.text.isNotEmpty) {
                      categoryNotifier.deleteCategory(
                        int.parse(idController.text),
                      );
                    }
                  },
                  child: Text("Удалить"),
                ),
                ElevatedButton(
                  onPressed: () => context.goNamed(TasksRoutes.categories),
                  child: Text(
                    "Показать все задачи",
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
