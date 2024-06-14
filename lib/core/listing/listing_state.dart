


import 'package:equatable/equatable.dart';

abstract class ListingItem extends Equatable{

}

class ListingState<T extends ListingItem> extends Equatable {

  const ListingState({
    required this.nextPageKey,
    required this.error,
    required this.items,
  });


  final int nextPageKey;
  final String error;
  final List<T> items;

  @override
  List<Object?> get props => [nextPageKey, error, items];

}
