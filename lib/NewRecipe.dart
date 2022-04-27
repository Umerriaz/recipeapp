import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/RecipeDetails.dart';
import 'package:recipeapp/model/RecipeModel.dart';
import 'package:recipeapp/ad_provider.dart';

import 'ad_provider.dart';

class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdProvider adprovider = new AdProvider();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,

              itemCount: RecipeModel.demoRecipe.length,

              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(

                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetails(
                            recipeModel: RecipeModel.demoRecipe[index],
                          ),
                        )),
                    child: RecipeCard(
                      recipeModel: RecipeModel.demoRecipe[index],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),


      bottomNavigationBar:
      Consumer<AdProvider>(builder: (context, adProvider, child) {
        if (adProvider.ishomepagead) {
          return Container(
            height: adProvider.homepagead.size.height.toDouble(),
            child: AdWidget(ad: adProvider.homepagead),
          );
        } else {
          return Container(
            height: 10,
          );
        }
      }),






    );
  }
}

class RecipeCard extends StatefulWidget {
  final RecipeModel? recipeModel;
  const RecipeCard({
    @required this.recipeModel,
  });

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool loved = false;
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Hero(
                  tag: widget.recipeModel?.imgPath as String,
                  child: Image(
                    height: 320,
                    width: 320,
                    fit: BoxFit.cover,

                    image: AssetImage(widget.recipeModel?.imgPath as String),
                  ),
                ),
              ),
            ),
            Positioned(
              height: 10,
              width: 10,
              top: 20,
              right: 40,
              child: InkWell(
                onTap: () {
                  setState(() {
                    //saved = !saved;
                  });
                },
                /*child: Icon(
                  saved
                      ? FlutterIcons.bookmark_check_mco
                      : FlutterIcons.bookmark_outline_mco,
                  color: Colors.white,
                  size: 38,
                ),*/
              ),
            ),
          ],
        ),
        const SizedBox(
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
                      widget.recipeModel?.title as String,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.recipeModel?.writer as String,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 10,
                      width: 20,
                    ),
                    const Icon(
                      // FlutterIcons.timer_mco,
                      Icons.access_time,
                    ),
                    const SizedBox(
                      height: 10,
                      width: 4,
                    ),
                    Text(
                      widget.recipeModel?.cookingTime.toString() as String,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          loved = !loved;
                        });
                      },

                      child: const Icon(
                        Icons.volunteer_activism,
                        //FlutterIcons.heart_circle_mco,
                        // color: loved ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }


  @override
  void initState() {
    // initialize homepge banner ad that we defined in ad provider
    Provider.of<AdProvider>(context, listen: false).intitializeHomepageBanner();
    super.initState();
  }

}
