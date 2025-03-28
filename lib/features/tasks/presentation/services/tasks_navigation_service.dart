
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/tasks_routes_constants.dart';


class TasksNavigationService {

    void navigateToEditCategory(BuildContext context) {
      context.goNamed(TasksRoutes.editCategory);
    }
  

    void navigateToAddCategory(BuildContext context) {
      context.goNamed(TasksRoutes.addCategory);
    }
  

    void navigateToCategories(BuildContext context) {
      context.goNamed(TasksRoutes.categories);
    }
  
  
  void navigateToTasks(BuildContext context){
      context.goNamed(TasksRoutes.tasks);
  }

}

