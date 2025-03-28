
import 'package:dataroutine3/core/database/local/database.dart';
import 'package:dataroutine3/features/tasks/data/datasources/local/dao/category_dao.dart';
import 'package:dataroutine3/features/tasks/data/models/category_model.dart';
import 'package:drift/drift.dart';

class CategoryLocalDataSource {
  final CategoryDao _categoryDao;

  CategoryLocalDataSource(AppDatabase db) : _categoryDao = CategoryDao(db);

  Future<List<CategoryModel>> getCategories() async {
    final categories = await _categoryDao.getCategories();
    return categories
        .map(
          (category) => CategoryModel(id: category.id, title: category.title),
        )
        .toList();
  }

  Future<CategoryModel> getCategoryById(int id) async {
    final category = await _categoryDao.getCategoryById(id);
    return CategoryModel(id: category.id, title: category.title);
  }

  Future<int> createCategory(CategoryModel category) {
    return _categoryDao.createCategory(
      CategoryTableCompanion.insert(title: category.title),
    );
  }

  Future<void> updateCategory(CategoryModel category) {
    return _categoryDao.updateCategory(
      CategoryTableCompanion(id: Value(category.id) , title: Value(category.title)),
    );
  }

  Future<void> deleteCategory(int id) async {
      _categoryDao.deleteCategory(id);
    }

}
