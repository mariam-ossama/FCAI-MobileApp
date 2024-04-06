
import 'package:mobile_local_db/DatabaseHelper.dart';
import 'package:mobile_local_db/widgets/custom_text_field.dart';
import 'package:mobile_local_db/widgets/custum_button.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
   EditProfilePage({super.key});


  @override
  State<EditProfilePage> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController levelController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    // Fetch user data when the widget is initialized
  }
  
  void saveChanges(BuildContext context) async {
  await dbHelper.updateUserData({
    'name': nameController.text,
    'gender': genderController.text,
    //'email': emailController.text,
    'studentId': idController.text,
    'level': levelController.text,
  });
  Navigator.pushNamed(context, 'ProfilePage');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit your profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          CustomTextField(
            obsText: false,
            controllerText: nameController,
            hint: 'Update your name',
            icon: Icon(Icons.person),
            label: 'Name',
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            obsText: false,
            controllerText: genderController,
            hint: 'Update your Gender',
            label: 'Gender',
            icon: Icon(Icons.text_fields),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            obsText: false,
            controllerText: emailController,
            hint: 'Update your email',
            label: 'Email',
            icon: Icon(Icons.email),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(obsText: false,
          controllerText: idController,
          hint: 'i.e, 20200001',
          icon: Icon(Icons.perm_identity),
          label: 'ID',),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            obsText: false,
            controllerText: levelController,
            hint: 'Update your level',
            label: 'Level',
            icon: Icon(Icons.numbers),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Save Changes',
            onPressed: ()  async{
              saveChanges(context);
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'My Profile',
            onPressed: () {
              Navigator.pushNamed(context, 'ProfilePage');
            },
          )
        ],
      ),
    );
  }
}
