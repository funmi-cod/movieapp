class MovieModel {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  String? contentRating;
  String? duration;
  String? releaseDate;
  int? averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  double? imdbRating;
  String? posterurl;
  String? error;

  MovieModel(
      {this.id,
        this.title,
        this.year,
        this.genres,
        this.ratings,
        this.poster,
        this.contentRating,
        this.duration,
        this.releaseDate,
        this.averageRating,
        this.originalTitle,
        this.storyline,
        this.actors,
        this.imdbRating,
        this.posterurl});
  MovieModel.withError(String errorMessage) {
    error = errorMessage;
  }

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genres = json['genres'].cast<String>();
    ratings = json['ratings'].cast<int>();
    poster = json['poster'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    averageRating = json['averageRating'];
    originalTitle = json['originalTitle'];
    storyline = json['storyline'];
    actors = json['actors'].cast<String>();
    imdbRating = double.tryParse(json['imdbRating']?.toString()??'0');
    posterurl = json['posterurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['year'] = year;
    data['genres'] = genres;
    data['ratings'] = ratings;
    data['poster'] = poster;
    data['contentRating'] = contentRating;
    data['duration'] = duration;
    data['releaseDate'] = releaseDate;
    data['averageRating'] = averageRating;
    data['originalTitle'] = originalTitle;
    data['storyline'] = storyline;
    data['actors'] = actors;
    data['imdbRating'] = imdbRating;
    data['posterurl'] = posterurl;
    return data;
  }
}
