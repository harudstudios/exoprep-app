import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:root/src/core/common/state/viewmodel_state.dart';
import 'package:root/src/core/common/ui/overlays/toast.dart';
import 'package:root/src/core/extensions/context_extension.dart';
import 'package:root/src/features/authentication/authentication_viewmodel.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({required this.authViewModel, super.key});

  final AuthenticationViewModel authViewModel;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  late TextEditingController forgotPasswordEmailController;

  @override
  void initState() {
    super.initState();
    forgotPasswordEmailController = TextEditingController();
  }

  @override
  void dispose() {
    forgotPasswordEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: context.screenWidth,
          padding: EdgeInsets.only(top: 8, left: 24, right: 24, bottom: context.viewInsets.bottom),
          child: Form(
            key: forgotPasswordFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(IonIcons.close),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Center(child: Text('Forgot Password?', style: context.headlineMedium)),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    "No worries, we'll send you reset instructions.",
                    style: context.bodyMedium!.copyWith(color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  "Email",
                  style: context.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "example@gmail.com",
                    fillColor: Colors.transparent,
                    border: const UnderlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.grey.shade700),
                  ),
                  controller: forgotPasswordEmailController,
                ),
                const SizedBox(height: 48),

                GestureDetector(
                  onTap: () {
                    final email = forgotPasswordEmailController.text;
                    if (email.isEmpty) {
                      AppToasts.showWarning(
                        context,
                        title: 'Enter Your Email',
                        description: 'We’ll send you a reset link once you provide your email.',
                      );
                      return;
                    }
                    widget.authViewModel.sendPasswordResetEmail(email: email);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // color: Colors.grey.shade900,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Center(
                      child: ValueListenableBuilder(
                        valueListenable: widget.authViewModel.authState,
                        builder: (context, value, child) {
                          if (value.status == ViewModelStatus.loading) {
                            return const CupertinoActivityIndicator(color: Colors.white);
                          }
                          return Text(
                            "Reset Password",
                            style: context.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
