import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    super.displayName,
    super.photoUrl,
    super.isGuest,
    super.accessToken,
  });

  factory UserModel.fromGoogleUser(
    GoogleSignInAccount user,
    String? accessToken,
  ) {
    return UserModel(
      id: user.id,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      isGuest: false,
      accessToken: accessToken,
    );
  }

  factory UserModel.guest() {
    return UserModel(
      id: 'guest_${DateTime.now().millisecondsSinceEpoch}',
      email: 'guest@signbridge.app',
      displayName: 'Guest User',
      isGuest: true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'isGuest': isGuest,
      'accessToken': accessToken,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      isGuest: json['isGuest'] as bool? ?? false,
      accessToken: json['accessToken'] as String?,
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    bool? isGuest,
    String? accessToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      isGuest: isGuest ?? this.isGuest,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
