import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/common/ui/overlays/toast.dart';
import 'package:root/src/core/constants/assets.dart';
import 'package:root/src/core/constants/enums.dart';
import 'package:root/src/core/constants/strings.dart';
import 'package:root/src/core/extensions/app_scope_extension.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/features/authentication/authentication_viewmodel.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({required this.selectedMode, super.key});

  final ValueNotifier<AuthenticationMode> selectedMode;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController signupNameController;
  late TextEditingController signupEmailController;
  late TextEditingController signupPasswordController;
  late TextEditingController signupConfirmPasswordController;

  ValueNotifier<bool> isPasswordObscure = ValueNotifier(true);
  ValueNotifier<bool> isConfirmPasswordObscure = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    signupNameController = TextEditingController();
    signupEmailController = TextEditingController();
    signupPasswordController = TextEditingController();
    signupConfirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    signupConfirmPasswordController.dispose();
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
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w800,
            color: Colors.black,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 32),

        Text(
          "Create an account",
          style: context.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            letterSpacing: -0.5,
          ),
        ),
        Text(
          "Join us and start your journey today!",
          style: context.textTheme.bodyMedium!.copyWith(
            color: Colors.grey[800],
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 28),

        // Full Name field
        Text(
          "Full Name",
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            hintText: "John Doe",
            fillColor: Colors.transparent,
            border: const UnderlineInputBorder(),
            hintStyle: TextStyle(color: Colors.grey.shade700),
          ),
          controller: signupNameController,
        ),
        const SizedBox(height: 18),

        // Email field
        Text(
          "Email",
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
            hintText: "example@gmail.com",
            fillColor: Colors.transparent,
            border: const UnderlineInputBorder(),
            hintStyle: TextStyle(color: Colors.grey.shade700),
          ),
          controller: signupEmailController,
        ),
        const SizedBox(height: 18),

        // Password field
        Text(
          "Password",
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
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
              controller: signupPasswordController,
            );
          },
        ),
        const SizedBox(height: 18),

        // Confirm Password field
        Text(
          "Confirm Password",
          style: context.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: isConfirmPasswordObscure,
          builder: (context, value, child) {
            return TextFormField(
              obscureText: isConfirmPasswordObscure.value,
              decoration: InputDecoration(
                hintText: "••••••••",
                hintStyle: TextStyle(color: Colors.grey.shade700),
                suffixIcon: IconButton(
                  onPressed: () => isConfirmPasswordObscure.value = !isConfirmPasswordObscure.value,
                  icon: Icon(
                    isConfirmPasswordObscure.value ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                ),
                border: const UnderlineInputBorder(),
              ),
              controller: signupConfirmPasswordController,
            );
          },
        ),
        const SizedBox(height: 24),

        // Sign Up Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => signUpUser(authViewModel),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(double.infinity, 56),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: ValueListenableBuilder(
              valueListenable: authViewModel.authState,
              builder: (context, value, child) {
                if (value.status == ViewModelStatus.loading) {
                  return const CupertinoActivityIndicator(color: Colors.white);
                }
                return Text(
                  "Sign Up",
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
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
              style: context.textTheme.titleMedium!.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: BorderSide(color: Colors.grey.shade300),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        const SizedBox(height: 26),

        // Footer
        Center(
          child: RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: context.textTheme.bodyMedium!.copyWith(
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => widget.selectedMode.value = AuthenticationMode.login,
                  text: "Log in",
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
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

  void signUpUser(AuthenticationViewModel authViewModel) {
    final name = signupNameController.text.trim();
    final email = signupEmailController.text.trim();
    final password = signupPasswordController.text.trim();
    final confirmPassword = signupConfirmPasswordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      AppToasts.showError(
        context,
        title: 'Missing Information',
        description: 'Please fill out all required fields.',
      );
      return;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      AppToasts.showError(
        context,
        title: 'Invalid Email',
        description: 'Please enter a valid email address.',
      );
      return;
    }

    // Optional: Password strength check
    if (password.length < 6) {
      AppToasts.showError(
        context,
        title: 'Weak Password',
        description: 'Password must be at least 6 characters long.',
      );
      return;
    }

    if (password != confirmPassword) {
      AppToasts.showError(
        context,
        title: 'Passwords Do Not Match',
        description: 'Please make sure both password fields are the same.',
      );
      return;
    }

    // Proceed with signup
    authViewModel.signup(
      email: email,
      password: password,
      name: name,
    );
  }
}
