# tmdb_api

[![Dart Code Analysis](https://github.com/RatakondalaArun/tmdb_api/actions/workflows/analysis.yml/badge.svg)](https://github.com/RatakondalaArun/tmdb_api/actions/workflows/analysis.yml)
[![CI](https://github.com/RatakondalaArun/tmdb_api/actions/workflows/ci.yml/badge.svg)](https://github.com/RatakondalaArun/tmdb_api/actions/workflows/ci.yml)
[![pub package](https://img.shields.io/pub/v/tmdb_api?color=dark%20green&include_prereleases&label=pub%20package&logo=dart)](https://pub.dartlang.org/packages/tmdb_api)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
<!-- markdownlint-disable MD033 -->

<p align="center">
<img src="https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg" height=100px><img src="https://avatars.githubusercontent.com/u/1609975?s=100&v=4" height="100px">  
</p>

A TheMovieDatabase client library for dart.
To know more about TMDB visit [*offical site*](https://www.themoviedb.org/)

## Getting started

1) **Adding as dependencies**

    [Pub.dev's installation guide](https://pub.dev/packages/tmdb_api#-installing-tab-)

    Add this to your package's pubspec.yaml file:

    ```yaml
    dependencies:
      tmdb_api: latest //visit tmdb for latest version number
    ```

2) **Import it**

    Now in your Dart code, you can use:

    ```dart
    import 'package:tmdb_api/tmdb_api.dart';
    ```

3) **Create Instance**

    Now you need to create instance for `TMDB` and `ApiKeys` with your api keys.

    ```dart
    final tmdbWithCustomLogs = TMDB( //TMDB instance
        ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),//ApiKeys instance with your keys,
      );
    ```

4) **Configuring console logs**

    There are 3 logconfigs presets avaliable.

    - `ConfigLogger.showAll()`: development use.
    - `ConfigLogger.showRecommended()`: development use.
    - `ConfigLogger.showNone()`: production use.

    You can add any off this presets to `logConfig` named parameter of `TMDB` instance
    **Custom Logs**

    ```dart
    final tmdbWithCustomLogs = TMDB(
        ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),
        logConfig: ConfigLogger(
          showLogs: true,//must be true than only all other logs will be shown
          showErrorLogs: true,
        ),
      );
    ```

## Example

For getting Trending movies

```dart
Map result = await tmdb.v3.trending.getTrending(mediaType = MediaType.all,timeWindow = TimeWindow.day);
```

### Custom Dio instance

```dart
    final tmdbWithCustomLogs = TMDB(
        ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),
        dio:Dio()// your own dio instance
      );
```

### Adding Interceptors

```dart
final tmdbWithCustomLogs = TMDB(
    ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),
    interceptors:Interceptors()..add(/*your interceptor*/)
    );
```

or

```dart
final customDio = Dio();
customDio.interceptors.add(/*your interceptor*/)

final tmdbWithCustomLogs = TMDB(
    ApiKeys('Your API KEY', 'apiReadAccessTokenv4'),
    dio:dio
    );
```

note:*Use interceptors only when you are not using a custom `Dio` instance*.

## For more API documentation

visit [offical API documentation](https://developers.themoviedb.org/3/getting-started/introduction)
