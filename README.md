![Dart pub analyser](https://github.com/Arunnaidu3470/tmdb_api/workflows/Dart%20pub%20analyser/badge.svg?branch=master)
[![pub package](https://img.shields.io/pub/v/tmdb_api?color=dark%20green&include_prereleases&label=pub%20package&logo=dart)](https://pub.dartlang.org/packages/tmdb_api)

# tmdb_api
<img src="https://www.themoviedb.org/assets/2/v4/logos/primary-green-d70eebe18a5eb5b166d5c1ef0796715b8d1a2cbc698f96d311d62f894ae87085.svg" height=100px width="50%"><img src="https://dart.dev/assets/shared/dart/logo+text/horizontal/white-e71fb382ad5229792cc704b3ee7a88f8013e986d6e34f0956d89c453b454d0a5.svg" height="100px" width="50%">

A Dart client-side API package for TMDB API.
To know more visit [*TMDB*](https://www.themoviedb.org/)

## Avaliable features 
### v3( 🎊✨ Completed 🎉🎉)
    Supports all the functions of version 3 of tmdb API
    - [X] Auth
    - [X] Account
    - [X] Guest Sessions
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
    - [X] Reviews
    - [X] Versions
    - [X] Lists
    
### v4(🎊✨ Completed 🎉🎉)
    - [X] Image URL Constructor
    - [X] auth
    - [X] account
    - [X] lists

### v5(is currently in beta)  
`More will be added soon`

---
**Version *1.0.0-beta.1***
---
# Getting Started for ( *package >= v1.0.0-beta* )

**🎉Now This package supports both v3 and v4 of TMDB API**

There were some changes to the internal code structure, this changes may break your app.
This changes were made so that it will be easy to migrate to newer versions of TMDB API.

---
## 1) Import package
```
//import package
import 'package:tmdb_api/tmdb_api.dart';
```

## 2) Create a instance of `ApiKeys` and `TMDB` class
```
//create a instance of ApiKeys with V3 and V4 keys
ApiKeys keys = ApiKeys('Your API KEY V3', 'API READ ACCESS TOKEN V4');

//create a instance of TMDB with keys instance
TMDB tmdb = TMDB(keys);
```

*You can get your API key from [themoviedb.org API](https://www.themoviedb.org/settings/api)*

## 3) Thats all it takes now you can access all the features avaliable using `tmdb` instance.

# Example

## 1.0.0 and after
For getting Trending movies 
```
Map result = await tmdb.v3.trending.getTrending(mediaType = MediaType.all,timeWindow = TimeWindow.day);

```
---
**Version *0.3.1-alpha***
---
# Getting Started for ( *package >= v0.3.1-alpha* )

There were some changes to the internal code structure, this changes may break your app.
This changes were made so that it will be easy to migrate to newer versions of TMDB API.

---
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

## 0.3.1 and after
For getting Trending movies 
```
Map result = await tmdb.v3.trending.getTrending(mediaType = MediaType.all,timeWindow = TimeWindow.day);

```
Change : *...tmdb.`v3`.get...*

## 0.2.1 and before
For getting Trending movies 

```
//get results

Map result = await tmdb.trending.getTrending(mediaType = MediaType.all,timeWindow = TimeWindow.day);

```

---
# Getting Started for (*package <= v0.2.1-alpha*)
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
visit [TMDB](https://developers.themoviedb.org/3/getting-started/introduction)