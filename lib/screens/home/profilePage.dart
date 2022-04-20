import 'package:flutter/material.dart';
import 'package:taska/core/constants/PM_const.dart';
import 'package:taska/service/FirebaseService.dart';
import 'package:taska/widgets/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PMconst.medium,
      child: SizedBox(
        child: Column(
          children: [
            Appbar(icon: Icon(Icons.more_vert)),
            Center(
              child: IconButton(
                  onPressed: () {
                    FirebaseService.auth.signOut();
                  },
                  icon: Icon(Icons.abc_outlined)),
            )
          ],
        ),
      ),
    );
  }
}
