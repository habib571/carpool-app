import 'package:carpooling/presentation/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linear_timer/linear_timer.dart';

class ToastTest extends StatefulWidget {
  const ToastTest({super.key});

  @override
  State<ToastTest> createState() => _ToastTestState();
}

class _ToastTestState extends State<ToastTest> { 
  late FToast fToast;

@override
void initState() {
    super.initState();
    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
}

_showToast() {
    Widget toast = Container( 
         height: 50,
       
        decoration: const BoxDecoration(
       
        color: AppColors.accentColor
        ),
        child: const Column( 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded( 
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 
                  Text("This is a Custom Toast"),
                    SizedBox(
                  width: 12.0,
                  ),
                  Icon(Icons.check),
              ],
              ),
            ),   
              
            
            Expanded(  child:  LinearTimer(  
              minHeight:2 , 
              color: AppColors.primaryColor, 
              backgroundColor: AppColors.accentColor,
          duration: Duration(seconds: 1 ),
        
        ))
          ],
        ),
    );


   /*fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
    );*/
    
    // Custom Toast Position
    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
             top: 40, 
              left: 40, 
              right: 40,
            child: child) ;
        });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:Center(
        child: ElevatedButton(onPressed: () { 
          _showToast() ;
        }, child:const Text("show toast")
        ),
      ),
    ) ;
  }
} 
class LinearProgressIndicatorClass extends StatefulWidget {
  const LinearProgressIndicatorClass({super.key});

  @override
  _LinearProgressIndicatorClassState createState() => _LinearProgressIndicatorClassState();
}

class _LinearProgressIndicatorClassState extends State<LinearProgressIndicatorClass> {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    
      body: LinearTimer(  
      color: AppColors.primaryColor,
        minHeight: 3,
          duration: Duration(seconds: 1 ),
        
        )
    );
  }
}