import 'package:vx_example/stores/stores.dart';
import 'package:vxstate/vxstate.dart';

/// Set current index mutation
class SetCurrentIndex extends VxMutation<BaseStore> {
  /// Perform the mutation
  @override
  void perform() {
    /// Set the in-memory user.
    store?.currentIndex = store?.currentIndex == 0 ? 1 : 0;
  }
}
