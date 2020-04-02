import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //appbar
            SafeArea(
              top: true,
              left: true,
              right: true,
              bottom: true,
              child: Container(
                height: 64,
                child: Row(
                  children: <Widget>[
                    //search bar
                    Flexible(
                      flex: 9,
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                            decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        )),
                      ),
                    ),
                    //menu icon
                    Flexible(
                      flex: 2,
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //2nd part
            Container(
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //start categoris
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Top Categoris",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "shows all",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        //end categoris
                      )),
                  //start listview
                  Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: <Widget>[
                            categoris("assets/burger01.png", "Burger"),
                            categoris("assets/burger00.png", "Burger pack"),
                            categoris("assets/image.png", "Asian"),
                            categoris("assets/image2.png", "Mexico"),
                            //    categoris("assets/burger00", "Burger"),
                            //     categoris("assets/burger00", "Burger"),
                            //      categoris("assets/burger00", "Burger"),
                          ],
                        ),
                      )),
                  //end listview
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16, left: 8),
                child: Text(
                  "Recommend for you",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),

            //start listbuilder
            Container(
              height: 390,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: shop.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(9),
                      padding: EdgeInsets.all(10),
                      height: 160,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: <Widget>[
                          //for image
                          Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(shop[index].img),
                                        fit: BoxFit.cover)),
                              )),

                          Expanded(
                              flex: 7,
                              child: Container(
                                margin: EdgeInsets.all(9),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 8,
                                          child: Text(
                                            shop[index].tile,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: shop[index].islike
                                                ? IconButton(
                                                    icon: Icon(Icons.favorite,
                                                        color: Colors.red),
                                                    onPressed: () {
                                                      setState(() {
                                                        shop[index].islike =
                                                            !shop[index].islike;
                                                      });
                                                    },
                                                  )
                                                : IconButton(
                                                    icon: Icon(
                                                        Icons.favorite_border,
                                                        color: Colors.red),
                                                    onPressed: () {
                                                      setState(() {
                                                        shop[index].islike =
                                                            !shop[index].islike;
                                                      });
                                                    },
                                                  )),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      shop[index].food,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                    Text(shop[index].price,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoris(String pic, String txt) {
    return Container(
      width: 84,
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // color: Colors.black,
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("$pic"), fit: BoxFit.cover),
                shape: BoxShape.circle,
                color: Colors.orange[600]),
          ),
          Text(
            "$txt",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class Shop {
  String img;
  String tile;
  String food;
  String price;

  bool islike;

  Shop({this.img, this.tile, this.food, this.price, this.islike});
}

List<Shop> shop = [
  Shop(
    img: "https://cdn.pixabay.com/photo/2017/12/10/14/47/piza-3010062__340.jpg",
    tile: "Pizza and see more",
    food: "Mexican Pizza",
    price: "min order \$15.00",
    islike: false,
  ),
  Shop(
    img: "https://cdn.pixabay.com/photo/2015/04/08/13/13/food-712665__340.jpg",
    tile: "Faco fish and see more",
    food: "Italian Tayeraki food",
    price: "min order\$15.00",
    islike: false,
  ),
  Shop(
    img:
        "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246__340.jpg",
    tile: "Burger",
    food: "HamBurger",
    price: "min order\$10.00",
    islike: false,
  ),
  Shop(
    img:
        "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246__340.jpg",
    tile: "Burger",
    food: "HamBurger",
    price: "min order\$10.00",
    islike: false,
  ),
];
