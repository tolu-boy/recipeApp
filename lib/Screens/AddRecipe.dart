
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe/widgets/rounded-button.dart';
import 'package:recipe/widgets/Recipe-input-field.dart';


class AddRecipe extends StatefulWidget {

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
                      children: [
                        TextInputField(
                          icon: FontAwesomeIcons.bacon,
                          hint: 'Name or Recipe',
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.next,
                        ),
                        TextInputField(
                          ontap: (value) {
                            print(value);
                          },
                          icon: FontAwesomeIcons.clock,
                          hint: 'Time for preparation',
                          inputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                        ),
                        TextInputField(
                          ontap: (value) {
                            
                          },
                          icon: FontAwesomeIcons.leaf,
                          hint: 'Ingredents',
                          inputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        RoundedButton(
                            buttonName: 'save',
                        ),
                        SizedBox(
                          height: 30,
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