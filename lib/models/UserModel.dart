class UserModel {
  int id;
  String full_name;
  String first_name;
  String last_name;
  String email;
  int is_email_verify;
  String mobile;
  int is_verify_mobile;
  String auth_key;
  String profile_image;
  
  UserModel(
    this.id,
    this.full_name,
    this.first_name,
    this.last_name,
    this.email,
    this.is_email_verify,
    this.mobile,
    this.is_verify_mobile,
    this.auth_key,
    this.profile_image
  );

  UserModel.fromDB(Map<String, dynamic> parsedJson){
    this.id = parsedJson['id'];
    this.full_name = parsedJson['full_name'];
    this.first_name = parsedJson['first_name'];
    this.last_name = parsedJson['last_name'];
    this.email = parsedJson['email'];
    this.is_email_verify = parsedJson['is_email_verify'];
    this.mobile = parsedJson['mobile'];
    this.is_verify_mobile = parsedJson['is_verify_mobile'];
    this.auth_key = parsedJson['auth_key'];
    this.profile_image = parsedJson['profile_image'];
  }

  UserModel.fromJSON(Map<String, dynamic> parsedJson){
    this.id = int.parse(parsedJson['id']);
    this.full_name = parsedJson['full_name'];
    this.first_name = parsedJson['first_name'];
    this.last_name = parsedJson['last_name'];
    this.email = parsedJson['email'];
    this.is_email_verify = parsedJson['is_email_verify'];
    this.mobile = parsedJson['mobile'];
    this.is_verify_mobile = parsedJson['is_verify_mobile'];
    this.auth_key = parsedJson['auth_key'];
    this.profile_image = parsedJson['profile_image'];
  }

  Map<String, dynamic> toMapForDb(){
    return <String, dynamic>{
      "id": id,
      "full_name": full_name,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "is_email_verify": is_email_verify,
      "mobile": mobile,
      "is_verify_mobile": is_verify_mobile,
      "auth_key": auth_key,
      "profile_image": profile_image
    };
  }
}