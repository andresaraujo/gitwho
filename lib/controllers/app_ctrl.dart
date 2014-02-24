library app_ctrl;

import 'package:angular/angular.dart';
import 'package:gitwho/services/github_service.dart';
import 'package:gitwho/models/models.dart';

@NgController(selector: '[app-ctrl]', publishAs: 'ctrl')
class AppCtrl{
  
  GithubService gs;
  String        githubUser = "andresaraujo";
  List<Repo>    repos = [];
  AppCtrl(this.gs);
  
  loadRepos(){
    gs.getReposByUser(githubUser).then((List<Repo> repos) => this.repos = repos);
  }
}

@NgController(selector: '[search-ctrl]', publishAs: 'ctrl')
class SearchCtrl{
  
  GithubService gs;
  String        location = "guanajuato";
  List<User>    users = [];
  
  SearchCtrl(this.gs);
  
  loadUsers(){
    gs.getUsersByLocation(location)
      .then((List<User> users) {
        this.users = users;
        for(var u in users){
          gs.addUserData(u);   
        }
        });
  }
}

