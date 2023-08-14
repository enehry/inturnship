import 'package:flutter/material.dart';
import 'package:inturnship/models/hte.dart';
import 'package:inturnship/models/profile.dart';
import 'package:inturnship/services/hive/profile_service.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileService _profileService = ProfileService();

  ProfileProvider() {
    initProfile();
  }

  // for profile creation
  String _fullName = '';
  String _homeAddress = '';
  String _schoolCampus = '';
  String _program = '';
  String _yearSection = '';
  String _adviser = '';

  // for hte creation
  String _name = '';
  String _address = '';
  String _contactNumber = '';

  // for time period creation
  int? _totalHours;
  int? _hoursPerDay;

  Profile? _currentProfile;

  Profile? get currentProfile => _currentProfile;

  Future<bool> initProfile() async {
    _currentProfile = await _profileService.getProfile();
    return _currentProfile != null;
  }

  Future<Profile?> getProfile() async {
    _currentProfile = await _profileService.getProfile();
    return _currentProfile;
  }

  int get totalHours => currentProfile?.hte.totalHours ?? 0;
  int get hoursPerDay => currentProfile?.hte.hoursPerDay ?? 0;

  void setProfileInfo({
    required String fullName,
    required String homeAddress,
    required String schoolCampus,
    required String yearSection,
    required String program,
    required String adviser,
    required String name,
    required String address,
    required String contactNumber,
  }) {
    _fullName = fullName;
    _homeAddress = homeAddress;
    _schoolCampus = schoolCampus;
    _program = program;
    _yearSection = yearSection;
    _adviser = adviser;
    _name = name;
    _address = address;
    _contactNumber = contactNumber;
    notifyListeners();
  }

  void setTimePeriod({
    required int totalHours,
    required int hoursPerDay,
  }) {
    _totalHours = totalHours;
    _hoursPerDay = hoursPerDay;
    notifyListeners();
  }

  Future<int> saveProfile() async {
    print('ok');
    try {
      final currentProfile = Profile(
        fullName: _fullName,
        homeAddress: _homeAddress,
        schoolCampus: _schoolCampus,
        yearSection: _yearSection,
        program: _program,
        adviser: _adviser,
        hte: Hte(
          name: _name,
          address: _address,
          contactNumber: _contactNumber,
          totalHours: _totalHours!,
          hoursPerDay: _hoursPerDay!,
        ),
      );
      print(currentProfile.toString());

      var res = await _profileService.addProfile(profile: currentProfile);

      print(res);

      if (res != -1) {
        _currentProfile = currentProfile;
        notifyListeners();
      }
      return res;
    } catch (e) {
      return -1;
    }
  }

  @override
  void dispose() {
    _profileService.closeBoxes();
    super.dispose();
  }
}
