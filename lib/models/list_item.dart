part of '../tmdb_api.dart';

class ListItem {
  final MediaType mediaType;
  final int mediaId;
  final String comment;

  ///- `mediaType`: Set the kind of media object are you adding. *Allowed Values: movie, tv*
  ///
  ///- `mediaId`: Set the id of the media object are you adding. *minimum: 1*
  const ListItem({
    /*required*/ required this.mediaId,
    this.mediaType = MediaType.movie,
    this.comment = '',
  });

  ///create and returns a new `ListItem`. You can use it when want to change few feids.
  ListItem copyWith({
    MediaType? mediaType = MediaType.movie,
    int? mediaId,
    String? comment = '',
  }) {
    return ListItem(
      mediaType: mediaType ?? this.mediaType,
      mediaId: mediaId ?? this.mediaId,
      comment: comment ?? this.comment,
    );
  }

  ///Returns a map of
  ///```
  ///{
  ///   'media_type': mediaType,
  ///   'media_id': '$mediaId',
  ///   'comment': comment
  ///}
  ///```
  Map<String, dynamic> _toMap() {
    return {'media_type': _getMediaType(mediaType), 'media_id': '$mediaId', 'comment': comment};
  }

  String _getMediaType(MediaType mediaType) {
    switch (mediaType) {
      case MediaType.movie:
        return 'movie';
      case MediaType.tv:
        return 'tv';
      default:
        return 'movie';
    }
  }
}
