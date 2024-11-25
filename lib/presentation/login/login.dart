import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/constant.dart';
import '../../app/di.dart';
import '../../app/extensions.dart';
import '../../shared/shared.dart';
import '../base/base_state.dart';
import 'bloc/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  final LoginBloc _bloc = instance<LoginBloc>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _userNameController.addListener(
        () => _bloc.add(ChangeUserNameEvent(_userNameController.text)));
    _passwordController.addListener(
        () => _bloc.add(ChangePasswordEvent(_passwordController.text)));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: _bloc,
        listener: (context, state) {
          switch (state.status) {
            case BlocStatus.loading:
              widgetUtil.showPopUp(context: context);
              return;
            case BlocStatus.success:
              // TODO(Hoang): Navigate to home screen
              return;
            case BlocStatus.failed:
              widgetUtil.showPopUp(
                  context: context,
                  stateRendererType: StateRendererType.POPUP_ERROR_STATE,
                  title: 'Error',
                  message: state.errorMessage ?? EMPTY);
            default:
              widgetUtil.dismissDialog(context);
              return;
          }
        },
        builder: (context, state) {
          return Container(
              padding: const EdgeInsets.only(top: AppPadding.p100),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Image(image: AssetImage(ImageAssets.splashLogo)),
                      const SizedBox(height: AppSize.s28),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                              hintText: AppStrings.username.tr(),
                              labelText: AppStrings.username.tr(),
                              errorText: state.status == BlocStatus.failed &&
                                      !state.isValidatedUserName
                                  ? AppStrings.usernameError.tr()
                                  : null),
                        ),
                      ),
                      const SizedBox(height: AppSize.s28),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28, right: AppPadding.p28),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              hintText: AppStrings.password.tr(),
                              labelText: AppStrings.password.tr(),
                              errorText: state.status == BlocStatus.failed &&
                                      !state.isValidatedPassWord
                                  ? AppStrings.passwordError.tr()
                                  : null),
                        ),
                      ),
                      const SizedBox(height: AppSize.s28),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: AppPadding.p28, right: AppPadding.p28),
                          child: SizedBox(
                            width: double.infinity,
                            height: AppSize.s40,
                            child: ElevatedButton(
                                onPressed: state.isValidatedAll
                                    ? () {
                                        _bloc.add(RequestLoginEvent());
                                      }
                                    : null,
                                child: Text(AppStrings.login.tr())),
                          )),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
