import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' show Client, Response;
import 'package:mocktail/mocktail.dart' show Mock, when;
import 'package:silent_moon/user_data_response_model.dart';
import 'package:silent_moon/user_repository.dart';

class MockClient extends Mock implements Client {}

void main() {
  late MockClient mockClient;
  late UserRepository userRepository;

  setUp(() {
    mockClient = MockClient();
    userRepository = UserRepository(mockClient);
  });

  group("User Repository", () {
    group("getUserById", () {
      test('given user id when called then should return User', () async {
        final int id = 10;

        when(() => mockClient.get(Uri.parse("https://reqres.in/api/users/$id")))
            .thenAnswer((_) async => Response('''
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
            ''', 200));

        final user = await userRepository.getUserById(id);
        expect(user, isA<User>());
      });

      test('given user id when called then should throw Exception', () {
        final int id = 50;

        when(() => mockClient.get(Uri.parse("https://reqres.in/api/users/$id")))
            .thenAnswer((_) async => Response("{}", 404));

        final user = userRepository.getUserById(id);
        expect(user, throwsException);
      });
    });
  });

  tearDown(() {
    mockClient.close();
  });
}
