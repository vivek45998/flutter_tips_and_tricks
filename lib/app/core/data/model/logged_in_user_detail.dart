class LoggedInUserDetail {
  LoggedInUserDetail({
    this.id,
     this.studentName,
     this.studentAge,
     this.studentEmail,
     this.studentPassword,
     this.v,
  });

  String ?id;
  String ?studentName;
  String ?studentAge;
  String ?studentEmail;
  String ?studentPassword;
  int ?v;

  factory LoggedInUserDetail.fromJson(Map<String, dynamic> json) => LoggedInUserDetail(
    id: json["_id"],
    studentName: json["studentName"],
    studentAge: json["studentAge"],
    studentEmail: json["studentEmail"],
    studentPassword: json["studentPassword"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "studentName": studentName,
    "studentAge": studentAge,
    "studentEmail": studentEmail,
    "studentPassword": studentPassword,
    "__v": v,
  };
}