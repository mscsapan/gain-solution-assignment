import 'package:dartz/dartz.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/failures/failures.dart';

import '../../domain/entities/filter/filter_entity.dart';
import '../../domain/repositories/filter_repository.dart';
import '../../presentation/utils/k_string.dart';
import '../data_provider/remote_data_source.dart';
import '../mappers/filter/filter_mapper.dart';
import '../models/filter/filter_model.dart';


class FilterRepositoryImpl implements FilterRepository {
  final RemoteDataSource remoteDataSources;

  FilterRepositoryImpl({required this.remoteDataSources});


  @override
  Future<Either<Failure, List<FilterEntity?>?>> fetchFilters() async {
    try {
      final result =  await remoteDataSources.fetchTickets(KString.filterPath);

      // Null-check raw result
      if (result == null) return const Right(<FilterEntity>[]);

      // Safe extraction & cast of 'data'
      final items = result as List<dynamic>? ?? <dynamic>[];

      // Safe mapping to models (with null filtering)
      final products = items.where((dynamic e) => e != null).map((dynamic e) => FilterModel.fromMap(e as Map<String, dynamic>? ?? <String, dynamic>{})).whereType<FilterModel>().toList();

      // Convert models → domain entities
      final productsEntity = products.map((FilterModel model) => model.toDomain()).toList();

      // Return empty list instead of null for consistency
      return Right(productsEntity.isEmpty ? <FilterEntity>[] : productsEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

}
