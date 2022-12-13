import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcentral_web_admin/core/platform/rest_client_service/rest_client_service.dart';
import 'package:petcentral_web_admin/features/auth/data/datasouces/auth_remote_datasource.dart';
import 'package:petcentral_web_admin/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:petcentral_web_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:petcentral_web_admin/features/auth/presentation/logic/cubit/login_cubit.dart';
import 'package:petcentral_web_admin/features/auth/presentation/logic/login_state.dart';
import 'package:sizer/sizer.dart';

import '../widget/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<RestClientService>(
            create: (context) => RestClientService.create(),
          ),
          RepositoryProvider<AuthRemoteDataSource>(
            create: (context) => AuthRemoteDataSourceImpl(
              RepositoryProvider.of<RestClientService>(context),
            ),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepositoryImpl(
              RepositoryProvider.of<AuthRemoteDataSource>(context),
            ),
          )
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(
              create: (context) => LoginCubit(
                RepositoryProvider.of<AuthRepository>(context),
              ),
            )
          ],
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/images/bg_landing_blue.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 30.h,
                              left: 12.w,
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/hand_pet_large.png',
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                    fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: LoginFormWidget(),
                      ),
                    ],
                  ),
                  if (state is LoadingLoginState)
                    Container(
                      color: Colors.white.withOpacity(0.3),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
