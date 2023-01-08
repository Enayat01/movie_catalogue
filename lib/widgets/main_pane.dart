import 'package:flutter/material.dart';
import 'package:movie_catalogue/models/movies_model.dart';

import '../data.dart';

class MainPane extends StatelessWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;

  const MainPane({
    required this.movieData,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> isHovering = [];
    return movieData == null || movieData!.isEmpty
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
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            itemCount: movieData?.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 50,
                mainAxisSpacing: 20,
                maxCrossAxisExtent: 300,
                childAspectRatio: 3.2 / 5),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onHover: (value) {
                  isHovering.insert(index, false);
                  isHovering[index] = value;
                },
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
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
                                      "${movieData?[index].voteAverage}",
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
                          child: movieData?[index].posterPath == null
                              ? Container(
                                  color: Colors.indigo.withOpacity(0.5),
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
                                  pImageBase + movieData?[index].posterPath,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
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
                              movieData?[index].title ?? '',
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.white),
                            ),
                            Text(
                              getGenre(movieData![index].genreIds!),
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white60),
                            ),
                          ],
                        )),
                  ]),
                ),
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
