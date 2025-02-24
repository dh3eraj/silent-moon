import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:silent_moon/data/network/base_api_service.dart';
import 'package:silent_moon/data/network/network_api_service.dart';
import 'package:silent_moon/repository/counter/counter_repository.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';

class DependencyInjection {
 static Future<void> setupServiceLocator()async
  {
    Get.lazyPut<Client>(() => Client());
    Get.lazyPut<BaseApiService>(() => BaseApiService(Get.find<Client>()));
    Get.lazyPut<NetworkApiService>(() => NetworkApiService(Get.find<BaseApiService>()));
    Get.lazyPut<CounterRepository>(() => CounterRepository(Get.find<NetworkApiService>()));
    Get.lazyPut<CounterViewModel>(() => CounterViewModel(Get.find<CounterRepository>()));
  }
}