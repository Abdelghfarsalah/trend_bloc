import 'package:equatable/equatable.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object?> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {}

class ExploreLoaded extends ExploreState {
  final List<Map<String, dynamic>> posts;
  final String? nextPageUrl;

  const ExploreLoaded({required this.posts, this.nextPageUrl});

  @override
  List<Object?> get props => [posts, nextPageUrl];
}

class ExploreError extends ExploreState {
  final String message;

  const ExploreError({required this.message});

  @override
  List<Object?> get props => [message];
}
