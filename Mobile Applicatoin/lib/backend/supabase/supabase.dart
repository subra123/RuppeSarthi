import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://prnpbskjozvpkipgnwvb.supabase.co';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBybnBic2tqb3p2cGtpcGdud3ZiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzAzMTIxMjMsImV4cCI6MjA0NTg4ODEyM30.6AY-kE-FDQUKr_U70EiUnRjPAdgJpFIDQMbbAyEDTOg';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
