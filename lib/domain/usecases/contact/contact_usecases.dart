import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/failures/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/contact/contact_item_entity.dart';
import '../../repositories/contact_repository.dart';

class ContactUseCases extends Equatable {
  final FetchContacts fetchContacts;


  const ContactUseCases({required this.fetchContacts});

  /// Factory constructor for easy creation
  factory ContactUseCases.create(ContactRepository repository) {
    return ContactUseCases(
      fetchContacts: FetchContacts(repository),

    );
  }

  @override
  List<Object?> get props => [fetchContacts];
}

class FetchContacts implements UseCase<List<ContactItemEntity?>?, NoParams> {
  final ContactRepository repository;

  FetchContacts(this.repository);

  @override
  Future<Either<Failure, List<ContactItemEntity?>?>> call([NoParams? params]) async {
    return await repository.fetchContacts();
  }
}