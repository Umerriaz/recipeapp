import 'package:flutter/material.dart';
import 'package:recipeapp/NewRecipe.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*bottomNavigationBar: Container(

        // color: Colors.grey[300],
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              FlutterIcons.home_outline_mco,
              color: Colors.blue,
            ),
            Icon(
              FlutterIcons.account_group_outline_mco,
            ),
            Icon(
              FlutterIcons.heart_outlined_ent,
            ),
            Icon(
              FlutterIcons.account_outline_mco,
            ),
          ],
        ),
      ),*/
      body: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                tabs: [
                  Tab(
                    text: "New Recipes".toUpperCase(),
                  ),
                  /*Tab(
                    text: "Favourites".toUpperCase(),
                  ),*/
                  Tab(
                    text: "Biryani".toUpperCase(),
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
                  horizontal: 24,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    NewRecipe(),
                    /*Container(
                      child: Center(
                        child: Text(
                          'Favourite Section',
                        ),
                      ),
                    ),*/
                    Column(
                      children: [
                        const Image(
                           height: 320,
                           width: 320,
                           fit: BoxFit.cover,

                           image: AssetImage('assets/images/img1.jpg'),
                         ),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Biryani is a mixed rice dish originating among the Muslims of the Indian subcontinent. It is made with Indian spices, rice, either with meat (chicken, beef, goat, lamb, prawn, fish), or eggs or vegetables such as potatoes.'
                                'Biryani is one of the most popular dishes in South Asia, as well as among the diaspora from the region. It has gained popularity in Pakistan and South India, and is also prepared in other parts of the world such as Iraq. Biryani is the single most-ordered dish on Indian online food ordering and delivery services.',
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            ),
                          ),
                        ),





                      ],



                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
