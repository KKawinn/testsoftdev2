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
    test('Backtofirst', () async {
      await driver!.requestData('/first');
      await driver!.tap(find.byValueKey('backButton'));

      expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
          'เลือกเนื้อหาที่ต้องการเรียน');
    });

    test('Pic Quiz', () async {
      await driver!.tap(find.byValueKey('cha_second_page'));
      await driver!.tap(find.byValueKey('pic_quiz'));
      await driver!.tap(find.byValueKey('choice_pic1'));
      await driver!.tap(find.byValueKey('submit_picquiz'));
      expect(await driver!.getText(find.text('ส้ม')), 'ส้ม');
    });

    // flutter drive --target=test_driver/app.dart
  });
}
