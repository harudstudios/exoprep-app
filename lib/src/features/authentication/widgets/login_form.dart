import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/common/ui/overlays/sheets.dart';
import 'package:root/src/core/common/ui/overlays/toast.dart';
import 'package:root/src/core/constants/assets.dart';
import 'package:root/src/core/constants/enums.dart';
import 'package:root/src/core/constants/strings.dart';
import 'package:root/src/core/extensions/app_scope_extension.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/features/authentication/authentication_viewmodel.dart';
import 'package:root/src/features/authentication/widgets/forgot_password_form.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({required this.selectedMode, super.key});

  final ValueNotifier<AuthenticationMode> selectedMode;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController loginEmailController;
  late TextEditingController loginPasswordController;

  ValueNotifier<bool> isPasswordObscure = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = context.authViewModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo + Title
        const SizedBox(width: 10),
        Text(
          AppStrings.appName,
          style: context.titleLarge!.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),

        Text(
          "Log in to your account",
          style: context.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
          ),
        ),
        // const SizedBox(height: 6),
        Text(
          "Welcome back! Please enter your details.",
          style: context.bodyMedium!.copyWith(
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 28),

        // Email field
        Text(
          "Email",
          style: context.bodySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            hintText: "example@gmail.com",
            fillColor: Colors.transparent,
            border: const UnderlineInputBorder(),
            hintStyle: TextStyle(color: Colors.grey.shade700),
          ),
          controller: loginEmailController,
        ),
        const SizedBox(height: 18),

        // Password field
        Text(
          "Password",
          style: context.bodySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: isPasswordObscure,
          builder: (context, value, child) {
            return TextFormField(
              obscureText: isPasswordObscure.value,
              decoration: InputDecoration(
                hintText: "••••••••",
                hintStyle: TextStyle(color: Colors.grey.shade700),
                suffixIcon: IconButton(
                  onPressed: () => isPasswordObscure.value = !isPasswordObscure.value,
                  icon: Icon(
                    isPasswordObscure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                ),
                border: const UnderlineInputBorder(),
              ),
              controller: loginPasswordController,
            );
          },
        ),
        const SizedBox(height: 10),

        // Remember + Forgot
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => showForgotPasswordPopup(authViewModel),
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                "Forgot Password",
                style: context.bodySmall!.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Login Button
        GestureDetector(
          onTap: () => loginUser(authViewModel),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.white : Colors.black,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: authViewModel.authState,
                builder: (context, value, child) {
                  if (value.status == ViewModelStatus.loading) {
                    return CupertinoActivityIndicator(color: context.isDarkMode ? Colors.black : Colors.white);
                  }
                  return Text(
                    "Login",
                    style: context.titleMedium!.copyWith(
                      color: context.isDarkMode ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Google Sign-In
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: authViewModel.loginWithGoogle,
            icon: Image.asset(
              AppAssets.googleIcon,
              height: 20,
              width: 20,
            ),
            label: Text(
              "Continue with Google",
              style: context.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: BorderSide(color: context.isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 26),

        // Footer
        Center(
          child: RichText(
            text: TextSpan(
              text: "Don’t have an account? ",
              style: context.bodyMedium!.copyWith(),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => widget.selectedMode.value = AuthenticationMode.signup,
                  text: "Sign up",
                  style: context.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void loginUser(AuthenticationViewModel authViewModel) {
    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text.trim();

    // Check for empty fields
    if (email.isEmpty || password.isEmpty) {
      AppToasts.showError(
        context,
        title: 'Missing Information',
        description: 'Please enter both your email and password.',
      );
      return;
    }

    // Validate email format
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      AppToasts.showError(
        context,
        title: 'Invalid Email',
        description: 'Please enter a valid email address.',
      );
      return;
    }

    // Proceed with login
    authViewModel.login(
      email: email,
      password: password,
    );
  }

  void showForgotPasswordPopup(AuthenticationViewModel authViewModel) {
    AppSheets.showCupertinoBottomSheet(
      context,
      ForgotPasswordForm(authViewModel: authViewModel),
    );
  }
}
