import 'package:chapacho_client/chapacho_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

// 1. IMPORT THE VAULT
import 'package:chapacho_flutter/singletons.dart';

import 'screens/recording_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 10.0.2.2 is for Android Emulator
  const serverUrl = 'http://10.0.2.2:8080/';

  // 2. INITIALIZE THE VARIABLES FROM THE VAULT
  client = Client(
    serverUrl,
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();

  final token = await client.authenticationKeyManager?.get();
  print("========================================");
  print("🔍 STARTUP DIAGNOSTICS:");
  print("   - Token Found: ${token != null ? "YES (Ends in ...${token.substring(token.length - 6)})" : "NO"}");
  print("   - Is Signed In: ${sessionManager.isSignedIn}");
  print("   - User ID: ${sessionManager.signedInUser?.id}");
  print("========================================");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapacho',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    sessionManager.addListener(_onSessionChanged);
  }

  @override
  void dispose() {
    sessionManager.removeListener(_onSessionChanged);
    super.dispose();
  }

  void _onSessionChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (sessionManager.isSignedIn) {
      return const HomeScreen();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to Chapacho")),
      body: Center(
        child: SignInWithEmailButton(
          caller: client.modules.auth,
          onSignedIn: () {
            // Listener handles the update
          },
        ),
      ),
    );
  }
}