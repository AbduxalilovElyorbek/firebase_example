import 'package:firebase_example/core/untils/imports.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCKm0Q7MLqSXxQ6VOIMAqMGrNvHNBJqOXQ",
            appId: "1:538512845950:android:5abf11d78184a280197c2f",
            messagingSenderId: "538512845950",
            projectId: "example-app-3db94",
          ),
        )
      : await Firebase.initializeApp();

  setUp();

  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MessagesPage.routeName: (context) => BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const MessagesPage(),
            ),
        SignUpPage.routeName: (context) => BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const SignUpPage(),
            ),
        SignInPage.routeName: (context) => BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const SignInPage(),
            ),
        NavigationBarScreen.routeName: (context) => BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const NavigationBarScreen(),
            ),
        Chat.routeName: (context) => BlocProvider(
              create: (context) => sl<AuthBloc>(),
              child: const Chat(),
            ),
      },
      home: FirebaseAuth.instance.currentUser == null
          ? const OnboardingPage()
          : const NavigationBarScreen(),
    );
  }
}
