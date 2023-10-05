import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductLoadingEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}
