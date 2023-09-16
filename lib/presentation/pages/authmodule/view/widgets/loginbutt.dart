import 'package:flutter/widgets.dart';
import '../../../../component/primary_button.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.ontap, required this.txt});
 final Function ontap ; 
 final String txt ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Row(
        children: [
         const Expanded(flex: 1,child: Text('')),
          Expanded(
            flex: 9,
            child: PrimaryButton(
              text:txt,
              onPressed: () { 
                ontap() ;
              },
            ),
          ),
          const Expanded(flex: 1,child: Text('')),
        ],
      ),
    );
  }
}