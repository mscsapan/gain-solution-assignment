import 'package:dartz/dartz.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/failures/failures.dart';
import '../../domain/entities/ticket/ticket_item_entity.dart';
import '../../domain/repositories/ticket_repository.dart';
import '../data_provider/remote_data_source.dart';
import '../mappers/ticket/ticketitem_mapper.dart';
import '../models/ticket/ticket_item_model.dart';


class TicketRepositoryImpl implements TicketRepository {
  final RemoteDataSource remoteDataSources;

  TicketRepositoryImpl({required this.remoteDataSources});


  @override
  Future<Either<Failure, List<TicketItemEntity?>?>> fetchTickets() async {
    try {
      final result =  await remoteDataSources.fetchTickets();

      // Null-check raw result
      if (result == null) return const Right(<TicketItemEntity>[]);

      // Safe extraction & cast of 'data'
      final items = result as List<dynamic>? ?? <dynamic>[];

      // Safe mapping to models (with null filtering)
      final products = items.where((dynamic e) => e != null).map((dynamic e) => TicketItemModel.fromMap(e as Map<String, dynamic>? ?? <String, dynamic>{})).whereType<TicketItemModel>().toList();

      // Convert models → domain entities
      final productsEntity = products.map((TicketItemModel model) => model.toDomain()).toList();

      // Return empty list instead of null for consistency
      return Right(productsEntity.isEmpty ? <TicketItemEntity>[] : productsEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }



  // @override
  // Future<Either<Failure, VoucherEntity?>> fetchUserAvailableVoucher(AuthModel? body) async{
  //   try {
  //     final result = await remoteDataSources.fetchPoints(body);
  //
  //     final data = result['data'];
  //
  //     if(data == null) return Right(null);
  //
  //     final model = VoucherModel.fromMap(data).toDomain();
  //
  //     return Right(model);
  //
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   } on InvalidAuthDataException catch (e) {
  //     return Left(InvalidAuthDataFailure(e.errors));
  //   }
  // }
}
