import 'package:tmdb_api/tmdb_api.dart';

main(List<String> args) async {
  TMDB tmdb = TMDB('Your API KEY');
  print(await tmdb.movies.getPouplar());
}
