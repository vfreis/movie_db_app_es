//Packages
import 'package:get_it/get_it.dart';

//Models
import '../models/app_config.dart';

//modela as informações recebidas da api

class Movie {
  final String? name;
  final String? language;
  final bool? isAdult;
  final String? description;
  final String? posterPath;
  final String? backdropPath;
  final num? rating;
  final String? releaseDate;
  
    //The instance member 'releaseDate' can't be accessed in an initializer.
  // DateTime lancamento = DateTime.parse(releaseDate!);

  Movie(
      {this.name,
      this.language,
      this.isAdult,
      this.description,
      this.posterPath,
      this.backdropPath,
      this.rating,
      this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original_language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      posterPath: _json['poster_path'],
      backdropPath: _json['backdrop_path'],
      rating: _json['vote_average'],
      releaseDate: _json['release_date'],
    );
  }

  //require da api a url do poster do filme 
  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_API_URL}${this.posterPath}';
  }
}
