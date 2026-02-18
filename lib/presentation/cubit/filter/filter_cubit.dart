
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/mappers/filter/filter_item_mapper.dart';
import '../../../data/models/filter/filter_item_model.dart';
import '../../../data/models/filter/filter_model.dart';
import '../../../domain/usecases/filter/filter_usecases.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterModel> {

  final FilterUseCases _useCase;

  FilterCubit({required FilterUseCases useCase})
      : _useCase = useCase,
        super(FilterModel());

  FilterItemModel? filterData;

  void addFilterInfo(FilterModel Function(FilterModel existing) updateFn) {
    final existing = state.filter ?? FilterModel();
    final updated = updateFn(existing);
    emit(state.copyWith(filter: updated));
  }

  Future<void> getFilterData() async {
    emit(state.copyWith(filterState: FilterFetching()));

    final result = await _useCase.fetchFilters();

    result.fold(
          (failure) {
        final error = FilterFetchError(failure.message, failure.statusCode);
        emit(state.copyWith(filterState: error));
      },
          (success) {
          filterData = success?.toData();

          final loaded = FilterFetched(filterData);

          debugPrint('loaded-filters $filterData');

          final options = filterData?.brands?.options?.map((e)=>e?['value']).toList();

          debugPrint('options $options');

          Future.delayed(Duration(seconds: 1), () {
            emit(state.copyWith(filterState: loaded));
          });
      },
    );
  }

}
