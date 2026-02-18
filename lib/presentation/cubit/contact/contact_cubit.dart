import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/mappers/contact/contact_item_mapper.dart';
import '../../../data/models/contact/contact_item_model.dart';
import '../../../domain/usecases/contact/contact_usecases.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactItemModel> {
  final ContactUseCases _useCase;

  ContactCubit({required ContactUseCases useCase})
    : _useCase = useCase,
      super(ContactItemModel.init());

  List<ContactItemModel?>? contacts = [];
  List<ContactItemModel?>? searchContacts = [];

  Future<void> getContacts() async {
    emit(state.copyWith(contactState: ContactFetching()));

    final result = await _useCase.fetchContacts();

    result.fold(
      (failure) {
        final error = ContactFetchError(failure.message, failure.statusCode);
        emit(state.copyWith(contactState: error));
      },
      (success) {
        contacts = success?.map((e) => e?.toData()).whereType<ContactItemModel>().toList() ??<ContactItemModel>[];

        final loaded = ContactFetched(contacts);

        //debugPrint('loaded-Contacts $contacts');

        Future.delayed(Duration(seconds: 1), () {
          emit(state.copyWith(contactState: loaded));
        });
      },
    );
  }


  void searchContact(String? name) {

    if (name == null || name.trim().isEmpty) return;

    final query = name.toLowerCase();

    searchContacts = contacts?.where((customer) {
      final fullName = '${customer?.firstName ?? ''} ${customer?.lastName ?? ''}'.toLowerCase();

      return fullName.contains(query);
    }).toList();

    emit(state.copyWith(contactState: ContactFetched(searchContacts),id: searchContacts?.length));
  }

}
