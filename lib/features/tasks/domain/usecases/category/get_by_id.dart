import '../../repositories/category_repository.dart';
import '../../entities/category_entity.dart';

class GetCategoryUseCase {
  final CategoryRepository _repository;

  GetCategoryUseCase(this._repository);

  Future<List<CategoryEntity>> call() {
    return _repository.getCategories();
  }
}
