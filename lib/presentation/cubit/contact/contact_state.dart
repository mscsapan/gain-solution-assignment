part of 'contact_cubit.dart';

sealed class ContactState extends Equatable {
  const ContactState();
  @override
  List<Object?> get props => [];
}

final class ContactInitial extends ContactState {
  const ContactInitial();
}

final class ContactFetching extends ContactState {}

final class ContactFetched extends ContactState {

  final List<ContactItemModel?>? contacts;

  const ContactFetched(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

final class ContactFetchError extends ContactState {
  final String message;
  final int statusCode;

  const ContactFetchError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}
