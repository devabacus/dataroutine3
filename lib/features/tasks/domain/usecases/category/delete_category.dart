
import 'package:dataroutine3/features/tasks/domain/repositories/category_repository.dart';

class DeleteCategoriesUseCase {
    final CategoryRepository _repository;

  DeleteCategoriesUseCase(this._repository);

  Future<void> call(int id) async {
    return _repository.deleteCategory(id);
    }    
}