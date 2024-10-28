import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kouple_app/app/controllers/password_visibilty_controller.dart';
import 'package:kouple_app/app/models/auth_state.dart';
import 'package:kouple_app/app/providers/auth_providers.dart';
import 'package:kouple_app/app/routes/app_routes_constants.dart';
import 'package:kouple_app/app/src/views/login_screen.dart';
import 'package:kouple_app/app/util/app_color.dart';
import 'package:kouple_app/app/util/app_padding.dart';
import 'package:kouple_app/app/util/app_spacing.dart';
import 'package:kouple_app/app/util/app_text.dart';
import 'package:kouple_app/app/util/image_icon.dart';
import 'package:kouple_app/app/util/sizeconfig.dart';
import 'package:kouple_app/app/util/svg_assets.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNamecontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    userNamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordObscure = ref.watch(visibilityprovider);

    ref.listen<AuthenticationState>(authControllerProvider, (previous, next) {
      if (next is AuthstateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.message),
          behavior: SnackBarBehavior.floating,
        ));
      } else if (next is AuthstateSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('your acccount has been created'),
            behavior: SnackBarBehavior.floating));
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SymetricPadding(
            h: 15,
            v: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSpacing(v: 30),
                SvgAssets(
                  svg: logo,
                  height: SizeConfig.fromDesignHeight(context, 25),
                ),
                const AppSpacing(v: 100),
                ApptexBold(data: 'Sign Up', fontsize: 25),
                AppText(
                    data: ' Create an account to enjoy kouple', fontsize: 12),
                const AppSpacing(v: 10),
                //username
                ApptexBold(data: 'username', fontsize: 16),
                AuthTextfield(
                  controller: userNamecontroller,
                  keyboardtype: TextInputType.name,
                  obscuretext: false,
                  hint: 'username',
                ),
                const AppSpacing(v: 10),
                //email
                ApptexBold(data: 'Email', fontsize: 16),
                const AppSpacing(v: 5),
                AuthTextfield(
                  controller: emailcontroller,
                  keyboardtype: TextInputType.emailAddress,
                  obscuretext: false,
                  hint: 'Email',
                ),
                const AppSpacing(v: 10),
                //password
                ApptexBold(data: 'Password', fontsize: 16),
                const AppSpacing(v: 5),
                AuthTextfield(
                  controller: passwordController,
                  suffixIcon: InkWell(
                      onTap: () {
                        ref.watch(visibilityprovider.notifier).toggle();
                      },
                      child: passwordObscure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  obscuretext: passwordObscure,
                  hint: 'Password',
                ),
                const AppSpacing(v: 40),

                //submit button
                ButtonLarge(
                  isloading:
                      ref.watch(authControllerProvider) is AuthstateLoding,
                  label: 'Sign Up',
                  onTap: ref.watch(authControllerProvider) is AuthstateLoding
                      ? null
                      : () {
                          Future.delayed(const Duration(milliseconds: 1000),
                              () {
                            ref.read(authControllerProvider.notifier).signUp(
                                emailcontroller.text,
                                passwordController.text,
                                userNamecontroller.text);
                          });
                        },
                ),
                const AppSpacing(v: 20),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account?",
                            style: GoogleFonts.montserrat(
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                        const WidgetSpan(
                            child: AppSpacing(
                          h: 5,
                        )),
                        TextSpan(
                            text: "Sign In",
                            style: GoogleFonts.montserrat(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoutesConstants.login);
                              }),
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
