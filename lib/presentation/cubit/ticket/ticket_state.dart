part of 'ticket_cubit.dart';

sealed class TicketState extends Equatable {
  const TicketState();
  @override
  List<Object?> get props => [];
}

final class TicketInitial extends TicketState {
  const TicketInitial();
}

final class TicketFetching extends TicketState {}

final class TicketFetched extends TicketState {

  final List<TicketItemModel?>? tickets;

  const TicketFetched(this.tickets);

  @override
  List<Object?> get props => [tickets];
}

final class TicketFetchError extends TicketState {
  final String message;
  final int statusCode;

  const TicketFetchError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}
