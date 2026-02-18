import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/failures/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/filter/filter_entity.dart';
import '../../repositories/filter_repository.dart';

class FilterUseCases extends Equatable {
  final FetchFilters fetchFilters;


  const FilterUseCases({required this.fetchFilters});

  /// Factory constructor for easy creation
  factory FilterUseCases.create(FilterRepository repository) {
    return FilterUseCases(
      fetchFilters: FetchFilters(repository),

    );
  }

  @override
  List<Object?> get props => [fetchFilters];
}

class FetchFilters implements UseCase<List<FilterEntity?>?, NoParams> {
  final FilterRepository repository;

  FetchFilters(this.repository);

  @override
  Future<Either<Failure, List<FilterEntity?>?>> call([NoParams? params]) async {
    return await repository.fetchFilters();
  }
}