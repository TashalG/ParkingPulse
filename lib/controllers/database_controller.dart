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

  createUserEntry(String? uid) async
  {
    await supabase.from('app_user').insert({'user_id': uid, 'is_supervisor': false});
  }

  Future<List>getUserEntry(String? uid) async
  {
    //TODO THIS IS NOT WORKING AS IT SHOULD
    final result = await supabase.from('app_user').select();
    return result;
  }

  // User authentication methods

  Future<void> signUp(String email, String password) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    // Do you know why these have errors? im not quite sure if i did this correctly
    if (response.error != null) {
      print('Error: ${response.error!.message}');
    } else {
      print('User signed up: ${response.user!.email}');
    }
  }

  Future<void> signIn(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
   );
    if (response.error != null) {
      print('Error: ${response.error!.message}');
    } else {
      print('User signed in: ${response.user!.email}');
    }
  }

  Future<void> signOut() async {
    final response = await supabase.auth.signOut();
    if (response.error != null) {
      print('Error: ${response.error!.message}');
    } else {
      print('User signed out');
    }
  }

  //User Profile Management methods

  Future<void> createUserEntry(String userId) async {
    final response = await supabase.from('app_user').insert({
      'user_id': userId,
      'is_supervisor': false,
    });
    if (response.error != null) {
      print('Error: ${response.error!.message}');
    } else {
      print('User profile created');
    }
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    final response = await supabase
       .from('app_user')
       .select()
       .eq('user_id', userId)
       .single();
    if (response.error != null) {
      print('Error: ${response.error!.message}');
      return null;
    }
    return response.data;
  }

  //Parking Spot Management methods

  Future<List<Map<String, dynamic>>> getAvailableParkingSpots() async {
    final response = await supabase
      .from('parking_spots')
      .select()
      .eq('status', 'available');
    if (response.error != null) {
      print('Error: ${response.error!.message}');
    return [];
    }
    return response.data as List<Map<String, dynamic>>;
  }

  Future<void> updateParkingSpotStatus(String spotId, String status) async {
    final response = await supabase
      .from('parking_spots')
      .update({'status': status})
      .eq('id', spotId);
    if (response.error != null) {
      print('Error: ${response.error!.message}');
    } else {
      print('Parking spot status updated');
    }
  }







}