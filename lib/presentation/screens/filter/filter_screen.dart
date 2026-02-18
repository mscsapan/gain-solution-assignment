import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/navigation_service.dart';
import '../../../data/models/filter/filter_item_model.dart';
import '../../../data/models/filter/filter_model.dart';
import '../../cubit/filter/filter_cubit.dart';
import '../../utils/constraints.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/fetch_error_text.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/page_refresh.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  late FilterCubit filterCubit;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    filterCubit = context.read<FilterCubit>();

    Future.microtask(()=>filterCubit.getFilterData());

  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () => NavigationService.goBack(),
          icon: Icon(Icons.clear, size: 24.0, color: blackColor),
        ),
        centerTitle: false,
        title: CustomText(
          text: 'Filter',
          fontWeight: FontWeight.w600,
          color: blackColor,
          fontSize: 16.0,
        ),
        actions: [
          Padding(
            padding: Utils.symmetric(),
            child: CustomText(
              text: 'Apply',
              fontWeight: FontWeight.w600,
              color: textLight,
            ),
          ),
        ],
      ),

      body: PageRefresh(
        onRefresh: () async {
          // contactCubit.searchContacts?.clear();
          await filterCubit.getFilterData();
        },
        child: BlocBuilder<FilterCubit, FilterModel>(
            builder: (context, service) {
              final state = service.filterState;
              if (state is FilterFetching) {
                return const LoadingWidget();
              } else if (state is FilterFetchError) {
                if (state.statusCode == 503) {
                  return LoadedFilterData(filters: filterCubit.filterData);
                } else {
                  return FetchErrorText(text: state.message);
                }
              } else if (state is FilterFetched) {
                return LoadedFilterData(filters: state.filterData);
              }
              if (filterCubit.filterData != null) {
                return LoadedFilterData(filters: filterCubit.filterData);
              } else {
                return FetchErrorText(text: 'Something went wrong');
              }
            }

        ),
      ),
    );
  }
}

class LoadedFilterData extends StatelessWidget {
  const LoadedFilterData({super.key, required this.filters});
  final FilterItemModel ? filters;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ...List.generate(filters?.length??0, (index){
        //   final item = filters?[index];
        //   return Padding(
        //     padding: Utils.symmetric(v: 4.0,h: 0.0),
        //
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Expanded(
        //           child: CustomText(text: item,fontSize: 16.0,fontWeight: FontWeight.w400,color: blackColor),
        //         ),
        //
        //         Transform.scale(
        //           scale: 1.2,
        //           child: Checkbox(
        //             value: state.filterModel?.tags?.contains(item),
        //             activeColor: primaryColor,
        //             side: BorderSide(color: const Color(0xFFE7E7E7)),
        //             onChanged: (val) {
        //               if (val == null) return;
        //
        //               final sizes = List<String>.from(state.filterModel?.tags ?? const <String>[]);
        //
        //               final tag = item;
        //
        //               if (val) {
        //                 if (!sizes.contains(tag)) sizes.add(tag);
        //               } else {
        //                 sizes.remove(tag);
        //               }
        //
        //               productCubit.addFilterInfo((e) => e.copyWith(tags: sizes));
        //             },
        //             visualDensity: const VisualDensity(
        //               horizontal: -4.0,
        //               vertical: -4.0,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   );
        // })
      ],
    );
  }
}

