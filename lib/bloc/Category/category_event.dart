import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryLoadingEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

// class CategoryCreateEvent extends CategoryEvent {
//   final String name;
//   final String imageUrl;
//   CategoryCreateEvent({required this.name, required this.imageUrl});
//   @override
//   List<Object?> get props => [];
// }

// class CategoryUpdateEvent extends CategoryEvent {
//   @override
//   List<Object?> get props => [];
// }

// class CategoryDeleteEvent extends CategoryEvent {
//   @override
//   List<Object?> get props => [];
// }
