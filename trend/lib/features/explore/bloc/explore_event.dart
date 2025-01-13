import 'package:equatable/equatable.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object?> get props => [];
}

class FetchExplorePostsEvent extends ExploreEvent {
  final String? nextPageUrl;

  const FetchExplorePostsEvent({this.nextPageUrl});

  @override
  List<Object?> get props => [nextPageUrl];
}
