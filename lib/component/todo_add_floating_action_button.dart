import 'package:flutter/material.dart';

class TodoAddFloatingActionButton extends StatelessWidget {
  final Function() onAdd;
  const TodoAddFloatingActionButton({
    super.key,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 66,
      height: 66,
      child: FittedBox(
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: onAdd,
          elevation: 0,
          backgroundColor: const Color.fromRGBO(255, 52, 52, 1),
          child: Image.asset(
            'assets/images/icon_add_2x.png',
            scale: 2,
          ),
        ),
      ),
    );
  }
}
