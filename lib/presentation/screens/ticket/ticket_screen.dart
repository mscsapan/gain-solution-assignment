import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/ticket/ticket_item_model.dart';
import '../../cubit/ticket/ticket_cubit.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/fetch_error_text.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/page_refresh.dart';

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

    Future.microtask(()=>pointCubit.getPointHistory());

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Rewards'),
      body: PageRefresh(
        onRefresh: () async => await pointCubit.getPointHistory(),
        child: BlocConsumer<TicketCubit, TicketItemModel>(
            listener: (context, service) {},
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
    return ListView.builder(
      itemCount: tickets?.length,
      itemBuilder: (context, index) {
        final ticketItem = tickets?[index];
        return CustomText(text: ticketItem?.customer ?? '');
      },);
  }
}

