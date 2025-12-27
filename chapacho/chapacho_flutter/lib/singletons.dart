import 'package:chapacho_client/chapacho_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

// THE VAULT: Only one copy of these will ever exist.
late final Client client;
late final SessionManager sessionManager;