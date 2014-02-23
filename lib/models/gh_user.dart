part of models;

class User{
  String login;
  String avatarUrl;
  String url;
  String htmlUrl;
  
  String name;
  String email;
  String location;
  String bio;
  
  User.fromJson(Map json){
    login     = json['login'];
    avatarUrl = json['avatar_url'];
    url       = json['url'];
    htmlUrl   = json['html_url'];
  }
  
  Map toJson(){
    return {
      'login'       : login,
      'avatar_url'  : avatarUrl,
      'url'         : url,
      'html_url'    : htmlUrl
    };
  }
}