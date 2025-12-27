import 'package:chapacho_client/chapacho_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import 'screens/recording_screen.dart';

// Global Client
late final Client client;
late final SessionManager sessionManager;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const serverUrl = 'http://10.0.2.2:8080/';

  client = Client(
    serverUrl,
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();

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

// The Gatekeeper
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
      return const RecordingScreen();
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to Chapacho")),
      body: Center(
        child: SignInWithEmailButton(
          caller: client.modules.auth,
          onSignedIn: () {
          },
        ),
      ),
    );
  }
}