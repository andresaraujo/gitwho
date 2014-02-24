
import 'dart:async';
import 'package:angular/angular.dart';
import 'package:logging/logging.dart';
//import 'package:perf_api/perf_api.dart';

import "package:gitwho/models/models.dart";
import "package:gitwho/services/github_service.dart";
import "package:gitwho/controllers/app_ctrl.dart";

@MirrorsUsed(
    targets: const [
    GithubService,
    Repo,
    User,
    ],
    override: '*'
)
import 'dart:mirrors';

class MyAppModule extends AngularModule {
  MyAppModule(){
    type(GithubService);
    type(AppCtrl);
    type(SearchCtrl);
  }
}

main(){  
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) => print(r.message));
  ngBootstrap(module: new MyAppModule());
}
