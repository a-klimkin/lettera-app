import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/route/app_router.gr.dart';
import '../../logic/main_cubit/cubit.dart';
import '../widgets/_index.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolBar.main(
        onDownload: () => context.router.push(const DownloadRoute()),
        onSettings: () => context.router.push(const SettingsRoute()),
      ),
      body: AppBodyContainer(
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => context.read<MainCubit>().onChangeValue(value),
            ),
          ),
          const AppDivider(),
          BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
              return Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 82,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => DisplayValueField(
                    type: state.fields[index],
                    value: state.valueByFieldType(state.fields[index]),
                  ),
                  itemCount: state.fields.length,
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}

