class AuthModel {
  bool? success;
  String? message;
  String? auth;

  AuthModel({this.success, this.message, this.auth});

  AuthModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['Message'];
    auth = json['auth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['Message'] = this.message;
    data['auth'] = this.auth;
    return data;
  }
}
