class Client {
  final int id;
  final String name;
  final int age;
  final int spend;
  final int visits;

  Client({
    required this.id,
    required this.name,
    required this.age,
    required this.spend,
    required this.visits,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      spend: json['spend'],
      visits: json['visits']
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'age' : age,
  //     'spend' : spend,
  //     'visits' : visits,
  //   };
  // }
}
