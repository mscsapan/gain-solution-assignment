import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependency_injection_packages.dart';


class DependencyInjector {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> initDB() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProvider = <RepositoryProvider>[
    // Core dependencies
    RepositoryProvider<Client>(
      create: (context) => Client(),
    ),
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),

    // Data sources
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImpl(
        client: context.read(),
      ),
    ),
    RepositoryProvider<LocalDataSource>(
      create: (context) => LocalDataSourceImpl(
        sharedPreferences: context.read(),
      ),
    ),

    // Repository implementations
    RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(
        remoteDataSources: context.read(),
        localDataSources: context.read(),
      ),
    ),
    RepositoryProvider<SettingRepository>(
      create: (context) => SettingRepositoryImpl(
        remoteDataSources: context.read(),
        localDataSources: context.read(),
      ),
    ),

    RepositoryProvider<TicketRepository>(
      create: (context) => TicketRepositoryImpl(
        remoteDataSources: context.read(),
      ),
    ),

    RepositoryProvider<ContactRepository>(
      create: (context) => ContactRepositoryImpl(
        remoteDataSources: context.read(),
      ),
    ),

    RepositoryProvider<FilterRepository>(
      create: (context) => FilterRepositoryImpl(
        remoteDataSources: context.read(),
      ),
    ),

    // Combined Auth Use Cases
    RepositoryProvider<AuthUseCases>(
      create: (context) => AuthUseCases.create(context.read<AuthRepository>()),
    ),
    RepositoryProvider<GetSettingUseCase>(
      create: (context) => GetSettingUseCase(context.read<SettingRepository>()),
    ),

    RepositoryProvider<TicketUseCases>(
      create: (context) => TicketUseCases.create(context.read<TicketRepository>()),
    ),
    RepositoryProvider<ContactUseCases>(
      create: (context) => ContactUseCases.create(context.read<ContactRepository>()),
    ),
    RepositoryProvider<FilterUseCases>(
      create: (context) => FilterUseCases.create(context.read<FilterRepository>()),
    ),
  ];

  static final blocProviders = <BlocProvider>[
    BlocProvider<InternetStatusBloc>(
      create: (context) => InternetStatusBloc(),
    ),
    BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(
        authUseCases: context.read<AuthUseCases>(),
      ),
    ),
    BlocProvider<SettingCubit>(
      create: (BuildContext context) => SettingCubit(
        getSettingUseCase: context.read<GetSettingUseCase>(),
      ),
    ),

    BlocProvider<TicketCubit>(
      create: (BuildContext context) => TicketCubit(
        useCase: context.read<TicketUseCases>(),
      ),
    ),
    BlocProvider<ContactCubit>(
      create: (BuildContext context) => ContactCubit(
        useCase: context.read<ContactUseCases>(),
      ),
    ),
    BlocProvider<FilterCubit>(
      create: (BuildContext context) => FilterCubit(
        useCase: context.read<FilterUseCases>(),
      ),
    ),
  ];
}
