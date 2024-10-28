import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kouple_app/app/controllers/password_visibilty_controller.dart';
import 'package:kouple_app/app/models/auth_state.dart';
import 'package:kouple_app/app/providers/auth_providers.dart';
import 'package:kouple_app/app/routes/app_routes_constants.dart';
import 'package:kouple_app/app/util/app_color.dart';
import 'package:kouple_app/app/util/app_padding.dart';
import 'package:kouple_app/app/util/app_spacing.dart';
import 'package:kouple_app/app/util/app_text.dart';
import 'package:kouple_app/app/util/image_icon.dart';
import 'package:kouple_app/app/util/sizeconfig.dart';
import 'package:kouple_app/app/util/svg_assets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordObscure = ref.watch(visibilityprovider);
    ref.listen<AuthenticationState>(authControllerProvider, (previous, next) {
      if (next is AuthstateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(next.message),
          backgroundColor: black,
          behavior: SnackBarBehavior.floating,
        ));
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
                const AppSpacing(v: 150),
                ApptexBold(data: 'Sign in to kouple ', fontsize: 25),
                AppText(
                    data: ' Welcome Sign In with your email and password...',
                    fontsize: 12),
                const AppSpacing(v: 10),
                ApptexBold(data: 'Email', fontsize: 16),
                const AppSpacing(v: 5),
                AuthTextfield(
                  controller: emailcontroller,
                  keyboardtype: TextInputType.emailAddress,
                  obscuretext: false,
                  hint: 'Email',
                ),
                const AppSpacing(v: 10),
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
                const AppSpacing(v: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    InkWell(
                      onTap: () {},
                      child: AppTextMedium(
                        data: 'Forgot password',
                        fontsize: 12,
                      ),
                    ),
                  ],
                ),
                const AppSpacing(v: 10),
                //submit button
                ButtonLarge(
                  isloading:
                      ref.watch(authControllerProvider) is AuthstateLoding,
                  onTap: ref.watch(authControllerProvider) is AuthstateLoding
                      ? null
                      : () {
                          Future.delayed(const Duration(microseconds: 1000),
                              () {
                            ref.watch(authControllerProvider.notifier).signin(
                                emailcontroller.text, passwordController.text);
                          });
                        },
                  label: 'Sign in',
                ),
                const AppSpacing(
                  v: 30,
                ),
                Center(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account?",
                            style: GoogleFonts.montserrat(
                                color: black,
                                fontSize: 16,
                                fontWeight: FontWeight.w900)),
                        const WidgetSpan(
                            child: AppSpacing(
                          h: 5,
                        )),
                        TextSpan(
                            text: "Sign Up",
                            style: GoogleFonts.montserrat(
                                color: black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRoutesConstants.register);
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

class ButtonLarge extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final bool isloading;
  const ButtonLarge(
      {super.key, this.onTap, required this.label, this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isloading ? null : onTap,
      child: Container(
        height: SizeConfig.fromDesignHeight(context, 45),
        decoration: const BoxDecoration(
            color: black, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: isloading
            ? Center(
                child: SizedBox(
                  height: SizeConfig.fromDesignHeight(context, 20),
                  width: SizeConfig.fromDesignWidth(context, 20),
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                ),
              )
            : Center(
                child: AppTextMedium(
                  data: label,
                  fontsize: 12,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

class AuthTextfield extends StatelessWidget {
  const AuthTextfield(
      {super.key,
      required this.controller,
      this.hint,
      this.suffixIcon,
      required this.obscuretext,
      this.keyboardtype});

  final TextEditingController controller;
  final String? hint;
  final TextInputType? keyboardtype;
  final Widget? suffixIcon;
  final bool obscuretext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscuretext,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.montserrat(fontSize: 15),
        suffixIcon: suffixIcon,
        suffixIconColor: black,
        constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 70),
            minHeight: SizeConfig.fromDesignHeight(context, 42)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: black),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: black),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
