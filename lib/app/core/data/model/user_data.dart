class UserList {
  UserList({
     this.message,
     this.data,
  });

  String? message;
  List<Datum> ?data;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.username,
    required this.email,
    required this.date,
    required this.id,
  });

  String username;
  String email;
  DateTime date;
  String id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    username: json["username"],
    email: json["email"],
    date: DateTime.parse(json["date"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "date": date.toIso8601String(),
    "id": id,
  };
}