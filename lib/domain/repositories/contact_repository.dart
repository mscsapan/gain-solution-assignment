

import 'package:dartz/dartz.dart';

import '../../core/failures/failures.dart';
import '../entities/contact/contact_item_entity.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<ContactItemEntity?>?>> fetchContacts();
}
