class Borrow {
  String username;
  String propertyNum;
  String description;
  String date;
  String dateReturn;

  Borrow(
      {required this.username,
      required this.propertyNum,
      required this.description,
      required this.date,
      required this.dateReturn});

  factory Borrow.fromJson(Map<String, dynamic> json) {
    return Borrow(
      username: json['username'],
      propertyNum: json['property_no'],
      description: json['description'],
      date: json['date'],
      dateReturn: json['date_return'],
    );
  }
}

class Sample {
  String idnumber;

  Sample({required this.idnumber});

  factory Sample.fromJson(Map<String, dynamic> json) {
    return Sample(
      idnumber: json['number'],
    );
  }
}
