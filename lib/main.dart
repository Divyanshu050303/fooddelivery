import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/SignIn.dart';
import 'package:fooddelivery/screen/SplashScreen.dart';
import 'package:provider/provider.dart';
import 'NavBar.dart';
import 'Services/SigningClass.dart';
import 'firebase_options.dart';

bool shouldUseFirebaseEmulator = false;

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  if (shouldUseFirebaseEmulator) {
    await auth.useAuthEmulator('localhost', 9099);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      );
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
      body: ChangeNotifierProvider(
          create: (_) => SingingAuth(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapsot) {
              final provider = Provider.of<SingingAuth>(context);
              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapsot.hasData) {
                return const NavBar();
              } else if (snapsot.hasError) {
                return const Center(child: Text("Something Went Wrong!"));
              } else {
                return const SignIn();
              }
            },
          )));

  Widget buildLoading() => const Stack(
        fit: StackFit.expand,
        children: [
          Center(child: CircularProgressIndicator()),
        ],
      );
}
