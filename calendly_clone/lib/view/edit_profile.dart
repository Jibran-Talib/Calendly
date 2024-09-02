import 'package:calendly_clone/widgets/reuse_progress_indicater.dart';
import 'package:calendly_clone/widgets/reuseable_button.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:calendly_clone/widgets/reuseable_textformField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool loading = false;

  TextEditingController firstNameEditingConroller = TextEditingController();
  TextEditingController lastNameEditingConroller = TextEditingController();
  TextEditingController emailEditingConroller = TextEditingController();
  TextEditingController passwardEditingConroller = TextEditingController();

  void setSharedPrefesData() async {
    SharedPreferences prefes = await SharedPreferences.getInstance();
    firstNameEditingConroller.text = prefes.getString('firstname')!;
    lastNameEditingConroller.text = prefes.getString('lastname')!;
    emailEditingConroller.text = prefes.getString('email')!;
    passwardEditingConroller.text = prefes.getString('password')!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSharedPrefesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 2,
        // shadowColor: Colors.white,
        backgroundColor: Colors.white,
        bottomOpacity: 1,
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 1),
            child: Material(
              elevation: 2,
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.white,
              ),
            )),
        title: const ReuseText(
          text: 'Edit Profile',
          color: Colors.black,
          size: 20,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xff0047ff)),
        // leading: Icon(Icons.arrow_back, color: ,),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40.h,
                  backgroundColor: Color(0xffdd91da),
                  child: CircleAvatar(
                    radius: 36.h,
                    backgroundColor: Color(0xffd9d9d9),
                    child: ReuseText(
                      text: 'a',
                      size: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ReuseTextFormField(
                enabledBorderColor: Color(0xff757575),
                hintText: 'First name',
                textEditingController: firstNameEditingConroller,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReuseTextFormField(
                enabledBorderColor: Color(0xff757575),
                hintText: 'Last name',
                textEditingController: lastNameEditingConroller,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReuseTextFormField(
                enabledBorderColor: Color(0xff757575),
                hintText: 'Email',
                textEditingController: emailEditingConroller,
              ),
              SizedBox(
                height: 15.h,
              ),
              ReuseTextFormField(
                enabledBorderColor: Color(0xff757575),
                hintText: 'Passward',
                textEditingController: passwardEditingConroller,
              ),
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    loading = !loading;
                  });
                },
                child: ReuseButton(
                    widget: loading
                        ? const ReuseProgressIndicater()
                        : const ReuseText(
                            text: 'Submit',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
