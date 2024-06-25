class UserProfileEntity {
  final String id;
  final String email;
  final String phone;
  final String firstName;
  final String lastName;

  UserProfileEntity({
    required this.id,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
  });

  factory UserProfileEntity.fromMap(Map<String, dynamic> map) {
    return UserProfileEntity(
      id: map['user_id'] ?? '0',
      email: map['email'] ?? 'unknown',
      phone: map['phone'] ?? 'unknown',
      firstName: map['first_name'] ?? 'unknown',
      lastName: map['last_name'] ?? 'unknown',
    );
  }
}
