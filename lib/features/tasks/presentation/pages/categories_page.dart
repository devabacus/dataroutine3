// в features/tasks/presentation/pages/categories_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mlogger/mlogger.dart';
import '../providers/category_providers.dart';
import '../../domain/entities/category_entity.dart';

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
              // Добавьте обработчики для редактирования и удаления
            );
          },
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Ошибка: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          log.debug("Добавление новой категрии");
          
          // Добавление новой категории
          // Можно показать диалог и использовать ref.read(categoriesProvider.notifier).addCategory()
        },
        child: Icon(Icons.add),
      ),
    );
  }
}