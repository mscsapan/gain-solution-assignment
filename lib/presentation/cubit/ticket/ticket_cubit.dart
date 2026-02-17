import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gain_solution_task/data/models/ticket/ticket_item_model.dart';

import '../../../data/mappers/ticket/ticketitem_mapper.dart';
import '../../../domain/usecases/ticket/ticket_usecases.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketItemModel> {

  final TicketUseCases _useCase;

  TicketCubit({required TicketUseCases useCase})
      : _useCase = useCase,
        super(TicketItemModel.init());

  List<TicketItemModel?> ? tickets = [];

  Future<void> getPointHistory() async {

    emit(state.copyWith(ticketState: TicketFetching()));

    final result = await _useCase.fetchTickets();

    result.fold(
          (failure) {
        final error = TicketFetchError(failure.message, failure.statusCode);
        emit(state.copyWith(ticketState: error));
      },(success) {

         tickets = success?.map((e) => e?.toData()).whereType<TicketItemModel>().toList() ?? <TicketItemModel>[];

        final loaded = TicketFetched(tickets);

        debugPrint('loaded-tickets $tickets');

         Future.delayed(Duration(seconds: 1),(){
          emit(state.copyWith(ticketState: loaded));
         });

      },
    );
  }
}
