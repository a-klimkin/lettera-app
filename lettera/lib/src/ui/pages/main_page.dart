import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/constants.dart';
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
      body: Column(
        children: [
           Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => context.read<MainCubit>().onChangeValue(value),
            ),
          ),
          const AppDivider(indent: mainPadding),
          BlocBuilder<MainCubit, MainState>(
            builder: (context, state) {
              return Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    if (state.checkLatinLetters) ...[
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                        sliver: SliverToBoxAdapter(
                          child: NonLatinLettersField(
                            definedTextList: state.nonLatinLetters,
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: AppDivider(indent: mainPadding),
                      ),
                    ],
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: mainPadding),
                      sliver: SliverGrid.builder(
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
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 24.0),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
