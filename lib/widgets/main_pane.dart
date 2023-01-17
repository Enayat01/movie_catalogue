import 'package:flutter/material.dart';
import '../data.dart';
import '../models/movies_model.dart';
import '../pages/details_page.dart';
import '../utils/constants.dart';
import '../utils/responsive.dart';

class MainPane extends StatelessWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  final bool isGridview;

  const MainPane({
    required this.movieData,
    required this.scrollController,
    required this.isGridview,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> isHovering = List.generate(movieData!.length, (index) => false);

    return movieData == null || movieData!.isEmpty
        ? const Center(
            child: Text(
              notFound,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
            ),
          )

        ///if mode is grid view
        : isGridview
            ? GridView.builder(
                controller: scrollController,
                padding: ResponsiveWidget.isSmallScreen(context)
                    ? const EdgeInsets.all(20)
                    : const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                itemCount: movieData?.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  crossAxisSpacing: ResponsiveWidget.isSmallScreen(context)
                      ? 20
                      : 50, //column gap
                  mainAxisSpacing: 20, //row gap
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3.2 / 5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailsPage(
                              movieId: movieData![index].id!,
                            ),
                          ));
                    },
                    onHover: (value) {
                      isHovering[index] = value;
                    },
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: GridTile(
                              footer: Container(
                                alignment: Alignment.centerRight,
                                margin: const EdgeInsets.all(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 2,
                                    horizontal: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: ratingBoxColor,
                                  ),
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
                                          color: ratingTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: movieData?[index].posterPath == null
                                  ? Container(
                                      color: isHovering[index]
                                          ? hoveringColor
                                          : imageCardBackground,
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: const Center(
                                        child: Text(
                                          imageUnavailable,
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Image.network(
                                      posterImageBase +
                                          movieData?[index].posterPath,
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
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
                                            color: indicatorColor,
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
                                  fontSize: 17,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                getGenre(movieData![index].genreIds!),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: textColorLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })

            /// If mode is list view
            : ListView.builder(
                controller: scrollController,
                padding: ResponsiveWidget.isSmallScreen(context)
                    ? const EdgeInsets.all(20)
                    : const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                itemCount: movieData?.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(10),
                      color: listCardBackground,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          children: [
                            /// Image Box
                            Flexible(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: movieData?[index].posterPath == null
                                    ? Container(
                                        width: 140,
                                        color: isHovering[index]
                                            ? hoveringColor
                                            : listImageBoxColor,
                                        child: const Center(
                                          child: Text(
                                            imageUnavailable,
                                            style: TextStyle(
                                              color: textColor,
                                              fontSize: 20,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        child: Image.network(
                                          posterImageBase +
                                              movieData?[index].posterPath,
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
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
                                                color: indicatorColor,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ),
                            ),

                            ///Text column
                            Flexible(
                              flex: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movieData?[index].title ?? '',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: textColor,
                                      ),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          movieData?[index].overview ?? '',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: textColorLight70,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      getGenre(movieData![index].genreIds!),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: textColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: ratingBoxColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
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
                                        color: ratingTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
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
