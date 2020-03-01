![Dart pub analyser](https://github.com/Arunnaidu3470/tmdb_api/workflows/Dart%20pub%20analyser/badge.svg?branch=master)
[![pub package](https://img.shields.io/pub/v/tmdb_api?color=dark%20green&include_prereleases&label=pub%20package&logo=dart)](https://pub.dartlang.org/packages/tmdb_api)

# tmdb_api

TMDB.org API for dart.
- [TMDB](https://www.themoviedb.org/)

## Avaliable features 
- [x] Movies
- [x] Tv shows
- [x] Tv Seasons
- [x] Tv Episodes 
- [X] People
- [X] Credits
- [X] Certification
- [X] Changes
- [X] Collections
- [X] Find
- [X] Genres
- [X] Keywords
- [X] Companies
- [X] Trending
- [X] Search
- [X] Discover
- [X] Networks

`More will be added soon`

# Getting Started
## 1) Import package
```
//import package
import 'package:tmdb_api/tmdb_api.dart';
```

## 2) Create a instance of `TMDB` class
```
//create a instance of TMDB
TMDB tmdb =TMDB('YOUR API KEY HERE');
```
*You can get your API key from [themoviedb.org API](https://www.themoviedb.org/settings/api)*

## 3) Thats all it takes now you can access all the features avaliable using `tmdb` instance.

# Example
For getting Trending movies 
```
//get results
Map result = await tmdb.trending.getTrending(mediaType = MediaType.all,timeWindow = TimeWindow.day);
```

# For more documentation
- visit [TMDB](https://developers.themoviedb.org/3/getting-started/introduction)