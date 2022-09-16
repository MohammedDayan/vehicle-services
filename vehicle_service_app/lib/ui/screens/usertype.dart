import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../dashboard.dart';

class userType extends StatefulWidget {
  const userType({Key? key}) : super(key: key);

  @override
  State<userType> createState() => _userTypeState();
}



class _userTypeState extends State<userType> {
  UserType? _user;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("What type of user are you?"),
                RadioListTile(
                    title: const Text('I want to rent a car '),
                    value: UserType.individual,
                    groupValue: _user,
                    onChanged: (UserType? value) {
                      setState(() {
                        _user = value;
                      });
                    }),
                RadioListTile(
                    title: const Text('Individual car Owner'),
                    value: UserType.renter,
                    groupValue: _user,
                    onChanged: (UserType? value) {
                      setState(() {
                        _user = value;
                      });
                    }),
                RadioListTile(
                    title: const Text('Car rental Company'),
                    value: UserType.company,
                    groupValue: _user,
                    onChanged: (UserType? value) {
                      setState(() {
                        _user = value;
                      });
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      userProceed();
                    },
                    child: const Text("Ok")),
              ]),
        ),
      ),
    );
  }

  void userProceed() {
    switch (_user) {
      case UserType.individual:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
        break;
      case UserType.renter:
        print("car renter");
        break;
      case UserType.company:
        print("i am a company");
        break;
      default:
        const snackbar =
            SnackBar(content: Text("You have not made a selection"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
