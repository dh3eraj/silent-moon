import 'package:flutter_test/flutter_test.dart';
import 'package:silent_moon/counter.dart';

void main() {
  late Counter counter;
  setUp(() {
    counter = Counter();
  });
  group("Counter Class -", () {
    test(
      'given Counter class when it is instantiated then count should be 0',
      () {
        //Act
        int count = counter.count;
        //Assert
        expect(count, 0);
      },
    );

    test(
      'given Counter class when it is incremented then count should be 1',
      () {
        //Act
        counter.incrementCounter();
        int count = counter.count;
        //Assert
        expect(count, 1);
      },
    );

    test(
      'given Counter class when it is decremented then count should be -1',
      () {
        //Act
        counter.decrementCounter();
        int count = counter.count;
        //Assert
        expect(count, -1);
      },
    );
    test('given Counter class when it is reset then count should be 0', () {
      //Act
      counter.incrementCounter();
      counter.incrementCounter();
      counter.resetCounter();
      int count = counter.count;
      //Assert
      expect(count, 0);
    });
    test(
      'given Counter class when it is set then count should be 5',
      () {
        //Act
        counter.setCounter(5);
        int count = counter.count;
        //Assert
        expect(count, 5);
      },
    );
  });
}
