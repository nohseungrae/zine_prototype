import 'dart:math';

import 'package:flutter/cupertino.dart';

double _doubleInRange(Random source, num start, num end) => source.nextDouble() * (end-start) + start;
final random = Random();
final coffees = List.generate(_names.length, (index) => Coffee(
    name: _names[index],
    image: 'assets/images/${index + 1}.png',
    price: _doubleInRange(random,3,7)),
);
class Coffee {
  Coffee({
    @required this.name,
    @required this.image,
    @required this.price,
  });
  final String name;
  final String image;
  final double price;
}

final _names = [
  '아이스 캬라멜 라떼',
  '아이스 카페 모카',
  '캬라멜라이징 피칸 라떼',
  '토피넛 라떼',
  '카푸치노',
  '아이스 토피넛 라떼',
  '아메리카노',
  '캬라멜 마끼아또',
  '아이스 비엔나 커피',
  '블랙티 라떼',
  '클래식 아이리쉬 커피',
  '토피넛 크런키 라떼'
];