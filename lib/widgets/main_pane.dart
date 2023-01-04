import 'package:flutter/material.dart';
import 'package:movie_catalogue/models/popular_movies_model.dart';

import '../data.dart';

class MainPane extends StatelessWidget {
  final List<MovieResults>? movieData;
  const MainPane({
    required this.movieData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movieData == null || movieData!.isEmpty
        ? const Center(
            child: Text('No movies found'),
          )
        : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            itemCount: movieData?.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 50,
                mainAxisSpacing: 20,
                maxCrossAxisExtent: 300,
                childAspectRatio: 3.2 / 5),
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
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
                      child: Image(
                        image: NetworkImage(
                            pImageBase + movieData?[index].posterPath),
                        fit: BoxFit.fill,
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
                          movieData?[index].originalTitle ?? '',
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
              ]);
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
