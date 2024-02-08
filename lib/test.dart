import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'presentation/utils/app_utility.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DraggableScrollableController _controller = DraggableScrollableController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children : [ Column(
          children: [
            // First Container
          Container(
                
                  color: Colors.transparent,
                ),
            // Second Container
            Expanded(
              
              child: DraggableScrollableSheet(   
                controller: _controller,
             
                builder: (context, scrollController) {  
           
                  return
                   Container( 
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10) , 
                        color: Colors.green,
                  ),
                 
             
                  child: SingleChildScrollView(  
                    scrollDirection: Axis.vertical,
                    controller: scrollController,
                    child: Column( 
                      
                      children: [
                      
                        Center(
                          child: TextFormField(  
                             decoration: const InputDecoration(),
                             onTap: () { 
                              _controller.animateTo(
                                  1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linearToEaseOut,
                              );
                            },
                           
                          
                            
                          )
                        ),
                        // Add more widgets as needed
                      ],
                    ),
                  ),
                ) ;
                },
               
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
