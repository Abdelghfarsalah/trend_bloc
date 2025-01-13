import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchProfileEvent extends ProfileEvent {
  final int id;

  FetchProfileEvent(this.id);

  @override
  List<Object?> get props => [id];
}
