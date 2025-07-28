class UserModel {
  final String id;
  final String name;
  final String membershipLevel;
  final String? profileImageUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.membershipLevel,
    this.profileImageUrl,
  });

  // Static user data for demo
  static const UserModel demoUser = UserModel(
    id: 'user-id-12345-abcde',
    name: 'Alex Ray',
    membershipLevel: 'Platinum Member',
    profileImageUrl: null,
  );
}
