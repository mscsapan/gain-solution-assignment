import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/utils/constraints.dart';
import '/presentation/utils/utils.dart';

import '../../../data/models/contact/contact_item_model.dart';
import '../../cubit/contact/contact_cubit.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/fetch_error_text.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/page_refresh.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  late ContactCubit pointCubit;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  void _initState() {
    pointCubit = context.read<ContactCubit>();

    Future.microtask(()=>pointCubit.getContacts());

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Gain Solutions',isShowBackButton: false,isCenterText: false,),
      body: PageRefresh(
        onRefresh: () async => await pointCubit.getContacts(),
        child: BlocBuilder<ContactCubit, ContactItemModel>(
            builder: (context, service) {
              final state = service.contactState;
              if (state is ContactFetching) {
                return const LoadingWidget();
              } else if (state is ContactFetchError) {
                if (state.statusCode == 503) {
                  return LoadedContactView(contacts: pointCubit.searchContacts);
                } else {
                  return FetchErrorText(text: state.message);
                }
              } else if (state is ContactFetched) {
                return LoadedContactView(contacts: state.contacts);
              }
              if (pointCubit.searchContacts?.isNotEmpty??false) {
               return LoadedContactView(contacts: pointCubit.searchContacts);
              } else {
                return FetchErrorText(text: 'Something went wrong');
              }
            }

        ),
      ),
    );
  }
}

class LoadedContactView extends StatelessWidget {
  const LoadedContactView({super.key, required this.contacts});

  final List<ContactItemModel?> ? contacts;

  @override
  Widget build(BuildContext context) {
    final cCubit = context.read<ContactCubit>();
    return Padding(
      padding: Utils.symmetric(h: 16.0),
      child: Column(
        children: [
          TextFormField(
            onChanged: (val) => cCubit.searchContact(val),
            decoration: InputDecoration(
                hintText: 'Search contacts',
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                filled: true,
                fillColor: grayBackgroundColor,
                prefixIcon: Icon(Icons.search_outlined, color: blackColor,)
            ),
          ),
          CustomText(text: cCubit.state.id.toString()),

          if(cCubit.searchContacts?.isNotEmpty ?? false)...[
            Expanded(child: ListView.builder(
              itemCount: cCubit.searchContacts?.length,
              itemBuilder: (context, index) {
                final contactItem = cCubit.searchContacts?[index];
                return CustomText(
                    text: '${contactItem?.firstName} ${contactItem?.lastName}');
              },),),
          ] else
            ...[
              CustomText(text: 'No Contact found'),
            ]


        ],
      ),
    );
  }
}

