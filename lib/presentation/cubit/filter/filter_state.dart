part of 'filter_cubit.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object?> get props => [];
}

final class FilterInitial extends FilterState {
  const FilterInitial();
}


final class FilterFetching extends FilterState {}

final class FilterFetched extends FilterState {

  final FilterItemModel? filterData;

  const FilterFetched(this.filterData);

  @override
  List<Object?> get props => [filterData];
}

final class FilterFetchError extends FilterState {
  final String message;
  final int statusCode;

  const FilterFetchError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}