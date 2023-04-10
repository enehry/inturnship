import 'package:inturnship/models/profile.dart';
import 'package:inturnship/services/hive_service.dart';

class ProfileService {
  final HiveService _hiveService = HiveService();

  Future<int> addProfile({
    required Profile profile,
  }) async {
    try {
      final box = await _hiveService.openBox<Profile>(Profile.boxName);
      var res = await box.add(profile);
      return res;
    } catch (e) {
      return -1;
    }
  }

  Future<Profile?> getProfile() async {
    final box = await _hiveService.openBox<Profile>(Profile.boxName);
    // check if box is empty
    if (box.isEmpty) {
      return null;
    }
    final profile = box.getAt(0);
    if (profile == null) {
      return null;
    }
    return profile;
  }

  Future<void> updateProfile({
    required Profile profile,
  }) async {
    final box = await _hiveService.openBox<Profile>(Profile.boxName);
    final profileBox = box.getAt(0);
    if (profileBox == null) {
      throw Exception('Profile not found');
    }
    profileBox.fullName = profile.fullName;
    profileBox.homeAddress = profile.homeAddress;
    profileBox.schoolCampus = profile.schoolCampus;
    profileBox.yearSection = profile.yearSection;
    profileBox.adviser = profile.adviser;
    profileBox.hte = profile.hte;

    await profileBox.save();
  }

  // close all boxes
  Future<void> closeBoxes() async {
    await _hiveService.closeHive();
  }
}
