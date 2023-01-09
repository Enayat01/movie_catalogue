import 'package:flutter/material.dart';
import 'package:movie_catalogue/models/movies_model.dart';
import 'package:movie_catalogue/utils/responsive.dart';

import '../data.dart';

class MainPane extends StatefulWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;

  const MainPane({
    required this.movieData,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<MainPane> createState() => _MainPaneState();
}

class _MainPaneState extends State<MainPane> {
  @override
  Widget build(BuildContext context) {
    List<bool> isHovering =
        List.generate(widget.movieData!.length, (index) => false);
    return widget.movieData == null || widget.movieData!.isEmpty
        ? const Center(
            child: Text(
              'No movies found',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        : GridView.builder(
            controller: widget.scrollController,
            padding: ResponsiveWidget.isSmallScreen(context)
                ? const EdgeInsets.all(20)
                : const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            itemCount: widget.movieData?.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: ResponsiveWidget.isSmallScreen(context)
                    ? 20
                    : 50, //column gap
                mainAxisSpacing: 20, //row gap
                maxCrossAxisExtent: 300,
                childAspectRatio: 3.2 / 5),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isHovering[index] = value;
                  });
                },
                child: Column(children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GridTile(
                        footer: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.all(12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 3),
                              color: Colors.yellowAccent,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                  Text(
                                    "${widget.movieData?[index].voteAverage}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: widget.movieData?[index].posterPath == null
                            ? Container(
                                color: isHovering[index]
                                    ? Colors.white70
                                    : Colors.indigo.withOpacity(0.5),
                                height: double.infinity,
                                width: double.infinity,
                                child: const Center(
                                  child: Text(
                                    'Image not available',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            : Image.network(
                                pImageBase +
                                    widget.movieData?[index].posterPath,
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.movieData?[index].title ?? '',
                            style: const TextStyle(
                                fontSize: 17, color: Colors.white),
                          ),
                          Text(
                            getGenre(widget.movieData![index].genreIds!),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white60),
                          ),
                        ],
                      )),
                ]),
              );
            });
  }

  String getGenre(List<int> gIndex) {
    String genre = "";
    gIndex.asMap().forEach((index, value) {
      var g = genres.firstWhere((element) => element["id"] == value,
          orElse: () => {});
      if (index < 2 && g.isNotEmpty) {
        genre += g["name"] + " ";
      }
    });
    return genre;
  }
}
