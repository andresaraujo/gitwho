library app_router;

import 'package:angular/angular.dart';

class AppRouteInit implements RouteInitializer {

  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
          name: 'default',
          path: '/test',
          defaultRoute: true,
          enter: view('view/addRecipe.html'))
      ;
  }
}