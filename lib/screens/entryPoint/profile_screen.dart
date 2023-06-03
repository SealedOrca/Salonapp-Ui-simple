import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provid_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Profile Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetBuilder<ProfileController>(
        builder: (controller) => MergedProfileScreen(
          name: controller.name.value,
          bio: controller.bio.value,
          contactInfo: controller.contactInfo.value,
          profilePicture: controller.profilePicture.value,
          updateProfile: controller.updateProfile,
        ),
      ),
    );
  }
}

class ProfileController extends GetxController {
  final RxString name = 'John Doe'.obs;
  final RxString bio = 'Flutter Developer'.obs;
  final RxString contactInfo = 'example@example.com'.obs;
  final RxString profilePicture = 'https://example.com/profile_image.png'.obs;

  void updateProfile(String newName, String newBio, String newContactInfo,
      String newProfilePicture) {
    name.value = newName;
    bio.value = newBio;
    contactInfo.value = newContactInfo;
    profilePicture.value = newProfilePicture;
  }
}

class MergedProfileScreen extends StatefulWidget {
  final String name;
  final String bio;
  final String contactInfo;
  final String profilePicture;
  final Function(String, String, String, String) updateProfile;

  const MergedProfileScreen({
    Key? key,
    required this.name,
    required this.bio,
    required this.contactInfo,
    required this.profilePicture,
    required this.updateProfile,
  }) : super(key: key);

  @override
  _MergedProfileScreenState createState() => _MergedProfileScreenState();
}

class _MergedProfileScreenState extends State<MergedProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _contactInfoController;
  File? _profilePicture;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _bioController = TextEditingController(text: widget.bio);
    _contactInfoController = TextEditingController(text: widget.contactInfo);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _contactInfoController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _profilePicture = File(pickedImage.path);
      });
      await _saveProfilePicture();
    }
  }

  Future<void> _saveProfilePicture() async {
    if (_profilePicture == null) return;
    final directory = await getApplicationDocumentsDirectory();
    final fileName = path.basename(_profilePicture!.path);
    final savedImage =
        await _profilePicture!.copy('${directory.path}/$fileName');
    widget.updateProfile(
      _nameController.text,
      _bioController.text,
      _contactInfoController.text,
      savedImage.path,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 64,
                backgroundImage: _profilePicture != null
                    ? Image.file(_profilePicture!).image
                    : NetworkImage(widget.profilePicture),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _bioController,
              decoration: const InputDecoration(
                labelText: 'Bio',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _contactInfoController,
              decoration: const InputDecoration(
                labelText: 'Contact Info',
              ),
            ),
            const SizedBox(height: 16.0),
            ProfileMenuWidget(
              title: 'Settings',
              icon: LineAwesomeIcons.cog,
              onPress: () {
                // TODO: Implement Settings functionality
              },
            ),
            ProfileMenuWidget(
              title: 'Help & Support',
              icon: LineAwesomeIcons.question_circle,
              onPress: () {
                // TODO: Implement Help & Support functionality
              },
            ),
            ProfileMenuWidget(
              title: 'Sign Out',
              icon: LineAwesomeIcons.alternate_sign_out,
              onPress: () {
                // TODO: Implement Sign Out functionality
              },
              endIcon: false,
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

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
              Theme.of(context).textTheme.bodyMedium?.apply(color: textColor)),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey),
            )
          : null,
    );
  }
}
