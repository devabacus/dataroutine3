import '../repositories/category_repository.dart';
import '../entities/category_entity.dart';

class CreateCategoryUseCase {
  final CategoryRepository _repository;
  
  CreateCategoryUseCase(this._repository);
  
  Future<int> call(CategoryEntity category) {
    return _repository.createCategory(category);
  }
}