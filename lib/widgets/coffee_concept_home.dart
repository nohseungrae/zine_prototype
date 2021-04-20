import 'package:flutter/material.dart';
import 'package:zine_prototype/models/coffee.dart';
import 'package:zine_prototype/widgets/coffee_concept_list.dart';

class CoffeeConceptHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if(details.primaryDelta < -20){
            Navigator.of(context).push(
              PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 650),
                  pageBuilder: (context, animation, _) {
                    return FadeTransition(
                      opacity: animation,
                      child: CoffeeConceptList(),
                    );
                  })
            );
          }
        },
        child: Stack(
          children: [
            SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end : Alignment.bottomCenter,
                    colors: [
                      Color(0XFFA89276),
                      Colors.white
                    ]
                  )
                ),
              ),
            ),
            Positioned(
                height: size.height * 0.4,
                left: 0,
                right: 0,
                top: size.height * 0.15,
                child: Hero(
                  tag: '7',
                  child: Image.asset(
                    coffees[6].image,
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Positioned(
                height: size.height,
                left: 0,
                right: 0,
                bottom: size.height * 0.7,
                child: Hero(
                  tag: '7',
                  child: Image.asset(
                    coffees[8].image,
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Positioned(
                height: size.height,
                left: 0,
                right: 0,
                top: -size.height * 0.8,
                child: Hero(
                  tag: '9',
                  child: Image.asset(
                    coffees[8].image,
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Positioned(
              height: 140,
              left: 0,
              right: 0,
              bottom: size.height * 0.25,
              child: Image.asset('assets/images/logo.png'),
            )
          ],
        ),
      ),
    );
  }
}
