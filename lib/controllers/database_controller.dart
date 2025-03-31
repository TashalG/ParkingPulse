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

  createUserEntry(String uid) async
  {
    await supabase.from('app_user').insert({'user_id': uid, 'is_supervisor': false});
  }

  Future<List>getUserEntry(String uid) async
  {
    //TODO THIS IS NOT WORKING AS IT SHOULD
    final result = await supabase.from('app_user').select();
    return result;
  }



}