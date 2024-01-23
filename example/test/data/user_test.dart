import 'package:flutter_test/flutter_test.dart';
import 'package:vx_example/data/user.dart';

const testId = 'test-id';
const testName = 'Test User';

void main() {
  /// Can instantiate.
  test('Can instantiate', () {
    final user = User(id: testId, name: testName);
    expect(user.id, testId);
    expect(user.name, testName);
  });

  /// fromJson() returns a User instance.
  test('fromJson() returns a User instance', () {
    final user = User.fromJson({'id': testId, 'name': testName});
    expect(user.id, testId);
    expect(user.name, testName);
  });

  /// toJson() returns a JSON map.
  test('toJson() returns a JSON map', () {
    final user = User(id: testId, name: testName);
    final json = user.toJson();
    expect(json['id'], testId);
    expect(json['name'], testName);
  });

  /// Copy with returns a new User instance with the given fields replaced.
  test('copyWith returns a new User instance with the given fields replaced',
      () {
    final user = User(id: testId, name: testName);
    final user2 = user.copyWith(name: 'New Name');
    expect(user2.id, testId);
    expect(user2.name, 'New Name');

    expect(user.copyWith().name, user.name);
  });
}
