part of tmdb_api;

class Trending extends Category<V3> {
  Trending(V3 v)
      : assert(v != null),
        super(v, 'trending');

  ///Get the daily or weekly trending items. The daily
  ///trending list tracks items over the period of a day
  ///while items have a 24 hour half life.
  ///The weekly list tracks items over a 7 day period,
  ///with a 7 day half life.
  ///
  /// ## Valid Media Type
  /// - `all`	Include all movies, TV shows and people in the results as a global trending list. [MediaType.all] *(Default)*
  /// - `movie`	Show the trending movies in the results. [MediaType.movie]
  /// - `tv`	Show the trending TV shows in the results. [MediaType.tv]
  /// - `person`	Show the trending people in the results. [MediaType.person]
  ///
  /// ## Valid Time Window
  /// - `day`	View the trending list for the day. [TimeWindow.day] *(Default)*
  /// - `week`	View the trending list for the week. [TimeWindow.week]
  ///
  /// ## Parameters
  ///`page`:Specify which page to query. *minimum: 1 maximum: 1000 default: 1*
  /// ## Implementation
  ///
  /// ```
  ///Map result = await tmdb.v3.trending.getTrending(mediaType = MediaType.all,timeWindow = TimeWindow.day);
  /// ```
  ///
  Future<Map> getTrending(
      {MediaType mediaType = MediaType.all,
      TimeWindow timeWindow = TimeWindow.day,
      int page = 1}) {
    return _v._query(
        '$_endPoint/${_getMediaType(mediaType)}/${_getTimeWindow(timeWindow)}',
        optionalQueries: ['page=$page']);
  }

  //get the type of media in string
  String _getMediaType(MediaType mediaType) {
    switch (mediaType) {
      case MediaType.all:
        return 'all';
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
      case MediaType.person:
        return 'person';
      default:
        return 'all';
    }
  }

  //get timewindow in sting
  String _getTimeWindow(TimeWindow timeWindow) {
    switch (timeWindow) {
      case TimeWindow.day:
        return 'day';
      case TimeWindow.week:
        return 'week';
      default:
        return 'week';
    }
  }
}
