import 'package:fam/data/repo/card_repo.dart';
import 'package:fam/data/service/card_service.dart';
import 'package:fam/domain/big_card_cubit/big_card_cubit.dart';
import 'package:fam/domain/card_bloc/card_bloc.dart';
import 'package:fam/presentation/card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          //multi bloc provider passes instances of cubit and bloc to be used
          //by the widgets in the widget tree.
          providers: [
            BlocProvider(
              //Dependencies are injected manually,
              // dependency injection solutions such as get_it can be used to manage dependencies.
              create: (ctx) => CardBloc(repo: CardRepo(service: CardService())),
            ),
            BlocProvider(create: (ctx) => BigCardCubit())
          ],
          child: const CardView(),
        ));
  }
}
