import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? Colors.blue : Colors.green;

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: iconColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title,
          style:
              Theme.of(context).textTheme.bodyLarge?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/profile_image.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue,
                        ),
                        child: const Icon(LineAwesomeIcons.alternate_pencil,
                            color: Colors.black, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Profile Heading',
                  style: Theme.of(context).textTheme.headlineMedium),
              Text('Profile Subheading',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Edit Profile',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Settings",
                  icon: LineAwesomeIcons.cog,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Billing Details",
                  icon: LineAwesomeIcons.wallet,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Management",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Get.defaultDialog(
                    title: "LOGOUT",
                    titleStyle: const TextStyle(fontSize: 20),
                    content: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Text("Are you sure you want to Logout?"),
                    ),
                    confirm: ElevatedButton(
                      onPressed: () =>
                          AuthenticationRepository.instance.logout(),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                      child: const Text("Yes"),
                    ),
                    cancel: OutlinedButton(
                        onPressed: () => Get.back(), child: const Text("No")),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthenticationRepository {
  static AuthenticationRepository instance = AuthenticationRepository();

  Future<void> logout() {
    // Add your logout logic here
    return Future.delayed(const Duration(seconds: 2));
  }
}

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text('Edit Profile',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage('assets/profile_image.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue,
                        ),
                        child: const Icon(LineAwesomeIcons.camera,
                            color: Colors.black, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: Icon(LineAwesomeIcons.user),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(LineAwesomeIcons.envelope_1),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(LineAwesomeIcons.phone),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Address',
                        prefixIcon: Icon(LineAwesomeIcons.map_marker),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your save profile logic here
                    controller.updateProfile();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Save Changes',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileController extends GetxController {
  Future<void> updateProfile() async {
    // Add your profile update logic here
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
    Get.snackbar('Success', 'Profile updated successfully');
  }
}

void main() {
  runApp(GetMaterialApp(home: const ProfileScreen()));
}
