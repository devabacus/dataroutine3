import '../repositories/category_repository.dart';
import '../entities/category_entity.dart';

class GetCategoriesUseCase {
  final CategoryRepository _repository;
  
  GetCategoriesUseCase(this._repository);
  
  Future<List<CategoryEntity>> call() {
    return _repository.getCategories();
  }
}


