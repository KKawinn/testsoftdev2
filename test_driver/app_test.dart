import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Thai up', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Flash card', () async {
      await driver!.tap(find.byValueKey('flashpage'));
      await driver!.tap(find.byValueKey('showvocap'));
      await driver!.tap(find.byValueKey('nextflash'));
      await driver!.tap(find.byValueKey('showvocap'));
      expect(await driver!.getText(find.text('ส้ม')), 'ส้ม');
    });

  // flutter drive --target=test_driver/app.dart

  });
}
