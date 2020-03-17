part of tmdb_api;

class Changes {
  ///Provides details about movies
  final V3 _v3;
  final String _endPoint = 'changes';
  Changes(this._v3) : assert(_v3 != null);

  ///Get a list of all of the movie ids that have been changed in the past 24 hours.
  ///100 items are returned per page.
  ///
  ///For doc [visit](https://developers.themoviedb.org/3/changes/get-movie-change-list)
  ///
  ///## Parameters
  ///`endDate`:Filter the results with a end date.
  ///
  ///`startDatte`:Filter the results with a start date.
  ///
  ///`page`:Specify which page to query. minimum: 1, maximum: 1000, default: 1
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.changes.getMovieList();
  /// ```
  ///
  Future<Map> getMovieList({String endDate, String startDate, int page = 1}) {
    List<String> para = [];
    if (endDate != null) {
      para.add('end_date=$endDate');
    }
    if (startDate != null) {
      para.add('start_date=$startDate');
    }
    if (page != null) {
      para.add('page=${page < 1 || page > 1000 ? 1 : page}');
    }

    return _v3._query('movie/$_endPoint', optionalQueries: para);
  }

  ///Get a list of all of the TV show ids that have been changed in the past 24 hours.
  ///100 items are returned per page.
  ///
  ///For doc [visit](https://developers.themoviedb.org/3/changes/get-tv-change-list)
  ///
  ///## Parameters
  ///`endDate`:Filter the results with a end date.
  ///
  ///`startDatte`:Filter the results with a start date.
  ///
  ///`page`:Specify which page to query. minimum: 1, maximum: 1000, default: 1
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.changes.getTvList();
  /// ```
  ///
  Future<Map> getTvList({String endDate, String startDate, int page = 1}) {
    List<String> para = [];
    if (endDate != null) {
      para.add('end_date=$endDate');
    }
    if (startDate != null) {
      para.add('start_date=$startDate');
    }
    if (page != null) {
      para.add('page=${page < 1 || page > 1000 ? 1 : page}');
    }

    return _v3._query('tv/$_endPoint', optionalQueries: para);
  }

  ///Get a list of all of the person ids that have been changed in the past 24 hours.
  ///100 items are returned per page.
  ///For doc visit https://developers.themoviedb.org/3/changes/get-person-change-list
  ///
  ///## Parameters
  ///`endDate`:Filter the results with a end date.
  ///
  ///`startDatte`:Filter the results with a start date.
  ///
  ///`page`:Specify which page to query. minimum: 1, maximum: 1000, default: 1
  ///## Implementation
  ///
  ///```
  /// Map result = await tmdb.changes.getPersonList();
  /// ```
  ///
  Future<Map> getPersonList({String endDate, String startDate, int page = 1}) {
    List<String> para = [];
    if (endDate != null) {
      para.add('end_date=$endDate');
    }
    if (startDate != null) {
      para.add('start_date=$startDate');
    }
    if (page != null) {
      para.add('page=${page < 1 || page > 1000 ? 1 : page}');
    }

    return _v3._query('person/$_endPoint');
  }
}
