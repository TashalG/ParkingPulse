import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseController 
{
  static final DatabaseController controller = DatabaseController.instance();
  final supabase = Supabase.instance.client;

  factory DatabaseController()
  {
    return controller;
  }

  DatabaseController.instance();

}