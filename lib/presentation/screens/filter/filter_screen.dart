import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gain_solution_task/presentation/utils/k_images.dart';
import 'package:gain_solution_task/presentation/widgets/circle_image.dart';
import '../../../core/services/navigation_service.dart';
import '../../../data/models/filter/filter_item_model.dart';
import '../../../data/models/filter/filter_model.dart';
import '../../cubit/filter/filter_cubit.dart';
import '../../utils/constraints.dart';
import '../../utils/utils.dart';
import '../../widgets/custom_dropdown_button.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_search_field.dart';
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

    Future.microtask(()=>filterCubit..randomFilter()..getFilterData());

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

class LoadedFilterData extends StatefulWidget {
  const LoadedFilterData({super.key, required this.filters});
  final FilterItemModel ? filters;

  @override
  State<LoadedFilterData> createState() => _LoadedFilterDataState();
}

class _LoadedFilterDataState extends State<LoadedFilterData> {


  late FilterCubit filterCubit;
  late FilterItemModel ? filters;
  String ? _priority;

  late double startPrice;
  late double endPrice;

  late RangeValues priceRangeValue;
  late RangeLabels labels;

  late double initialPrice;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    filterCubit = context.read<FilterCubit>();
    filters = widget.filters;


    if(filters?.prices != null){
      startPrice = filters?.prices?.minPrice ?? 0.0;
      endPrice = filters?.prices?.maxPrice ?? 0.0;
    }else{
      startPrice = 0.0;
      endPrice =  0.0;
    }

    initialPrice = endPrice;

    priceRangeValue = RangeValues(0, endPrice);
    labels = RangeLabels(startPrice.round().toString(), endPrice.round().toString());

