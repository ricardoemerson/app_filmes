import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

import '../../../data/extensions/theme_extension.dart';
import '../../../data/models/movie_detail.dart';
import 'movie_cast.dart';

class MovieDetailContentMainCast extends StatelessWidget {
  final MovieDetail? movie;
  final showPanel = false.obs;

  MovieDetailContentMainCast({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanel.toggle();
            },
            children: [
              ExpansionPanel(
                isExpanded: showPanel.value,
                backgroundColor: Colors.white,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elenco',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: movie?.cast
                              .map((cast) => MovieCast(cast: cast))
                              .toList() ??
                          []),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}
