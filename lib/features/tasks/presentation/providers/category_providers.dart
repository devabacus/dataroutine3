import 'package:dataroutine3/features/tasks/data/datasources/local/sources/category_local_data_source.dart';
import 'package:dataroutine3/features/tasks/domain/repositories/category_repository.dart';
import 'package:dataroutine3/features/tasks/domain/usecases/category/create.dart';
import 'package:dataroutine3/features/tasks/domain/usecases/category/delete.dart';
import 'package:dataroutine3/features/tasks/domain/usecases/category/update.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/category.dart';
import '../../domain/usecases/category/get_all.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../../../core/database/local/provider/database_provider.dart';

part 'category_providers.g.dart';

// Провайдер источника данных
@riverpod
CategoryLocalDataSource categoryLocalDataSource(Ref ref) {
  final db = ref.read(appDatabaseProvider);
  return CategoryLocalDataSource(db);
}

// Провайдер репозитория
@riverpod
CategoryRepository categoryRepository(Ref ref) {
  final localDataSource = ref.read(categoryLocalDataSourceProvider);
  return CategoryRepositoryImpl(localDataSource);
}

// Провайдеры Use Case-ов
@riverpod
GetCategoriesUseCase getCategoriesUseCase(Ref ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return GetCategoriesUseCase(repository);
}

@riverpod
CreateCategoryUseCase createCategoryUseCase(Ref ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return CreateCategoryUseCase(repository);
}

@riverpod
DeleteCategoryUseCase deleteCategoryUseCase(Ref ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return DeleteCategoryUseCase(repository);
}

@riverpod
UpdateCategoryUseCase updateCategoryUseCase(Ref ref) {
  final repository = ref.read(categoryRepositoryProvider);
  return UpdateCategoryUseCase(repository);
}

// Провайдер состояния категорий
@riverpod
class Categories extends _$Categories {
  @override
  Future<List<CategoryEntity>> build() {
    return ref.read(getCategoriesUseCaseProvider)();
  }

  Future<void> addCategory(CategoryEntity category) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(createCategoryUseCaseProvider);
    try {
      await useCase(category);
      state = AsyncValue.data(await ref.read(getCategoriesUseCaseProvider)());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateCategory(CategoryEntity category) async {
    final usecase = ref.read(updateCategoryUseCaseProvider);
    try {
      await usecase(category);
      state = AsyncValue.data(await ref.read(getCategoriesUseCaseProvider)());
    } catch (_) {}
  }

  Future<void> deleteCategory(int id) async {
    final userCase = ref.read(deleteCategoryUseCaseProvider);
    try {
      await userCase(id);
      state = AsyncValue.data(await ref.read(getCategoriesUseCaseProvider)());
    } catch (_) {}
  }
}
