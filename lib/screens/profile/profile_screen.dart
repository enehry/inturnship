import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:inturnship/models/profile.dart';
import 'package:inturnship/providers/profile_provider.dart';
import 'package:inturnship/screens/profile/profile_layout.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileLayout(
      child: FutureBuilder(
        future: context.read<ProfileProvider>().getProfile(),
        builder: (context, AsyncSnapshot<Profile?> profileSnap) {
          if (profileSnap.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Initicon(
                  size: 115.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  text: profileSnap.data!.fullName,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  profileSnap.data!.fullName,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        profileSnap.data!.program,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  // fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      //school information
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "School Information",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      //body
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //school / campus
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      profileSnap.data!.schoolCampus,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "School/Campus",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF565659).withOpacity(0.4),
                                    ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => launchUrl(Uri.parse(
                                          'https://www.google.com/search?q=ursb&rlz=1C1ONGR_enPH1031PH1031&oq=URSb&aqs=chrome.0.35i39j46i175i199i340i512j0i512l4j69i61j69i60.1566j0j1&sourceid=chrome&ie=UTF-8')),
                                      child: Text(
                                        "(02) 8652 1018",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "School Tel. No.",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF565659).withOpacity(0.4),
                                    ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      profileSnap.data!.adviser,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Adviser",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF565659).withOpacity(0.4),
                                    ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      profileSnap.data!.yearSection,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Yr. & Section",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF565659).withOpacity(0.4),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //HTE
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Host Training Establishment",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      //body
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      profileSnap.data!.hte.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Host Training Estabilshment",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF565659).withOpacity(0.4),
                                    ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      profileSnap.data!.hte.address,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "HTE Address",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF565659).withOpacity(0.4),
                                    ),
                              ),
                              const SizedBox(height: 6.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      profileSnap.data!.hte.contactNumber,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                        ..copyWith(
                                          decoration: TextDecoration.underline,
                                        ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "HTE Contact No.",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: Color(0xFF565659).withOpacity(0.4),
                                    ),
                              ),
                              const SizedBox(height: 6.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
