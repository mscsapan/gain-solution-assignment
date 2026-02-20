import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gain_solution_task/presentation/utils/k_images.dart';
import 'package:gain_solution_task/presentation/utils/utils.dart';

import '../../../core/services/navigation_service.dart';
import '../../../data/models/ticket/ticket_item_model.dart';
import '../../cubit/ticket/ticket_cubit.dart';
import '../../routes/route_names.dart';
import '../../utils/constraints.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/fetch_error_text.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/page_refresh.dart';
import 'component/ticket_component.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  late TicketCubit pointCubit;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    pointCubit = context.read<TicketCubit>();

    //Future.microtask(()=>pointCubit.getPointHistory());

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Gain Solutions',
        isShowBackButton: false,
        isCenterText: false,
        actions: [notificationIcon()],
      ),
      body: PageRefresh(
        onRefresh: () async => await pointCubit.getTickets(),
        child: BlocBuilder<TicketCubit, TicketItemModel>(
            builder: (context, service) {
              final state = service.ticketState;
              if (state is TicketFetching) {
                return const LoadingWidget();
              } else if (state is TicketFetchError) {
                if (state.statusCode == 503) {
                  return LoadedTicketView(tickets: pointCubit.tickets);
                } else {
                  return FetchErrorText(text: state.message);
                }
              } else if (state is TicketFetched) {
                return LoadedTicketView(tickets: state.tickets);
              }
              if (pointCubit.tickets?.isNotEmpty??false) {
                return LoadedTicketView(tickets: pointCubit.tickets);
              } else {
                return FetchErrorText(text: 'Something went wrong');
              }
            }

        ),
      ),
    );
  }
}

class LoadedTicketView extends StatelessWidget {
  const LoadedTicketView({super.key, required this.tickets});

  final List<TicketItemModel?> ? tickets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: '${tickets?.length} tickets',fontWeight: FontWeight.w500,color: textRegular,letterSpacing:0.5),
              GestureDetector(
                  onTap: (){
                    NavigationService.navigateTo(RouteNames.filterScreen);
                  },
                  child: Icon(Icons.filter_alt_outlined,size: 24.0,color: blackColor)),
            ],
          ),
          Utils.verticalSpace(8.0),
          Expanded(
            child: ListView.builder(
              itemCount: tickets?.length,
              padding: Utils.only(bottom: Utils.mediaQuery(context).height * 0.05),
              itemBuilder: (context, index) {
                final ticketItem = tickets?[index];
                return TicketComponent(ticketItem:ticketItem,index: index);
              },),
          ),
        ],
      ),
    );
  }
}


Widget notificationIcon(){
  return Padding(
    padding: Utils.symmetric(h: 16.0),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        CustomImage(path: KImages.notificationIcon),
        Positioned(
          top: -8.0,
          right: -5.0,
          child: Container(
            padding: Utils.all(value: 5.0),
            decoration: BoxDecoration(
              color: redColor,
              shape: BoxShape.circle,
            ),
            child: CustomText(text: '3',fontWeight: FontWeight.w500,fontSize: 10.0,color: whiteColor,),
          ),
        ),
      ],
    ),
  );
}

