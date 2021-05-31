part of tmdb_api;

class Discover extends Category<V3> {
  // final V3 _v;
  // final String _endPoint = 'discover';

  Discover(V3 v) : super(v, 'discover');

  ///Discover movies by different types of data like average rating, number of votes, genres and certifications.
  ///
  ///Before using this it is recommended to read
  /// the [offical documentation](https://developers.themoviedb.org/3/discover/movie-discover)
  ///
  ///
  ///
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.discover.getMovies();
  /// ```
  /// ## Result
  /// ```
  /// result['results']
  /// ```
  Future<Map> getMovies({
    String language = 'en-US',
    SortMoviesBy sortBy = SortMoviesBy.popularityDesc,
    int page = 1,
    bool includeAdult = false,
    bool includeVideo = false,
    String? region,
    String? certificationCountry,
    String? certification,
    String? certificationLessThan,
    String? certificationGreaterThan,
    int? primaryReleaseYear,
    String? primaryReleaseDateGreaterThan,
    String? primaryReleaseDateLessThan,
    String? releaseDateGreaterThan,
    String? releaseDateLessThan,
    String? withReleaseType,
    int? year,
    int? voteCountGreaterThan,
    int? voteCountLessThan,
    int? voteAverageGreaterThan,
    int? voteAverageLessThan,
    String? withCast,
    String? withCrew,
    String? withPeople,
    String? withCompanies,
    String? withGenres,
    String? withoutGenres,
    String? withKeywords,
    String? withoutKeywords,
    int? withRunTimeGreaterThan,
    int? withRuntimeLessThan,
    String? withOrginalLanguage,
  }) {
    //all the default values
    final queries = <String>[
      'language=$language',
      'sort_by=${_getSortMovieBy(sortBy)}',
      'page=$page',
      'includeAdult=$includeAdult',
      'includeVideo=$includeVideo',
    ];
    if (region != null) {
      queries.add('region=$region');
    }
    if (certificationCountry != null) {
      queries.add('certification_country=$certificationCountry');
    }

    if (certification != null && certificationCountry != null) {
      queries.add('certification=$certification');
    }

    if (certificationLessThan != null && certificationCountry != null) {
      queries.add('certification.lte=$certificationLessThan');
    }

    if (certificationGreaterThan != null && certificationCountry != null) {
      queries.add('certification.gte=$certificationGreaterThan');
    }

    if (primaryReleaseYear != null) {
      queries.add('primary_release_year=$primaryReleaseYear');
    }

    if (primaryReleaseDateGreaterThan != null) {
      queries.add('primary_release_date.gte=$primaryReleaseDateGreaterThan');
    }

    if (primaryReleaseDateLessThan != null) {
      queries.add('primary_release_date.lte=$primaryReleaseDateLessThan');
    }

    if (releaseDateGreaterThan != null) {
      queries.add('release_date.gte=$releaseDateGreaterThan');
    }

    if (releaseDateLessThan != null) {
      queries.add('release_date.lte=$releaseDateLessThan');
    }

    if (withReleaseType != null) {
      queries.add('with_release_type=$withReleaseType');
    }

    if (year != null) {
      queries.add('year=$year');
    }

    if (voteCountGreaterThan != null) {
      queries.add('vote_count.gte=$voteCountGreaterThan');
    }

    if (voteCountLessThan != null) {
      queries.add('vote_count.gte=$voteCountLessThan');
    }

    if (voteAverageGreaterThan != null) {
      queries.add('vote_average.gte=$voteAverageGreaterThan');
    }

    if (voteAverageLessThan != null) {
      queries.add('vote_average.gte=$voteAverageLessThan');
    }

    if (withCast != null) {
      queries.add('with_cast=$withCast');
    }

    if (withCrew != null) {
      queries.add('with_crew=$withCrew');
    }

    if (withPeople != null) {
      queries.add('with_people=$withPeople');
    }

    if (withCompanies != null) {
      queries.add('with_companies=$withCompanies');
    }

    if (withGenres != null) {
      queries.add('with_genres=$withGenres');
    }

    if (withoutGenres != null) {
      queries.add('without_genres=$withoutGenres');
    }

    if (withKeywords != null) {
      queries.add('with_keywords=$withKeywords');
    }

    if (withoutKeywords != null) {
      queries.add('without_keywords=$withoutKeywords');
    }

    if (withRunTimeGreaterThan != null) {
      queries.add('with_runtime.gte=$withRunTimeGreaterThan');
    }

    if (withRuntimeLessThan != null) {
      queries.add('with_runtime.lte=$withRuntimeLessThan');
    }

    if (withOrginalLanguage != null) {
      queries.add('with_original_language=$withOrginalLanguage');
    }

    return _v._query('$_endPoint/movie', optionalQueries: queries);
  }

