import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// A class representing a User.
@JsonSerializable()
class User {
  /// Constructs a new User instance.
  User({required this.id, required this.name});

  /// Creates a new User instance from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// The unique identifier of the user.
  final String id;

  /// The name of the user.
  final String name;

  /// Creates a copy of this User instance with the given fields
  /// replaced with the new values.
  User copyWith({String? name}) => User(
        id: id,
        name: name ?? this.name,
      );

  /// Converts the User instance to a JSON map.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
