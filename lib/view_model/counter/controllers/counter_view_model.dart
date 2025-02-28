import 'package:get/state_manager.dart';
import 'package:silent_moon/data/app_exception.dart';
import 'package:silent_moon/data/response/status.dart';
import 'package:silent_moon/model/counter/message_model.dart';
import 'package:silent_moon/model/counter/user_model.dart';
import 'package:silent_moon/repository/counter/counter_repository.dart';

class CounterViewModel extends GetxController {
  final CounterRepository _counterRepository;
  CounterViewModel(this._counterRepository);
  RxInt _counter = 0.obs;
  RxInt get count => _counter;
  late UserModel _currentUser;
  UserModel get currentUser => _currentUser;
  late List<UserModel> _users;
  List<UserModel> get users => _users;
  final RxList<MessageModel> _messages = <MessageModel>[].obs;
 RxList<MessageModel> get messages => _messages;
  late Rx<Status> _usersStatus;
  Rx<Status> get usersStatus => _usersStatus;
  late Rx<Status> _userStatus;
  Rx<Status> get userStatus => _userStatus;
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
    _userStatus = Status.loading.obs;

    try {
      final user = await _counterRepository.getUserById(userId);
      _currentUser = user;
      _userStatus.value = Status.loaded;
    } on AppException catch (e, _) {
      _userStatus.value = Status.error;
    }
  }

  Future<void> getUsers() async {
    _usersStatus = Status.loading.obs;
    try {
      final users = await _counterRepository.getUsers();
      _users = users ?? [];
      _usersStatus.value = Status.loaded;
    } on AppException catch (e, _) {
      _users = [];
      _usersStatus.value = Status.error;
    }
  }
}
