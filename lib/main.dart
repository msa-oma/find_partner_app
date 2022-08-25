import 'package:find_partner_app/features/cities/presentation/bloc/cities/cities_bloc.dart';
import 'package:find_partner_app/features/registeration/presentation/bloc_r/login_bloc/login_bloc.dart';
import 'package:find_partner_app/features/registeration/presentation/pages_r/register_page.dart';
import 'package:find_partner_app/notification_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'features/registeration/presentation/bloc_r/register_bloc/register_bloc.dart';
import 'features/registeration/presentation/pages_r/login_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<CitiesBloc>()..add(GetAllcitiesEvent())),
          BlocProvider(
              create: (_) =>
                  di.sl<RegisterBloc>()..add(GetAllCountriesEvent())),
          BlocProvider(create: (_) => di.sl<LoginBloc>()),
        ],
        child: OverlaySupport(
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const NotificationTestPage(),
          ),
        ));
  }
}
