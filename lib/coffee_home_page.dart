import 'package:flutter/material.dart';
import 'package:zine_prototype/widgets/coffee_concept_home.dart';
import 'package:zine_prototype/widgets/coffee_concept_list.dart';

class CoffeeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.light(),
        child: CoffeeConceptHome()
    );
  }
}
