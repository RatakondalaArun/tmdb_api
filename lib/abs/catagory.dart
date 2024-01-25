part of '../tmdb_api.dart';

/// Base calss of [Category]s
abstract class Category<V extends Version> {
  /// Version type
  final V _v;

  /// endpoint of this category
  final String _endPoint;

  /// Creates a instance of [this]
  Category(this._v, this._endPoint);
}
