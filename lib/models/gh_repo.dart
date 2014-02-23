part of models;

class Repo{
  String  name;
  String  fullName;
  String  htmlUrl;
  String  description;
  String  language;
  int     stargazersCount;
  int     watchersCount;
  
  Repo.fromJson(Map json){
    name            = json['name'];
    fullName        = json['full_name'];
    htmlUrl         = json['html_url'];
    description     = json['description'];
    language        = json['language'];
    stargazersCount = json['stargazers_count'];
    watchersCount   = json['watchers_count'];
  }
  
  Map toJson(){
    return {
      'name'              : name,
      'full_name'         : fullName,
      'html_url'          : htmlUrl,
      'description'       : description,
      'language'          : language,
      'stargazers_count'  : stargazersCount,
      'watchers_count'    : watchersCount
    };
  }
}