part of '../tmdb_api.dart';

/// Base class of [Version]s
abstract class Version {
  /// Instance of [TMDB]
  final TMDB _tmdb;

  /// Version of this api
  final int _apiVersion;

  Version(this._tmdb, this._apiVersion);
}
