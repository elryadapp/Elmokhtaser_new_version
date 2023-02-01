import 'package:elmokhtasar/core/app_cubit/app_cubit.dart';
import 'package:elmokhtasar/features/auth/login/login_cubit/login_cubit.dart';
import 'package:elmokhtasar/features/auth/register/register_cubit/register_cubit.dart';
import 'package:elmokhtasar/features/auth/terms_and_conditions/cubit/terms_cubit.dart';
import 'package:elmokhtasar/features/auth/verification/verification_cubit/verification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<VerificationCubit>(
          create: (context) => VerificationCubit(),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<TermsCubit>(
          create: (context) => TermsCubit(),
        ),
      ];
}
