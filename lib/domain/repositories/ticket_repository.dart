import 'package:dartz/dartz.dart';

import '../../core/failures/failures.dart';
import '../entities/ticket/ticket_item_entity.dart';

abstract class TicketRepository {
  Future<Either<Failure, List<TicketItemEntity?>?>> fetchTickets();
}
