import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe/DataModel/RecipeModel.dart';
import 'package:recipe/Screens/RecipeDetails.dart';

class NewRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
         
           
      
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: RecipeModel.demoRecipe.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  child: GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            recipeModel: RecipeModel.demoRecipe[index],
                          ), 
                        )),
                    child: RecipeCard(RecipeModel.demoRecipe[index])),
                );
              }),
        ],
      ),
    ));
  }
}

class RecipeCard extends StatefulWidget {
  final RecipeModel recipeModel;
  RecipeCard(this.recipeModel);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool saved = false;
    bool loved  = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image(
                  height: 320,
                  width: 320,
                  fit: BoxFit.cover,
                  image: AssetImage(widget.recipeModel.imgPath),
                ),
              ),
            ),
            Positioned(
                top: 20,
                right: 40,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      saved = !saved;
                    });
                  },
                  child: Icon(
                    saved
                        ? FontAwesomeIcons.bookmark
                        : FontAwesomeIcons.solidBookmark,
                    color: Colors.white,
                    size: 38,
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipeModel.title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.recipeModel.writer,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  )),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      FontAwesomeIcons.clock,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.recipeModel.cookingTime.toString() + '\'',
                    ),
                                        Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          loved = !loved;
                        });
                      },
                      child: Icon(
                        FontAwesomeIcons.heart,
                        color: loved ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
