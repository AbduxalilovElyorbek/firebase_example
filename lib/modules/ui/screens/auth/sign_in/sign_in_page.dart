import 'package:firebase_example/core/untils/imports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInPage extends StatefulWidget {
  static const String routeName = "sign/in";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    // _globalKey = ;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppIcons.back,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  "Login to ChatBox",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Welcome back! Sign in using your social \n account or email to continue us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: grey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtonWidget(
                    isBordered: true,
                    icon: AppIcons.facebook,
                    color: dark,
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  IconButtonWidget(
                    isBordered: true,
                    icon: AppIcons.google,
                    color: dark,
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  IconButtonWidget(
                    icon: AppIcons.apple,
                    isBordered: true,
                    color: dark,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: OrWidget(
                  lineColor: lightGrey,
                  textColor: grey,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: InputWidget(
                  text: "Your email",
                  controller: _emailController,
                  validators: (v) {
                    if (v != '' || v != null) {
                      if (v!.contains('@')) {
                        return null;
                      } else {
                        return 'Email isn\'t correct';
                      }
                    } else {
                      return 'Field can\'t be empty';
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: InputWidget(
                  text: "Password",
                  isPassword: true,
                  controller: _passwordController,
                  validators: (v) {
                    if (v!.isNotEmpty && v.length > 6 && v.length < 18) {
                      return null;
                    } else {
                      return 'Password\'s length must be higher than 6 and lover than 18';
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      NavigationBarScreen.routeName,
                      (Route<dynamic> route) => false,
                    );
                  } else if (state is AuthErrorState) {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        content: Text(state.failure.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return ButtonWidget(
                    isLoading: state is AuthLoadingState,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              LoginEvent(
                                LoginParams(
                                  email:
                                      _emailController.text.toString().trim(),
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                      }
                    },
                    text: "Login",
                    textColor: _emailController.text == '' &&
                            _passwordController.text == ''
                        ? buttonColor
                        : white,
                    backgroundColor: _emailController.text == '' &&
                            _passwordController.text == ''
                        ? buttonBackground
                        : green,
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Forgot password?",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: green,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
