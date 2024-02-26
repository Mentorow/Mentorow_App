
class Mentor {
  final String id;
  final String name;
  final String areaOfExpertise;
  final String domain;
  final String linkedinUrl;
  final String photo;
  final DateTime createdAt;

  Mentor({
    required this.id,
    required this.name,
    required this.areaOfExpertise,
    required this.domain,
    required this.linkedinUrl,
    required this.photo,
    required this.createdAt,
  });

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      id: json['_id'],
      name: json['name'],
      areaOfExpertise: json['areaOfExpertise'],
      domain: json['domain'],
      linkedinUrl: json['linkedinUrl'],
      photo: json['photo'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}