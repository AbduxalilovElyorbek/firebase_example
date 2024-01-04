import 'package:firebase_example/core/untils/imports.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: kIsWeb || Platform.isAndroid
              ? FirebaseOptions(
                  apiKey: ProjectItems.apiKey,
                  appId: ProjectItems.id,
                  messagingSenderId: ProjectItems.messagingSenderId,
                  projectId: ProjectItems.projectId,
                )
              : null,
        )
      : await Firebase.initializeApp();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  setUp();

  ZegoUIKit().initLog().then(
    (value) {
      ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
        [
          ZegoUIKitSignalingPlugin(),
        ],
      );
    },
  );

  runApp(
    MyApp(
      navigatorKey: navigatorKey,
    ),
  );

  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  final GlobalKey navigatorKey;
  const MyApp({
    super.key,
    required this.navigatorKey,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        routes: {
          MessagesPage.routeName: (context) => BlocProvider(
                create: (context) => sl<MessagesBloc>(),
                child: const MessagesPage(),
              ),
          OnboardingPage.routeName: (context) => BlocProvider(
                create: (context) => sl<AuthBloc>(),
                child: const OnboardingPage(),
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
                create: (context) => sl<MessagesBloc>(),
                child: const Chat(),
              ),
        },
        navigatorKey: navigatorKey,
        home: FirebaseAuth.instance.currentUser == null
            ? const OnboardingPage()
            : const NavigationBarScreen(),
      ),
    );
  }
}
