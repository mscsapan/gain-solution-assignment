import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/failures/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/ticket/ticket_item_entity.dart';
import '../../repositories/ticket_repository.dart';

class TicketUseCases extends Equatable {
  final FetchTickets fetchTickets;


  const TicketUseCases({required this.fetchTickets});

  /// Factory constructor for easy creation
  factory TicketUseCases.create(TicketRepository repository) {
    return TicketUseCases(
      fetchTickets: FetchTickets(repository),

    );
  }

  @override
  List<Object?> get props => [fetchTickets];
}

class FetchTickets implements UseCase<List<TicketItemEntity?>?, NoParams> {
  final TicketRepository repository;

  FetchTickets(this.repository);

  @override
  Future<Either<Failure, List<TicketItemEntity?>?>> call([NoParams? params]) async {
    return await repository.fetchTickets();
  }
}