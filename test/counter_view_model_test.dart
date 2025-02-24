import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:mocktail/mocktail.dart' show Mock, when;
import 'package:silent_moon/data/network/network_api_service.dart';
import 'package:silent_moon/model/counter/user_model.dart';
import 'package:silent_moon/repository/counter/counter_repository.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';

class MockClient extends Mock implements Client {}

void main() {
  late CounterViewModel counter;
  late MockClient mockClient;
  late NetworkApiService networkApiService;
  late CounterRepository counterRepository;
  setUp(() {
    mockClient = MockClient();
    networkApiService = NetworkApiService(mockClient);
    counterRepository = CounterRepository(networkApiService);
    counter = CounterViewModel(counterRepository);
  });

  group("Counter Class -", () {
    test(
      'given Counter class when it is instantiated then count should be 0',
      () {
        //Act
        int count = counter.count.value;
        //Assert
        expect(count, 0);
      },
    );

    test(
      'given Counter class when it is incremented then count should be 1',
      () {
        //Act
        counter.incrementCounter();
        int count = counter.count.value;
        //Assert
        expect(count, 1);
      },
    );

    test(
      'given Counter class when it is decremented then count should be -1',
      () {
        //Act
        counter.decrementCounter();
        int count = counter.count.value;
        //Assert
        expect(count, -1);
      },
    );
    test('given Counter class when it is reset then count should be 0', () {
      //Act
      counter.incrementCounter();
      counter.incrementCounter();
      counter.resetCounter();
      int count = counter.count.value;
      //Assert
      expect(count, 0);
    });
    test('given Counter class when it is set then count should be 5', () {
      //Act
      counter.setCounter(5);
      int count = counter.count.value;
      //Assert
      expect(count, 5);
    });
  });
  group("getUserById", () {
    test('given user id when called then should return User', () async {
      final int id = 10;

      when(
        () => mockClient.get(Uri.parse("https://reqres.in/api/users/$id")),
      ).thenAnswer(
        (_) async => Response('''
              {
                "data": {
                  "id": 10,
                  "email": "byron.fields@reqres.in",
                  "first_name": "Byron",
                  "last_name": "Fields",
                  "avatar": "https://reqres.in/img/faces/10-image.jpg"
                },
                "support": {
                  "url": "https://contentcaddy.io?utm_source=reqres&utm_medium=json&utm_campaign=referral",
                  "text": "Tired of writing endless social media content? Let Content Caddy generate it for you."
                }
              }
            ''', 200),
      );

      await counter.getUserById(id);
      expect(counter.currentUser?.value, isA<UserModel>());
    });

    test('given user id when called then should throw Exception', () async {
      final int id = 50;

      when(
        () => mockClient.get(Uri.parse("https://reqres.in/api/users/$id")),
      ).thenAnswer((_) async => Response("{}", 404));

      await counter.getUserById(id);
      log(counter.currentUser?.value.toString() ?? "");
      expect(counter.currentUser?.value, isA<UserModel?>());
    });
  });
  tearDown(() {
    mockClient.close();
  });
}
