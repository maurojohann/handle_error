import 'package:erros_handle/feature/presantation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            List<Widget> widgt = [];

            if (state is HomeLoadingState) {
              widgt.add(Center(child: CircularProgressIndicator()));
            }
            if (state is HomeLoadedState) {
              widgt.add(
                Table(
                  children: [
                    TableRow(children: [Text(state.user.title)]),
                  ],
                ),
              );
            }
            widgt.add(ElevatedButton(
                onPressed: () {
                  context.read<HomeCubit>().getUserData();
                },
                child: const Text('Buscar Usuario')));
            return Column(
              children: widgt,
            );
          },
        ),
      ),
    );
  }
}
