import 'package:flutter/material.dart';


class UserPage extends StatefulWidget {
  final String userName;
  final int userAge;
  final String userLocation;
  final String userBio;

  const UserPage({
    Key? key,
    this.userName = 'John Doe',
    this.userAge = 28,
    this.userLocation = 'New York',
    this.userBio = 'I love hiking and exploring new places!',
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late String userName;
  late int userAge;
  late String userLocation;
  late String userBio;

  @override
  void initState() {
    super.initState();
    userName = widget.userName;
    userAge = widget.userAge;
    userLocation = widget.userLocation;
    userBio = widget.userBio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),
      centerTitle: true,
      leading: BackButton(
        onPressed: () => Navigator.pushReplacementNamed(context,'/home'),
      )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/user_avatar.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe', // Replace with the user's name.
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Age: 28', // Replace with the user's age.
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text(
              'Location: New York', // Replace with the user's location.
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'About Me', // Replace with a section title like "About Me" or "Bio".
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'I love hiking and exploring new places!', // Replace with the user's bio.
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showEditProfileDialog();
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog() {
    TextEditingController nameController =
        TextEditingController(text: userName);
    TextEditingController ageController =
        TextEditingController(text: userAge.toString());
    TextEditingController locationController =
        TextEditingController(text: userLocation);
    TextEditingController bioController = TextEditingController(text: userBio);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
            
              return AlertDialog(
                title: const Text('Edit Profile'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        controller: ageController,
                        decoration: const InputDecoration(labelText: 'Age'),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: locationController,
                        decoration:
                            const InputDecoration(labelText: 'Location'),
                      ),
                      TextField(
                        controller: bioController,
                        decoration: const InputDecoration(labelText: 'Bio'),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () {
                      setState(() {
                        userName = nameController.text;
                        userAge = int.parse(ageController.text);
                        userLocation = locationController.text;
                        userBio = bioController.text;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        });
  }

  void showEditProfileDialog() {
    TextEditingController nameController =
        TextEditingController(text: userName);
    TextEditingController ageController =
        TextEditingController(text: userAge.toString());
    TextEditingController locationController =
        TextEditingController(text: userLocation);
    TextEditingController bioController = TextEditingController(text: userBio);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            String? nameError;
            String? ageError;
            String? locationError;
            String? bioError;

            return AlertDialog(
              title: const Text('Edit Profile'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        errorText: nameError,
                      ),
                    ),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        errorText: ageError,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: locationController,
                      decoration: InputDecoration(
                        labelText: 'Location',
                        errorText: locationError,
                      ),
                    ),
                    TextField(
                      controller: bioController,
                      decoration: InputDecoration(
                        labelText: 'Bio',
                        errorText: bioError,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Save'),
                  onPressed: () {
                    bool isValid = true;
                    setState(() {
                      if (nameController.text.isEmpty) {
                        isValid = false;
                        nameError = 'Name cannot be empty';
                      } else {
                        nameError = null;
                      }

                      if (ageController.text.isEmpty ||
                          int.tryParse(ageController.text) == null ||
                          int.parse(ageController.text) <= 0 ||
                          int.parse(ageController.text) > 120) {
                        isValid = false;
                        ageError = 'Enter a valid age (1-120)';
                      } else {
                        ageError = null;
                      }

                      if (locationController.text.isEmpty) {
                        isValid = false;
                        locationError = 'Location cannot be empty';
                      } else {
                        locationError = null;
                      }

                      if (bioController.text.length > 500) {
                        isValid = false;
                        bioError = 'Bio is too long (max 500 chars)';
                      } else {
                        bioError = null;
                      }
                    });

                    if (isValid) {
                      this.setState(() {
                        userName = nameController.text;
                        userAge = int.parse(ageController.text);
                        userLocation = locationController.text;
                        userBio = bioController.text;
                      });
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
