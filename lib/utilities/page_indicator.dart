import 'package:flutter/material.dart';

Row buildPageIndicator(int pageCount, int currentPage) {
  List<Widget> list = [];
  for (int i = 0; i < pageCount; i++) {
    list.add(i == currentPage ? _indicator(true) : _indicator(false));
  }
  return Row(
    children: list,
  );
}

Widget _indicator(bool isActive) {
  return SizedBox(
    height: 10,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0, // isActive ? 10 : 8.0,
      width: 8.0, //isActive ? 12 : 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
      ),
    ),
  );
}
