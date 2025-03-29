import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/category.dart';

part 'selected_category_provider.g.dart';

@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  CategoryEntity? build() {
    return null; // Изначально ничего не выбрано
  }

  void select(CategoryEntity category) {
    state = category;
  }

  void clear() {
    state = null;
  }
}