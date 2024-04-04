import 'package:formula_one_calendar/network/constructor_repository.dart';
import 'package:formula_one_calendar/network/driver_repository.dart';
import 'package:formula_one_calendar/network/race_repository.dart';
import 'package:formula_one_calendar/network/result_repository.dart';
import 'package:formula_one_calendar/service/context_service.dart';
import 'package:formula_one_calendar/theme/app_colors.dart';
import 'package:formula_one_calendar/theme/app_text_styles.dart';
import 'package:get_it/get_it.dart';

ContextService get contextService => GetIt.I.get<ContextService>();

RaceRepository get raceRepository => GetIt.I.get<RaceRepository>();

ConstructorRepository get constructorRepository => GetIt.I.get<ConstructorRepository>();

DriverRepository get driverRepository => GetIt.I.get<DriverRepository>();

ResultRepository get resultRepository => GetIt.I.get<ResultRepository>();

AppTextStyle get appTextStyle => GetIt.I.get<AppTextStyle>();

AppColors get appColors => GetIt.I.get<AppColors>();
