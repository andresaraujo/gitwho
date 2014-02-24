import 'dart:async';

import 'package:angular/angular.dart';
import "package:gitwho/models/models.dart";

class GithubService{
  Http _http;
  GithubService(this._http);
  
  Future<List<Repo>> getReposByUser(String githubUser){
    return _http.get("https://api.github.com/users/${githubUser}/repos?per_page=100")
        .then((HttpResponse response) {
          print(response.data[0]);
          List result = response.data;
          List<Repo> repos = [];
          for(var r in result){
            repos.add(new Repo.fromJson(r));
          }
          return repos; 
        });
  }
  
  Future<List<User>> getUsersByLocation(String location){
    return _http.get("https://api.github.com/search/users?q=location:${location}+type:Users")
        .then((HttpResponse response) {
          print(response.data);
          List result = response.data['items'];
          List<User> users = [];
          for(var r in result){
            users.add(new User.fromJson(r));
          }
          return users; 
        });
  }
  
  Future<User> addUserData(User u){
    return _http.get("https://api.github.com/users/${u.login}")
        .then((HttpResponse response) {
          print(response.data);
          u.name = response.data['name'];
          u.bio = response.data['bio'];
          u.location = response.data['location'];
          u.email = response.data['email'];
          return u; 
        });
  }
}