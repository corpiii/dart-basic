class MovieInfo {
  List<Results> results;
  int total_pages;
  int total_results;

  MovieInfo({required this.results, required this.total_pages, required this.total_results});

  factory MovieInfo.fromJson(Map<String, dynamic> json) {
    return MovieInfo(
      results: List<Results>.from(json['results'].map((x) => Results.fromJson(x))),
      total_pages: json['total_pages'],
      total_results: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': this.results.map((e) => e.toJson()).toList(),
      'total_pages': this.total_pages,
      'total_results': this.total_results,
    };
  }
}

class Results {
  bool adult;
  String? backdrop_path;
  List<int> genre_ids;
  int id;
  String original_language;
  String original_title;
  String overview;
  double popularity;
  String? poster_path;
  String release_date;
  String title;
  bool video;
  double vote_average;
  int vote_count;

  Results({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      genre_ids: List<int>.from(json['genre_ids']),
      id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': this.adult,
      'backdrop_path': this.backdrop_path,
      'genre_ids': this.genre_ids,
      'id': this.id,
      'original_language': this.original_language,
      'original_title': this.original_title,
      'overview': this.overview,
      'popularity': this.popularity,
      'poster_path': this.poster_path,
      'release_date': this.release_date,
      'title': this.title,
      'video': this.video,
      'vote_average': this.vote_average,
      'vote_count': this.vote_count,
    };
  }
}