    filterCubit.addFilterInfo((item)=>item.copyWith(minPrice: startPrice,maxPrice: endPrice));
  }



  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Utils.symmetric().copyWith(bottom: Utils.mediaQuery(context).height * 0.05),
      children: [
        _titleText(filters?.brands?.label),
        ...List.generate(filters?.brands?.options?.length??0, (index){
          final item = filters?.brands?.options?[index]?['value']?? '';

          void toggleBrand(String tag) {

            final brands = List<String>.from(filterCubit.state.filter?.brands ?? const <String>[]);

            if (brands.contains(tag)) {
              brands.remove(tag);
            } else {
              brands.add(tag);
            }

            filterCubit.addFilterInfo((e) => e.copyWith(brands: brands));
          }

          return Padding(
            padding: Utils.symmetric(v: 4.0,h: 0.0),
            child: InkWell(
              onTap: () => toggleBrand(item),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Checkbox(
                      value: filterCubit.state.filter?.brands?.contains(item) ?? false,
                      onChanged: (_) => toggleBrand(item),
                      // visualDensity: const VisualDensity(
                      //   // horizontal: -2.0,
                      //   vertical: -4.0,
                      // ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                    spacing: 4.0,
                    children: [
                      CircleImage(image: KImages.gainLogo, size: 28.0),
                      CustomText(text: item,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: textBorderRegular,),
                    ],
                  ),),

                ],
              ),
            )
            ,
          );
        }),
        Utils.verticalSpace(16.0),

          _titleText(filters?.priority?.label),
          Utils.verticalSpace(8.0),
          CustomDropdownButton<String?>(
            value: _priority,
            hintText: "priority",
            items:  filters?.priority?.options
                ?.map((e) => e?['value']?.toString() ?? '')
                .toList() ??[],
            onChanged: (value) {
            },
            itemBuilder: (item) => CustomText(text: item??'',fontWeight: FontWeight.w500,fontSize: 14.0), // Customize item display
          ),
          Utils.verticalSpace(16.0),


        if(filterCubit.state.randomizedTexts.contains('Status'))...[
          _titleText(filters?.status?.label),
          Utils.verticalSpace(8.0),

          RadioGroup<String>(
            groupValue: filterCubit.state.filter?.status,
            onChanged: (value) {
              if (value != null) {
                filterCubit.addFilterInfo((e) => e.copyWith(status: value));
              }
            },
            child: Wrap(
              spacing: 10.0,
              alignment: WrapAlignment.spaceEvenly,
              children: List.generate(
                filters?.status?.options?.length ?? 0,
                    (index) {
                  final item = filters?.status?.options?[index]?['value']?.toString() ?? '';

                  return GestureDetector(
                    onTap: () {
                      filterCubit.addFilterInfo((e) => e.copyWith(status: item));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Transform.scale(
                          scale: 1.0,
                          child: Radio<String>(value: item,activeColor: greenColor,visualDensity: const VisualDensity(
                            horizontal: -2.0,
                            vertical: -2.0,
                          ),),
                        ),
                        CustomText(
                          text: item,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: textBorderRegular,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Utils.verticalSpace(16.0),
        ],


        /*Wrap(
          spacing: 8,
          children: List.generate(
            filters?.status?.options?.length ?? 0,
                (index) {
              final item =
                  filters?.status?.options?[index]?['value']?.toString() ?? '';

              final selected = filterCubit.state.filter?.status == item;

              return ChoiceChip(
                label: Text(item),
                selected: selected,
                onSelected: (_) {
                  filterCubit.addFilterInfo((e) => e.copyWith(status: item));
                },
              );
            },
          ),
        ),*/
        if(filterCubit.state.randomizedTexts.contains('Price'))...[
          _titleText(filters?.prices?.label),
          Utils.verticalSpace(8.0),
          CustomText(
            text: '${Utils.formatAmount(context, startPrice,1)} - ${Utils.formatAmount(context, endPrice,1)}',
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: blackColor,
          ),
          RangeSlider(
            values: priceRangeValue,
            min: 0,
            // max: productCubit.filter?.prices?.isNotEmpty??false?productCubit.filter?.prices?.last??0.0 : 0.0,
            max: initialPrice,
            activeColor: primaryColor,
            inactiveColor: scaffoldBgColor,
            labels: labels,
            onChanged: (RangeValues values) {

              priceRangeValue = values;

              startPrice = double.parse(values.start.round().toString());

              endPrice = double.parse(values.end.round().toString());

              filterCubit.addFilterInfo((item)=>item.copyWith(minPrice: startPrice,maxPrice: endPrice));
            },
          ),
          Utils.verticalSpace(16.0),
        ],


        _titleText(filters?.tags?.label),
        Utils.verticalSpace(8.0),
        CustomSearchField(  hintText: 'Search tags',onChanged: (val) => filterCubit.searchTag(val)),
        Utils.verticalSpace(12.0),
        Wrap(
          runSpacing: 10.0,
          spacing: 10.0,
          children: List.generate(filterCubit.state.tags?.length??0, (index){
            final tag = filterCubit.state.tags?[index]?? '';

            final isSelected = filterCubit.state.filter?.selectedTags?.any((e)=>e == tag) ?? false;

            return InkWell(
              onTap: (){

                  final brands = List<String>.from(filterCubit.state.filter?.selectedTags ?? const <String>[]);

                  if (brands.contains(tag)) {
                    brands.remove(tag);
                  } else {
                    brands.add(tag);
                  }

                  filterCubit.addFilterInfo((e) => e.copyWith(selectedTags: brands));

              },
              child: Container(
                padding: Utils.symmetric(h: 12.0,v: 6.0),
                decoration: BoxDecoration(
                  color: isSelected ? greenColor :whiteColor,
                  borderRadius: Utils.borderRadius(r: 8.0),
                  border: Border.all(color: isSelected ?transparent:cardBorderColor),
                ),
                child:CustomText(text: Utils.capitalizeFirstLetter(tag),color: isSelected?whiteColor :textRegular,fontSize: 12.0,fontWeight: FontWeight.w500,),
              ),
            );
          }),
        ),

      ],
    );
  }

  Widget _titleText(String ? text){
    return CustomText(text: text??'' ,fontSize: 16.0,fontWeight: FontWeight.w600,color: blackColor);

  }
}



