import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:zine_prototype/models/texts.dart';
import 'package:zine_prototype/transformers/my_transformer.dart';
import 'package:zine_prototype/transformers/transformer.dart';
import 'package:zine_prototype/widgets/card_widget.dart';

class TransformerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransformerPageView(
        scrollDirection: Axis.vertical,
        curve: Curves.easeInBack,
        transformer: transformers[1], // transformers[5],
        itemCount: Texts.urlImages.length,
        itemBuilder: (context, index) {
          final urlImage = Texts.urlImages[index];
          final title = Texts.titles[index];
          final subtitle = Texts.subtitles[index];

          return CardWidget(
            urlImage: urlImage,
            title: title,
            subtitle: subtitle,
          );
        },
      ),
    );
  }
}
