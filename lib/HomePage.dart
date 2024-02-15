import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:h6/data_layer/user.dart';
import 'package:h6/widgets/Text_Felid.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this import

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<Map<String, String>> UserData = [];

  // Initialize SharedPreferences
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  // Function to initialize SharedPreferences
  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFelidWidget(hintText: 'Enter your name', labelText: "name", controller: nameController,),
            TextFelidWidget(hintText: 'Enter your phone', labelText: "email", controller: emailController,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    clearName();
                  },
                  child: Text('Clear Name'),
                ),
                ElevatedButton(
                  onPressed: () {
                    clearEmail();
                  },
                  child: Text('Clear Email'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                submitUserData();
              },
              child: Text('Add to List'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: UserData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(UserData[index]['name'] ?? ''),
                    subtitle: Text(UserData[index]['email'] ?? ''),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                clearUserData();
              },
              child: Text('Clear List'),
            ),
          ],
        ),
      ),
    );
  }

  void submitUserData() {
    String name = nameController.text;
    String email = emailController.text;
    setState(() {
      UserData.add({'name': name, 'email': email});
    });
    saveUserData(); 
    nameController.clear();
    emailController.clear();
  }

  void saveUserData() {
    
    prefs.setStringList('user_data', UserData.map((data) => '${data['name']},${data['email']}').toList());
  }

  void clearUserData() {
    setState(() {
      UserData.clear();
    });
    prefs.remove('user_data'); 
  }

  void clearName() {
    setState(() {
      nameController.clear();
    });
  }

  void clearEmail() {
    setState(() {
      emailController.clear();
    });
  }
}