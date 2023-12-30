import 'package:firebase_example/core/untils/imports.dart';
import 'package:firebase_example/modules/domain/usecase/register/register.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = "sign/up";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButtonWidget(
          icon: AppIcons.back,
          color: transparent,
          isBordered: false,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: dark,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Sign up ',
                      ),
                      TextSpan(
                        text: 'Email',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 8,
                          decorationColor: lineColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Get chatting with friends and family today by \n signing up for our chat app!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: grey,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: InputWidget(
                  text: "Your name",
                  controller: _nameController,
                  validators: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]').hasMatch(
                          value,
                        )) {
                      return 'Name incorrect, enter correct name.';
                    } else {
                      return null;
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
                  text: "Your email",
                  controller: _emailController,
                  validators: (v) {
                    if (v!.isEmpty && !v.contains("@")) {
                      return 'Email invalide';
                    } else {
                      return null;
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
                    if (v!.isEmpty || v.length <= 6) {
                      return "Password must be higer than 5 and lover than 32";
                    } else {
                      return null;
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
                  text: "Confirm Password",
                  isPassword: true,
                  controller: _confirmPasswordController,
                  validators: (v) {
                    if (v!.isEmpty || v != _passwordController.text) {
                      return 'Passwords aren\'t equal';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              // const Spacer(),
              const SizedBox(
                height: 50,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
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
                              RegisterEvent(
                                RegisterParams(
                                  name: _nameController.text,
                                  email:
                                      _emailController.text.toString().trim(),
                                  password: _passwordController.text,
                                ),
                              ),
                            );
                      }
                    },
                    text: "Register",
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
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
