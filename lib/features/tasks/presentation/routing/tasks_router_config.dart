import '../../presentation/pages/edit_category_page.dart';
import '../../presentation/pages/add_category_page.dart';
import '../../presentation/pages/categories_page.dart';

import '../../presentation/pages/tasks_page.dart';
import 'tasks_routes_constants.dart';

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


List<RouteBase> getTasksRoutes() {
  return [

    GoRoute(
      name: TasksRoutes.editCategory,
      path: TasksRoutes.editCategoryPath,
      builder: (BuildContext context, state) {
        
      
      return EditCategoryPage();
    
      }
  ),
  

    GoRoute(
      name: TasksRoutes.addCategory,
      path: TasksRoutes.addCategoryPath,
      builder: (BuildContext context, state) {
        
      
      return AddCategoryPage();
    
      }
  ),
  

    GoRoute(
      name: TasksRoutes.categories,
      path: TasksRoutes.categoriesPath,
      builder: (BuildContext context, state) {
        
      
      return CategoriesPage();
    
      }
  ),
  
    GoRoute(
      name: TasksRoutes.tasks,
      path: TasksRoutes.tasksPath,
      builder: (BuildContext context, state) => TasksPage(),
    ),
  ];
}
