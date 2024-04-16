import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula_one_calendar/features/settings/cubit/settings_cubit.dart';
import 'package:formula_one_calendar/service/context_extension.dart';
import 'package:formula_one_calendar/shared_export.dart';
import 'package:formula_one_calendar/shell/cubit/home_screen_shell_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import '../../routes/go_router_config.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: appColors.lightBlue,
        elevation: 0,
      ),
      extendBodyBehindAppBar: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: appColors.lightBlue,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(Assets.newMenu),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    context.l10n.language,
                    style: appTextStyle.getQuicksand().copyWith(
                          color: appColors.white,
                          fontSize: 20,
                        ),
                  ),
                  const Gap(10),
                  const LanguageDropdown(),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text(
              //       context.l10n.theme,
              //     ),
              //     const Gap(10),
              //     const ThemeDropdown(),
              //   ],
              // ),
              const Spacer(),
              BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Text(
                    "${context.l10n.version}: ${state.version}+${state.buildNumber}",
                    style: appTextStyle.getQuicksand().copyWith(
                          color: appColors.white,
                          fontSize: 15,
                        ),
                  );
                },
              ),
              const Gap(32)
            ],
          ),
        ),
      ),
    );
  }
}

// class ThemeDropdown extends StatelessWidget {
//   const ThemeDropdown({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SettingsCubit, SettingsState>(
//       builder: (context, state) {
//         return DropdownButton<ThemeMode>(
//           iconEnabledColor: appColors.white,
//           elevation: 0,
//           onChanged: (ThemeMode? newValue) {
//             if (newValue != null) {
//               context.read<SettingsCubit>().changeMode(newValue);
//               context.replace(ScreenPaths.raceList);
//             }
//           },
//           value: context.watch<SettingsCubit>().state.themeMode,
//           items: [
//             DropdownMenuItem(
//               value: ThemeMode.light,
//               child: Text(
//                 context.l10n.theme_light,
//                 style: appTextStyle.getQuicksand().copyWith(color: appColors.white),
//               ),
//             ),
//             DropdownMenuItem(
//               value: ThemeMode.dark,
//               child: Text(
//                 context.l10n.theme_dark,
//                 style: appTextStyle.getQuicksand().copyWith(color: appColors.white),
//               ),
//             ),
//             DropdownMenuItem(
//               value: ThemeMode.system,
//               child: Text(
//                 context.l10n.theme_system,
//                 style: appTextStyle.getQuicksand().copyWith(color: appColors.white),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return DropdownButton<Locale>(
          dropdownColor: appColors.black,
          iconEnabledColor: appColors.black,
          elevation: 0,
          value: state.locale,
          onChanged: (Locale? newValue) {
            if (newValue != null) {
              context.read<SettingsCubit>().setLocale(newValue);
            }
          },
          items: [
            DropdownMenuItem(
              value: const Locale('en'),
              child: Text(
                context.l10n.language_en,
                style: appTextStyle.getQuicksand().copyWith(color: appColors.white),
              ),
            ),
            DropdownMenuItem(
              value: const Locale('it'),
              child: Text(
                context.l10n.language_it,
                style: appTextStyle.getQuicksand().copyWith(color: appColors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
