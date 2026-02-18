import 'package:dartz/dartz.dart';

import '../../core/failures/failures.dart';
import '../entities/filter/filter_item_entity.dart';

abstract class FilterRepository {
  Future<Either<Failure, FilterItemEntity?>> fetchFilters();
}
