import 'dart:async';
import 'package:function_tree/function_tree.dart';
import 'package:calculator/views/button_hub.dart';

abstract class MainController {
  Stream<String> get displayValue;
  void buttonClickEvent(ButtonClickEvent event);
}

class MainControllerImpl implements MainController {
  String _displayValue = '';
  final _displayValueController = StreamController<String>.broadcast();

  @override
  Stream<String> get displayValue => _displayValueController.stream;

  @override
  void buttonClickEvent(ButtonClickEvent event) {
    _displayValue = _displayValue == 'Error'
        ? ''
        : _displayValue == '0'
            ? ''
            : _displayValue;

    if (event is CommonButtonClickEvent) {
      _displayValue += event.value;
    } else if (event is ClearEntryButtonClickEvent) {
      _displayValue = '';
    } else if (event is EqualsButtonClickEvent) {
      try {
        final newValue = _displayValue.interpret();
        _displayValue = newValue.toString();
      } catch (error) {
        _displayValue = 'Error';
      }
    }

    _displayValueController.add(_displayValue);
  }

  void dispose() {
    _displayValueController.close();
  }
}
