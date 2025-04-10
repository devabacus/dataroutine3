// в features/tasks/presentation/pages/categories_page.dart
import 'package:dataroutine3/core/routing/routes_constants.dart';
import 'package:dataroutine3/features/tasks/presentation/routing/tasks_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mlogger/mlogger.dart';
import '../providers/category_state_providers.dart';
import '../../domain/entities/category.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);
    
    return Scaffold(
      appBar: AppBar(title: Text('Категории')),
      body: categoriesAsync.when(
        data: (categories) => ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return ListTile(
              title: Text(category.title),
              trailing: Text(category.id.toString()),
              // Добавьте обработчики для редактирования и удаления
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Ошибка: $error')),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'uniqueTag1',
            onPressed: () => context.goNamed(TasksRoutes.addCategory),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 20,),
          FloatingActionButton(
            heroTag: 'uniqueTag2',
            onPressed: () => context.goNamed(TasksRoutes.editCategory),
            child: Icon(Icons.update),
          ),
        ],
      ),
    );
  }
}