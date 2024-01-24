part of '../../../tmdb_api.dart';

class Networks extends Category<V3> {
  Networks(V3 v) : super(v, 'network');

  ///Get the details of a network.
  ///
  ///## Parameters
  ///- `networkId`: network id for a given network.
  ///Should not pass a null value
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.v3.networks.getDetails(213);
  ///```
  ///
  ///For doc visit
  ///[Offical Docmentation](https://developers.themoviedb.org/3/networks/get-network-details)
  Future<Map> getDetails(int networkId) {
    return _v._query('$_endPoint/$networkId');
  }

  /// Get the alternative names of a network.
  ///
  ///## Parameters
  ///- `networkId`: network id for a given network.
  ///Should not pass a null value
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.v3networks.getAlternativeNames(213);
  ///```
  Future<Map> getAlternativeNames(int networkId) {
    return _v._query('$_endPoint/$networkId/alternative_names');
  }

  ///Get the TV network logos by id.
  ///
  ///## Parameters
  ///- `networkId`: network id for a given network.
  ///Should not pass a null value
  ///
  ///## Usage
  ///```
  ///Map result = await tmdb.v3networks.getImages(213);
  ///```
  Future<Map> getImages(int networkId) {
    return _v._query('$_endPoint/$networkId/images');
  }
}
