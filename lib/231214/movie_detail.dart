class MovieDetail {
  bool adult;
  String backdropPath;
  BelongsToCollection belongsToCollection;
  int budget;
  List<Genres> genres;
  String homepage;
  int id;
  String imdbId;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompanies> productionCompanies;
  List<ProductionCountries> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguages> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetail({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: BelongsToCollection.fromJson(json['belongs_to_collection']),
      budget: json['budget'],
      genres: List<Genres>.from(json['genres'].map((x) => Genres.fromJson(x))),
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: List<ProductionCompanies>.from(
          json['production_companies'].map((x) => ProductionCompanies.fromJson(x))),
      productionCountries: List<ProductionCountries>.from(
          json['production_countries'].map((x) => ProductionCountries.fromJson(x))),
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: List<SpokenLanguages>.from(
          json['spoken_languages'].map((x) => SpokenLanguages.fromJson(x))),
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': this.adult,
      'backdropPath': this.backdropPath,
      'belongsToCollection': this.belongsToCollection,
      'budget': this.budget,
      'genres': this.genres,
      'homepage': this.homepage,
      'id': this.id,
      'imdbId': this.imdbId,
      'originalLanguage': this.originalLanguage,
      'originalTitle': this.originalTitle,
      'overview': this.overview,
      'popularity': this.popularity,
      'posterPath': this.posterPath,
      'productionCompanies': this.productionCompanies.map((e) => e.toJson()).toList(),
      'productionCountries': this.productionCountries.map((e) => e.toJson()).toList(),
      'releaseDate': this.releaseDate,
      'revenue': this.revenue,
      'runtime': this.runtime,
      'spokenLanguages': this.spokenLanguages.map((e) => e.toJson()).toList(),
      'status': this.status,
      'tagline': this.tagline,
      'title': this.title,
      'video': this.video,
      'voteAverage': this.voteAverage,
      'voteCount': this.voteCount,
    };
  }
}

class BelongsToCollection {
  int id;
  String name;
  String posterPath;
  String backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
      'posterPath': this.posterPath,
      'backdropPath': this.backdropPath,
    };
  }
}

class Genres {
  int id;
  String name;

  Genres({
    required this.id,
    required this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompanies {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) {
    return ProductionCompanies(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'logoPath': this.logoPath,
      'name': this.name,
      'originCountry': this.originCountry,
    };
  }
}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) {
    return ProductionCountries(
      iso31661: json['iso_3166_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iso31661': this.iso31661,
      'name': this.name,
    };
  }
}

class SpokenLanguages {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguages({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return SpokenLanguages(
      englishName: json['english_name'],
      iso6391: json['iso_639_1'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'englishName': this.englishName,
      'iso6391': this.iso6391,
      'name': this.name,
    };
  }
}