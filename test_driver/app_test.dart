import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Tic Tac Toe App Test', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Play the game', () async {
      await driver!.tap(find.byValueKey('cell_0_0'));
      await driver!.tap(find.byValueKey('cell_1_1'));
      await driver!.tap(find.byValueKey('cell_0_1'));
      await driver!.tap(find.byValueKey('cell_2_2'));
      expect(await driver!.getText(find.text('Winner: X')), 'Winner: X');
    });

    test('Restart the game', () async {
      await driver!.tap(find.byValueKey('restart_button'));
      expect(await driver!.getText(find.text('Tic Tac Toe')), 'Tic Tac Toe');
    });
  });
}
