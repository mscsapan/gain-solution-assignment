import 'package:dartz/dartz.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/failures/failures.dart';
import '../../domain/entities/contact/contact_item_entity.dart';
import '../../domain/repositories/contact_repository.dart';
import '../../presentation/utils/k_string.dart';
import '../data_provider/remote_data_source.dart';
import '../mappers/contact/contact_item_mapper.dart';
import '../models/contact/contact_item_model.dart';


class ContactRepositoryImpl implements ContactRepository {
  final RemoteDataSource remoteDataSources;

  ContactRepositoryImpl({required this.remoteDataSources});


  @override
  Future<Either<Failure, List<ContactItemEntity?>?>> fetchContacts() async {
    try {
      final result =  await remoteDataSources.fetchTickets(KString.contactPath);

      // Null-check raw result
      if (result == null) return const Right(<ContactItemEntity>[]);

      // Safe extraction & cast of 'data'
      final items = result as List<dynamic>? ?? <dynamic>[];

      // Safe mapping to models (with null filtering)
      final products = items.where((dynamic e) => e != null).map((dynamic e) => ContactItemModel.fromMap(e as Map<String, dynamic>? ?? <String, dynamic>{})).whereType<ContactItemModel>().toList();

      // Convert models → domain entities
      final productsEntity = products.map((ContactItemModel model) => model.toDomain()).toList();

      // Return empty list instead of null for consistency
      return Right(productsEntity.isEmpty ? <ContactItemEntity>[] : productsEntity);
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
