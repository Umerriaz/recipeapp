import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp/model/RecipeModel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:recipeapp/ad_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';


class RecipeDetails extends StatelessWidget {
  RecipeModel? recipeModel;


  RecipeDetails({

    @required this.recipeModel

  });



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(

      //ConstrainedBox()
      body: SizedBox(
        height: 900,
        child: SlidingUpPanel(

          parallaxEnabled: true,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          minHeight: (size.height / 2),
          maxHeight: size.height / 1.2,
          panel: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 5,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(


                    recipeModel?.title as String,
                    style: _textTheme.headline6


                ),


                const SizedBox(
                  height: 10,
                ),
                Text(
                  recipeModel?.writer as String,
                  style: _textTheme.caption,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    /*Icon(
                      FlutterIcons.heart_circle_mco,
                      color: Colors.red,
                    ),*/
                    /*SizedBox(
                      height: 10,
                      width: 5,
                    ),*/
                    /*Text(
                      "198",
                      // style: _textTheme.caption,
                    ),*/
                    const SizedBox(
                      width: 15,
                      height: 15,
                    ),
                    const Icon(
                      Icons.access_time,
                    ),
                    const SizedBox(
                      width: 4,
                      height: 8,
                    ),
                    Text(
                      recipeModel?.cookingTime.toString() as String,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 2,
                      height: 30,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                      height: 10,
                    ),
                    Text(
                      recipeModel?.servings.toString() as String,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.black.withOpacity(0.3),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.red,
                          tabs: [
                            Tab(
                              text: "Ingredients".toUpperCase(),
                            ),
                            Tab(
                              text: "Preparation".toUpperCase(),
                            ),
                          ],
                          labelColor: Colors.black,
                          indicator: DotIndicator(
                            color: Colors.black,
                            distanceFromCenter: 16,
                            radius: 3,
                            paintingStyle: PaintingStyle.fill,
                          ),
                          unselectedLabelColor: Colors.black.withOpacity(0.3),
                          labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          labelPadding: const EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              //Ingredients(recipeModel: recipeModel),
                              //Ingredients(recipeModel: recipeModel as dynamic, key: key as dynamic,),
                          SingleChildScrollView(
                          child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: recipeModel?.ingredients?.length as int ,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    //child: Text('⚫️ ' + recipeModel?.ingredients![index] as String),
                                    child: Text('⚫️ '+ recipeModel?.ingredients![index] as String),
                                  );

                                //separatorBuilder: (BuildContext context, int index) {
                                  //return Divider(color: Colors.black.withOpacity(0.3));
                                },
                              ),
                            ],
                          ),
                        ),
                  ),
                              SizedBox(
                                //height: MediaQuery.of(context).size.height,
                                //child: Text("Preparation Tab")
                                //,
                                //child: Description(recipeModel: recipeModel as dynamic, key: key as dynamic,),


                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: Column(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemCount: recipeModel?.description?.length as int ,
                                          itemBuilder: (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                              ),
                                              //child: Text('⚫️ ' + recipeModel?.ingredients![index] as String),
                                              child: Text('⚫️ '+ recipeModel?.description![index] as String),
                                            );

                                            //separatorBuilder: (BuildContext context, int index) {
                                            //return Divider(color: Colors.black.withOpacity(0.3));
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),






                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SizedBox(
            height: 500,
            child: SingleChildScrollView(
              child: Stack(

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: recipeModel?.imgPath as String,
                        child: ClipRRect(
                        //child: SizedBox(
                          //width: 400.0,
                          //height: 390.0,
                          child: Image(
                            width: double.infinity,
                            height: (size.height / 2) + 50,
                            fit: BoxFit.cover,
                            image: AssetImage(recipeModel?.imgPath as dynamic),






                          ),
                        ),
                      ),
                    ],
                  ),
                  /*Positioned(
                    top: 40,
                    height: 10,
                    width: 10,
                    right: 50,
                    child: Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 38,
                    ),
                  ),*/
                  Positioned(
                    top: 40,
                    left: 20,
                    height: 30,
                    width: 30,
                    child: InkWell(
                      onTap: () {

                        Navigator.pop(context);
                      },
                      child: const Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );








  }

}

/*
class Ingredients extends StatelessWidget {
  const Ingredients({
    required Key key,
    required this.recipeModel,
  }) : super(key: key);

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: recipeModel.ingredients?.length as int ,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Text('⚫️ ' + recipeModel.ingredients![index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.black.withOpacity(0.3));
              },
            ),
          ],
        ),
      ),
    );
  }
}*/


/*
// description class

class Description extends StatelessWidget {
  const Description({
    required Key key,
    required this.recipeModel,
  }) : super(key: key);

  final RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: recipeModel.description?.length as int ,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Text('⚫️ ' + recipeModel.description![index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.black.withOpacity(0.3));
              },
            ),
          ],
        ),
      ),
    );
  }
}*/
