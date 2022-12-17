import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_wedgit/gText_Field.dart';
import 'package:flutter_custom_wedgit/typeButton.dart';
import 'package:flutter_custom_wedgit/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //  _nameController.dispose();
  //  _emailController.dispose();
  //  _phoneController.dispose();
  //  _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,
                    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Icon(Icons.ad_units_sharp),
                  Icon(Icons.adf_scanner_sharp),
                  Icon(Icons.zoom_out_map_outlined),
                ],
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        notificationPredicate: (notification) {
          print(notification);
          return false;
        },
        scrolledUnderElevation: 5,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
//                 TextField(
//                   autofocus: true,
// focusNode: nameFocus,
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'user',
//                       suffixIcon: TextButton(
//                           onPressed: () {
//                             _nameController.clear();
//                           },
//                           child: Icon(Icons.clear))),
//                 ),
                GTextField(
                  focusNode: nameFocus,
                  typeKeyboard: TextInputType.name,
                  labelText: 'Name',
                  controller: _nameController,
                  icon: Icon(Icons.text_format),
                ),
                GTextField(
                  focusNode: emailFocus,
                  typeKeyboard: TextInputType.emailAddress,
                  labelText: 'Email',
                  controller: _emailController,
                  icon: Icon(Icons.email),
                ),
                GTextField(
                  focusNode: phoneFocus,
                  typeKeyboard: TextInputType.phone,
                  labelText: 'Phone',
                  controller: _phoneController,
                  icon: Icon(Icons.phone),
                ),
                GTextField(
                  focusNode: passwordFocus,
                  typeKeyboard: TextInputType.visiblePassword,
                  labelText: 'Password',
                  controller: _passwordController,
                  isSecure: true,
                  icon: Icon(Icons.lock_outline),
                ),
                ElevatedButton(
                  onPressed: () {
                    User user = User(
                        name: _nameController.text,
                        email: _emailController.text,
                        phone: _phoneController.text,
                        password: _passwordController.text);

                    print(user.name);
                    print(user.email);
                    print(user.phone);
                    print(user.password);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  TypesButton(user: user,)));
                  },
                  child: Text('submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}