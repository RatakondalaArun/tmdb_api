part of tmdb_api;

abstract class Category<V extends Version> {
  final V _v;
  final String _endPoint;

  Category(this._v, this._endPoint);
}
