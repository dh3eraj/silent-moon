import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:silent_moon/data/network/network_api_service.dart';
import 'package:silent_moon/repository/counter/counter_repository.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';


  final GetInstance getInstance = GetInstance();
   Future<void> setupServiceLocator() async {
    getInstance.lazyPut<Client>(() => Client(), );
    Get.lazyPut<NetworkApiService>(() => NetworkApiService(Get.find<Client>()));
    Get.lazyPut<CounterRepository>(
      () => CounterRepository(Get.find<NetworkApiService>()),
    );
    Get.lazyPut<CounterViewModel>(
      () => CounterViewModel(Get.find<CounterRepository>()),
    );
  }

