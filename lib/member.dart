
class Member{
  String name;
  Member(this.name);
  
  Member.fromJson(Map json){
    name = json['name'];
  }
  
  Map toJson(){
    return {'name': name};
  }
}
