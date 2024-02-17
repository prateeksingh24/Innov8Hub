/// name : "Prateek"
/// email : "Prateek@gmail.com"
/// password : "123456789"
/// number : "7777777797"
/// password_confirmation : "123456789"

class SignUpModel {
  SignUpModel({
      String? name, 
      String? email, 
      String? password, 
      String? number, 
      String? passwordConfirmation,}){
    _name = name;
    _email = email;
    _password = password;
    _number = number;
    _passwordConfirmation = passwordConfirmation;
}

  SignUpModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _number = json['number'];
    _passwordConfirmation = json['password_confirmation'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _number;
  String? _passwordConfirmation;
SignUpModel copyWith({  String? name,
  String? email,
  String? password,
  String? number,
  String? passwordConfirmation,
}) => SignUpModel(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  number: number ?? _number,
  passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get number => _number;
  String? get passwordConfirmation => _passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['number'] = _number;
    map['password_confirmation'] = _passwordConfirmation;
    return map;
  }

}