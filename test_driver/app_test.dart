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
      for (int i = 0; i < 5; i += 1) {
        await driver!.tap(find.byValueKey('showvocap'));
        await driver!.tap(find.byValueKey('nextflash'));
      }
      await driver!.tap(find.byValueKey('backButton'));
      expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
          'เลือกเนื้อหาที่ต้องการเรียน');
    });
    // test('Backtofirst', () async {
    //   await driver!.tap(find.byValueKey('backButton'));

    //   expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
    //       'เลือกเนื้อหาที่ต้องการเรียน');
    // });

    test('Pic Quiz', () async {
      await driver!.tap(find.byValueKey('cha_second_page'));
      await driver!.tap(find.byValueKey('pic_quiz'));
      for (int i = 0; i < 2; i += 1) {
        for (int i = 0; i < 8; i += 1) {
          await driver!.tap(find.byValueKey('choice_pic1'));
          await driver!.tap(find.byValueKey('choice_pic0'));
          await driver!.tap(find.byValueKey('submit_picquiz'));
        }
        await driver!.tap(find.byValueKey('restartquiz'));
      }
      await driver!.tap(find.byValueKey('backButton'));
      await driver!.tap(find.byValueKey('backButton'));

      expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
          'เลือกเนื้อหาที่ต้องการเรียน');
      // expect(await driver!.getText(find.text('You have completed the quiz!')),
      //     'You have completed the quiz!');
    });

    // test('Backtofirst', () async {
    //   await driver!.tap(find.byValueKey('backButton'));
    //   await driver!.tap(find.byValueKey('backButton'));

    //   expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
    //       'เลือกเนื้อหาที่ต้องการเรียน');
    // });

    test('Voice Quiz', () async {
      await driver!.tap(find.byValueKey('cha_second_page'));
      await driver!.tap(find.byValueKey('voice_quiz'));
      for (int i = 0; i < 2; i += 1) {
        for (int i = 0; i < 11; i += 1) {
          await driver!.tap(find.byValueKey('listen'));
          await driver!.tap(find.byValueKey('choice_voic1'));
          await driver!.tap(find.byValueKey('choice_voic0'));
          await driver!.tap(find.byValueKey('submit_voicquiz'));
        }
        await driver!.tap(find.byValueKey('restartquiz'));
      }
      // expect(await driver!.getText(find.text('You have completed the quiz!')),
      //     'You have completed the quiz!');
      await driver!.tap(find.byValueKey('backButton'));
      await driver!.tap(find.byValueKey('backButton'));
      expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
          'เลือกเนื้อหาที่ต้องการเรียน');
    });

    test('sentence ', () async {
      await driver!.tap(find.byValueKey('payok_second_page'));
      await driver!.tap(find.byValueKey('sortsen'));
      for (int i = 0; i < 2; i += 1) {
        for (int i = 0; i < 7; i += 1) {
          //จำนวนข้อเด้อ
          await driver!.tap(find.byValueKey('choice_sortsen0'));
          await driver!.tap(find.byValueKey('resort'));
          await driver!.tap(find.byValueKey('choice_sortsen1'));
          await driver!.tap(find.byValueKey('choice_sortsen0'));
          await driver!.tap(find.byValueKey('choice_sortsen2'));
          await driver!.tap(find.byValueKey('submitsort'));
        }
        await driver!.tap(find.byValueKey('restartquiz'));
      }
      // expect(await driver!.getText(find.text('You have completed the quiz!')),
      //     'You have completed the quiz!');
      await driver!.tap(find.byValueKey('backButton'));
      await driver!.tap(find.byValueKey('backButton'));
      expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
          'เลือกเนื้อหาที่ต้องการเรียน');
    });

    test('listen sentence ', () async {
      await driver!.tap(find.byValueKey('payok_second_page'));
      await driver!.tap(find.byValueKey('voicesen'));
      for (int i = 0; i < 2; i += 1) {
        for (int i = 0; i < 15; i += 1) {
          //จำนวนข้อเด้อ
          await driver!.tap(find.byValueKey('voice'));
          await driver!.tap(find.byValueKey('choice_sortsen0'));
          await driver!.tap(find.byValueKey('resort'));
          await driver!.tap(find.byValueKey('choice_sortsen1'));
          await driver!.tap(find.byValueKey('choice_sortsen0'));
          await driver!.tap(find.byValueKey('choice_sortsen2'));
          await driver!.tap(find.byValueKey('choice_sortsen3'));
          await driver!.tap(find.byValueKey('submit'));
        }
        await driver!.tap(find.byValueKey('restartquiz'));
      }
      // expect(await driver!.getText(find.text('You have completed the quiz!')),
      //     'You have completed the quiz!');
      await driver!.tap(find.byValueKey('backButton'));
      await driver!.tap(find.byValueKey('backButton'));
      expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
          'เลือกเนื้อหาที่ต้องการเรียน');
    });

    // test('Backtofirst', () async {
    //   await driver!.tap(find.byValueKey('backButton'));
    //   await driver!.tap(find.byValueKey('backButton'));

    //   expect(await driver!.getText(find.text('เลือกเนื้อหาที่ต้องการเรียน')),
    //       'เลือกเนื้อหาที่ต้องการเรียน');
    // });

    // flutter drive --target=test_driver/app.dart
  });
}
