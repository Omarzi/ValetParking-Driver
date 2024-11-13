import 'package:valetparking_driver/features/home/manager/home_cubit.dart';
import 'package:valetparking_driver/utils/constants/exports.dart';

class AddNewUserScreen extends StatefulWidget {
  const AddNewUserScreen({super.key});

  @override
  State<AddNewUserScreen> createState() => _AddNewUserScreenState();
}

class _AddNewUserScreenState extends State<AddNewUserScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  bool isEmailFieldFocused = false;
  bool isPasswordFieldFocused = false;
  bool isPass = true;
  bool isPhoneFieldFocused = false;

  @override
  void initState() {
    super.initState();

    /// Add listener to focus node
    emailFocusNode.addListener(
        () => setState(() => isEmailFieldFocused = emailFocusNode.hasFocus));
    phoneFocusNode.addListener(
            () => setState(() => isPhoneFieldFocused = phoneFocusNode.hasFocus));
    passwordFocusNode.addListener(() =>
        setState(() => isPasswordFieldFocused = passwordFocusNode.hasFocus));
  }

  @override
  void dispose() {
    /// Clean up the focus node and controller when the widget is disposed.
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateAndNavigate(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty) {
      FloatingSnackBar.show(
        context: context,
        message: 'You must fill out this field',
        textColor: Colors.white,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: VColors.error,
      );
    } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
        .hasMatch(email)) {
      FloatingSnackBar.show(
        context: context,
        message: 'You must fill this field in valid ex: example@gmail.com',
        textColor: Colors.white,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: VColors.error,
      );
    } else if (password.isEmpty) {
      FloatingSnackBar.show(
        context: context,
        message: 'Password cannot be empty',
        textColor: Colors.white,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: VColors.error,
      );
    } else {
      logSuccess(emailController.text);
      logSuccess(passwordController.text);

      context.pushNamed(VRoutesName.choiceYourPassenger, arguments: {
        'emailAddress': emailController.text,
        'password': passwordController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddNewUserSuccessState) {
            logSuccess(emailController.text);
            logSuccess(passwordController.text);

            context.pushNamed(VRoutesName.choiceYourPassenger, arguments: {
              'emailAddress': emailController.text,
              'password': passwordController.text,
              'userId': VCacheHelper.getString(key: CacheKeys.userId),
            });



            FloatingSnackBar.show(
              context: context,
              message: '${AppLocalizations.of(context)!.translate('userSuccessfullyAdded')}',
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.success,
            );
          } else if (state is AddNewUserErrorState) {
            FloatingSnackBar.show(
              context: context,
              message: state.message!,
              textColor: Colors.white,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: VColors.error,
            );
          }
        },
        builder: (context, state) {
          var addNewUser = HomeCubit.get(context);

          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: VColors.whiteColor,
                  title: Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: Text(
                      AppLocalizations.of(context)!.translate('addNewUser')!,
                      style: VStyles.h4Bold(context),
                    ),
                  ),
                  floating: true,
                  pinned: true,
                  flexibleSpace: Container(
                    color: VColors.whiteColor,
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${AppLocalizations.of(context)!.translate('createToNewUserAccount')}',
                      style: VStyles.h1Bold(context),
                    ),
                    SizedBox(height: 48.h),

                    /// Phone Number
                    TextFormFieldWidget(
                      controller: phoneController,
                      textInputType: TextInputType.phone,
                      focusNode: phoneFocusNode,
                      hintText:
                      AppLocalizations.of(context)!.translate('phoneNumber')!,
                      hintColor: isPhoneFieldFocused
                          ? VColors.primaryColor500
                          : VColors.greyScale500,
                      prefixIcon: SvgPicture.asset(VImages.phoneIcon,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              isPhoneFieldFocused
                                  ? VColors.primaryColor500
                                  : phoneController.text.isNotEmpty
                                  ? VColors.greyScale900
                                  : VColors.greyScale500,
                              BlendMode.srcIn)),
                      fillColor: isPhoneFieldFocused
                          ? VColors.purpleTransparent.withOpacity(.08)
                          : VColors.greyScale50,
                      borderSide: isPhoneFieldFocused
                          ? BorderSide(color: VColors.primaryColor500)
                          : BorderSide.none,
                      obscureText: false,
                      validator: (value) =>
                          VFormatter.formatPhoneNumber(value, '+2'),
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),

                    /// Password
                    TextFormFieldWidget(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      focusNode: passwordFocusNode,
                      hintText:
                          AppLocalizations.of(context)!.translate('password')!,
                      hintColor: isPasswordFieldFocused
                          ? VColors.primaryColor500
                          : VColors.greyScale500,
                      prefixIcon: SvgPicture.asset(VImages.passwordIcon,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              isPasswordFieldFocused
                                  ? VColors.primaryColor500
                                  : passwordController.text.isNotEmpty
                                      ? VColors.greyScale900
                                      : VColors.greyScale500,
                              BlendMode.srcIn)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() => isPass = !isPass);
                        },
                        child: SvgPicture.asset(
                            isPass ? VImages.eyeHideIcon : VImages.eyeShowIcon,
                            fit: BoxFit.scaleDown,
                            colorFilter: ColorFilter.mode(
                                isPasswordFieldFocused
                                    ? VColors.primaryColor500
                                    : passwordController.text.isNotEmpty
                                        ? VColors.greyScale900
                                        : VColors.greyScale500,
                                BlendMode.srcIn)),
                      ),
                      fillColor: isPasswordFieldFocused
                          ? VColors.purpleTransparent.withOpacity(.08)
                          : VColors.greyScale50,
                      borderSide: isPasswordFieldFocused
                          ? BorderSide(color: VColors.primaryColor500)
                          : BorderSide.none,
                      obscureText: isPass,
                      obscureCharacter: '●',
                      maxLines: 1,
                    ),

                    /// Make Space
                    SizedBox(height: 48.h),

                    /// Sign in Button
                    MainButtonWidget(
                      centerWidgetInButton: state is AddNewUserLoadingState
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              AppLocalizations.of(context)!
                                  .translate('continue')!,
                              style: VStyles.bodyLargeBold(context)
                                  .copyWith(color: VColors.whiteColor)),
                      onTap: () {
                        // validateAndNavigate(context);
                        String phone = phoneController.text;
                        String password = passwordController.text;

                        if (phone.isEmpty || phoneController.text.length != 8) {
                        FloatingSnackBar.show(
                        context: context,
                        message: '${AppLocalizations.of(context)!.translate('enterAvALIDnUMBER')}',
                        textColor: Colors.white,
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: VColors.error,
                        );
                        } else {
                          addNewUser.addNewUserFunction(
                            phone: phoneController.text,
                            password: passwordController.text,
                          );

                          // userId = addNewUser.addNewUserResponseModel.userData!.userId!;
                        }
                      },
                      margin: EdgeInsets.zero,
                      buttonColor: emailController.text.isEmpty ||
                              passwordController.text.isEmpty
                          ? VColors.disabledButton
                          : VColors.primaryColor500,
                      boxShadow: emailController.text.isEmpty ||
                              passwordController.text.isEmpty
                          ? []
                          : [AppBoxShadows.buttonShadowOne],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
