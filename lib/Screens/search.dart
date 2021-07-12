import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe/widgets/Recipe-input-field.dart';

class Search extends StatefulWidget {

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SingleChildScrollView(
        child: Column(
                      children: [
                        TextInputField(
                          icon: FontAwesomeIcons.search,
                          hint: 'Search',
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.next,
                        ),
                        
                        
                        
                       
                       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           
                           
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
      )
               ,
      
    );
  
  }
}