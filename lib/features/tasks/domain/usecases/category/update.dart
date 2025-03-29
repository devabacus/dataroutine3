import 'package:dataroutine3/features/tasks/domain/entities/category_entity.dart';
import 'package:dataroutine3/features/tasks/domain/repositories/category_repository.dart';

class UpdateCategoryUseCase {
  final CategoryRepository _repository;

  UpdateCategoryUseCase(this._repository);

  Future<void> call(CategoryEntity category) async {
    return _repository.updateCategory(category);
  }
}
