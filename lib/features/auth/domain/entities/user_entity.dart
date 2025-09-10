class UserEntity {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final bool isGuest;
  final String? accessToken;

  const UserEntity({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    this.isGuest = false,
    this.accessToken,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity &&
        other.id == id &&
        other.email == email &&
        other.displayName == displayName &&
        other.photoUrl == photoUrl &&
        other.isGuest == isGuest &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        displayName.hashCode ^
        photoUrl.hashCode ^
        isGuest.hashCode ^
        accessToken.hashCode;
  }

  @override
  String toString() {
    return 'UserEntity(id: $id, email: $email, displayName: $displayName, isGuest: $isGuest)';
  }
}
