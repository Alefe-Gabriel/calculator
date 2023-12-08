import 'package:flutter/material.dart';

sealed class ButtonClickEvent {
  final String value;

  ButtonClickEvent(this.value);
}

class CommonButtonClickEvent extends ButtonClickEvent {
  CommonButtonClickEvent(super.value);
}

class EqualsButtonClickEvent extends ButtonClickEvent {
  EqualsButtonClickEvent(super.value);
}

class ClearButtonClickEvent extends ButtonClickEvent {
  ClearButtonClickEvent(super.value);
}

class ClearEntryButtonClickEvent extends ButtonClickEvent {
  ClearEntryButtonClickEvent(super.value);
}

class ButtonHub extends StatelessWidget {
  final void Function(ButtonClickEvent onClick) onButtonClick;
  const ButtonHub({super.key, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      padding: const EdgeInsets.all(16),
      children: [
        Button(
          value: '%',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: 'CE',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(ClearEntryButtonClickEvent(value)),
        ),
        Button(
          value: 'C',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(ClearButtonClickEvent(value)),
        ),
        Button(
          value: '',
          buttonColor: Theme.of(context).colorScheme.tertiary,
        ),
        Button(
          value: '7',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '8',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '9',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '/',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '4',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '5',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '6',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '*',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '1',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '2',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '3',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '+',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '0',
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '.',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
        Button(
          value: '=',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(EqualsButtonClickEvent(value)),
        ),
        Button(
          value: '-',
          buttonColor: Theme.of(context).colorScheme.tertiary,
          function: (value) => onButtonClick(CommonButtonClickEvent(value)),
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final String value;
  final Color? buttonColor;
  final void Function(String value)? function;

  const Button({
    super.key,
    required this.value,
    this.buttonColor,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor =
        this.buttonColor ?? Theme.of(context).colorScheme.primary;

    final textColor = buttonColor == Theme.of(context).colorScheme.primary
        ? Theme.of(context).colorScheme.surface
        : Theme.of(context).colorScheme.onPrimary;

    return Material(
      color: buttonColor,
      child: InkWell(
        onTap: function == null ? null : () => function!(value),
        child: _content(textColor),
      ),
    );
  }

  Container _content(Color textColor) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: TextStyle(color: textColor, fontSize: 32),
      ),
    );
  }
}