  ///Discover TV shows by different types of data like
  ///average rating, number of votes, genres,
  ///the network they aired on and air dates.
  ///
  ///Before using this it is recommended to read
  /// the [offical documentation](https://developers.themoviedb.org/3/discover/tv-discover)
  /// ## Implementation
  /// ```
  /// Map result = await tmdb.discover.getTvShows(page: 2, voteCountGte: 560);
  /// ```
  /// ## Result
  /// ```
  /// result['results']
  /// ```
  Future<Map> getTvShows({
    String language = 'en-US',
    SortTvShowsBy sortBy = SortTvShowsBy.popularityDesc,
    int page = 1,
    bool includeNullFirstAirDates = false,
    String? airDateGte,
    String? airDateLte,
    String? firstAirDateGte,
    String? firstAirDateLte,
    int? firstAirDateYear,
    String? timezone,
    double? voteAverageGte,
    int? voteCountGte,
    String? withGeners,
    String? withoutGeners,
    String? withNetworks,
    int? withRuntimeGte,
    int? withRuntimeLte,
    String? withOrginalLanguage,
    String? withKeywords,
    String? withoutKeywords,
    bool? screenedTheatrically,
    String? withCompanies,
  }) {
    //all the default values
    final queries = <String>[
      'language=$language',
      'sort_by=${_getSortTvShowsBy(sortBy)}',
      'page=$page',
      'include_null_first_air_dates=$includeNullFirstAirDates',
    ];

    if (airDateGte != null) {
      queries.add('air_date.gte=$airDateGte');
    }

    if (airDateLte != null) {
      queries.add('air_date.lte=$airDateLte');
    }

    if (firstAirDateGte != null) {
      queries.add('first_air_date.gte=$firstAirDateGte');
    }

    if (firstAirDateLte != null) {
      queries.add('first_air_date.lte=$firstAirDateLte');
    }

    if (firstAirDateYear != null) {
      queries.add('first_air_date_year=$firstAirDateYear');
    }

    if (timezone != null) {
      queries.add('timezone=$timezone');
    }

    if (firstAirDateLte != null) {
      queries.add('first_air_date.lte=$firstAirDateLte');
    }

    if (voteAverageGte != null) {
      queries.add('vote_average.gte=$voteAverageGte');
    }

    if (voteCountGte != null) {
      queries.add('vote_count.gte=$voteCountGte');
    }

    if (withGeners != null) {
      queries.add('with_genres=$withGeners');
    }

    if (withoutGeners != null) {
      queries.add('without_genres=$withoutGeners');
    }

    if (withNetworks != null) {
      queries.add('with_networks=$withNetworks');
    }

    if (withRuntimeGte != null) {
      queries.add('with_runtime.gte=$withRuntimeGte');
    }

    if (withRuntimeLte != null) {
      queries.add('with_runtime.lte=$withRuntimeLte');
    }

    if (withOrginalLanguage != null) {
      queries.add('with_original_language=$withOrginalLanguage');
    }

    if (screenedTheatrically != null) {
      queries.add('screened_theatrically=$screenedTheatrically');
    }

    if (withCompanies != null) {
      queries.add('with_companies=$withCompanies');
    }

    if (withKeywords != null) {
      queries.add('with_keywords=$withKeywords');
    }

    if (withoutKeywords != null) {
      queries.add('without_keywords=$withoutKeywords');
    }

    return _v._query('$_endPoint/tv', optionalQueries: queries);
  }

  String _getSortMovieBy(SortMoviesBy sortBy) {
    switch (sortBy) {
      case SortMoviesBy.popularityAsc:
        return 'popularity.asc';
      case SortMoviesBy.popularityDesc:
        return 'popularity.desc';
      case SortMoviesBy.releaseDateAsc:
        return 'release_date.asc';
      case SortMoviesBy.releaseDateDesc:
        return 'release_date.desc';
      case SortMoviesBy.revenueAsc:
        return 'revenue.asc';
      case SortMoviesBy.revenueDesc:
        return 'revenu.desc';
      case SortMoviesBy.primaryReleaseDateAsc:
        return 'primary_release_date.asc';
      case SortMoviesBy.primaryReleaseDateDesc:
        return 'primary_release_date.desc';
      case SortMoviesBy.orginalTitleAsc:
        return 'orginal_title.asc';
      case SortMoviesBy.orginalTitleDesc:
        return 'orginal_title.desc';
      case SortMoviesBy.voteAverageAsc:
        return 'vote_average.asc';
      case SortMoviesBy.voteAverageDesc:
        return 'vote_average.desc';
      case SortMoviesBy.voteCountAsc:
        return 'vote_count.asc';
      case SortMoviesBy.voteCountDesc:
        return 'vote_count.desc';
      default:
        return 'popularity.asc';
    }
  }

  String _getSortTvShowsBy(SortTvShowsBy sortBy) {
    switch (sortBy) {
      case SortTvShowsBy.popularityAsc:
        return 'popularity.asc';
      case SortTvShowsBy.popularityDesc:
        return 'popularity.desc';
      case SortTvShowsBy.voteAverageAsc:
        return 'vote_average.asc';
      case SortTvShowsBy.voteAverageDesc:
        return 'vote_average.desc';
      case SortTvShowsBy.firstAirDateAsc:
        return 'first_air_date.asc';
      case SortTvShowsBy.firstAirDateDesc:
        return 'first_air_date.desc';
      default:
        return 'popularity.asc';
    }
  }
}
