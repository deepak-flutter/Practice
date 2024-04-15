import 'package:flutter/material.dart';

class MainButtonComponent extends StatelessWidget {
  const MainButtonComponent({
    super.key, required this.onClick, required this.text,

  });

  final Function onClick;
  final String text;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=>onClick(),
      visualDensity: VisualDensity.compact,
      minWidth: 0,
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}