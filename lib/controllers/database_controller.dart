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

  //User Profile Management methods

  createUserEntry(String? userId) async {
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

  Future<Map<String, dynamic>> getUserEntry(String userId) async {
    final response = await supabase
       .from('app_user')
       .select()
       .eq('user_id', userId)
       .single();
    return response;
  }

  //Parking Spot Management methods

  Future<List<Map<String, dynamic>>> getAvailableParkingLots() async {
    final response = await supabase
      .from('parking_lot')
      .select();

    return response;
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

  //upgrade to supervisor

  Future<void> upgradeToSupervisor(String userId) async {
    final response = await supabase
      .from('app_user')
      .update({'is_supervisor': true})
      .eq('user_id', userId);
    if (response.error != null) {
      print('Error: ${response.error!.message}');
    } else {
      print('User upgraded to supervisor');
    }
  }



}