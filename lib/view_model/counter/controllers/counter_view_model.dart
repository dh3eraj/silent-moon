import 'package:get/state_manager.dart';
import 'package:silent_moon/data/app_exception.dart';
import 'package:silent_moon/model/counter/user_data_response_model.dart';
import 'package:silent_moon/repository/counter/counter_repository.dart';

class CounterViewModel extends GetxController {
  final CounterRepository _counterRepository;
  CounterViewModel(this._counterRepository);
  RxInt _counter = 0.obs;
  RxInt get count => _counter;
  late Rx<User>? _currentUser;
  Rx<User>? get currentUser => _currentUser;

  void incrementCounter() {
    _counter++;
  }

  void decrementCounter() {
    _counter--;
  }

  void resetCounter() {
    _counter.value = 0;
  }

  void setCounter(int value) {
    _counter.value = value;
  }

  Future<void> getUserById(int userId) async {
    try {
      final user = await _counterRepository.getUserById(userId);
      _currentUser = user.obs;
    } on AppException catch (e, _) {
      _currentUser = null;
    }
  }
}
