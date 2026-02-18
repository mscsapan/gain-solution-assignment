import 'package:dartz/dartz.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/failures/failures.dart';
import '../../domain/entities/filter/filter_item_entity.dart';
import '../../domain/repositories/filter_repository.dart';
import '../../presentation/utils/k_string.dart';
import '../data_provider/remote_data_source.dart';
import '../mappers/filter/filter_item_mapper.dart';
import '../models/filter/filter_item_model.dart';

class FilterRepositoryImpl implements FilterRepository {
  final RemoteDataSource remoteDataSources;

  FilterRepositoryImpl({required this.remoteDataSources});

  @override
  Future<Either<Failure, FilterItemEntity?>> fetchFilters() async {
    try {
      final result = await remoteDataSources.fetchTickets(KString.filterPath);

      final data = result;

      if (data == null) return Right(null);

      final model = FilterItemModel.fromMap(data).toDomain();

      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
