import 'package:vx_example/stores/stores.dart';
import 'package:vxstate/vxstate.dart';

/// Update user's name.
class UpdateName extends VxMutation<BaseStore> {
  /// Create update name mutation.
  UpdateName(this.name);

  /// The name to update.
  final String name;

  @override
  void perform() {
    if (store?.user == null || store == null) return;
    store!.user = store!.user.copyWith(name: name);
  }
}
