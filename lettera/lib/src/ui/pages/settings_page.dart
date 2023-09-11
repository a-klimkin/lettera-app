import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../logic/main_cubit/cubit.dart';
import '../../logic/settings_cubit/cubit.dart';
import '../../logic/theme_cubit/cubit.dart';
import '../widgets/_index.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  static const String path = '/settings';
  static TitleBuilder title = (context, data) => 'Settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsCubit settings = context.read<SettingsCubit>();
    MainCubit main = context.read<MainCubit>();

    return Scaffold(
      appBar: AppToolBar(),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) => state.status.mapOrNull(
          fieldsChanged: () => main.initFields(state.fields),
          parserChanged: () => main.setupSettings(
                fromCamelCase: state.parseFromCamelCase,
                fromSnakeCase: state.parseFromSnakeCase,
                checkLatinLetters: state.checkLatinLetters,
              ),
        ),
        builder: (context, state) {
          return AppBodyContainer(
            children: [
              const AppNavigationRow('Settings'),
              Row(
                children: [
                  Expanded(
                    child: ParseSetupSettingsComponent(
                      fromCamelCase: state.parseFromCamelCase,
                      fromFromCase: state.parseFromSnakeCase,
                      changeFromSnakeCase: settings.changeFromSnakeCase,
                      changeFromCamelCase: settings.changeFromCamelCase,
                    ),
                  ),
                  Expanded(
                    child: LanguageAnalyserSettingsComponent(
                      checkLatinLetters: state.checkLatinLetters,
                      onCheckLatinChanged: settings.onCheckLatinChanged,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: AppSwitch(
                        label: 'Dark Theme',
                        value: Theme.of(context).brightness == Brightness.dark,
                        onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                      ),
                    ),
                  ),
                ],
              ),
              const AppDivider(),
              Expanded(
                child: ReorderableGridView.builder(
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 94,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) {
                    final field = state.fields[index];

                    return DraggableValueField(
                      key: ValueKey(field.type.name),
                      fieldProperties: field,
                      onVisibleChange: () => settings.changeFieldVisible(field),
                    );
                  },
                  itemCount: state.fields.length,
                  onReorder: settings.changeFieldPosition,
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
