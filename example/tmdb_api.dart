import 'package:tmdb_api/tmdb_api.dart';

main(List<String> args) async {
  TMDB tmdb = TMDB(ApiKeys('Your API KEY', 'apiReadAccessTokenv4'));
  print(await tmdb.v3.movies.getPouplar());
}
