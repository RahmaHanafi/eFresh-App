import 'package:efresh_app/product_detials.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: eFreshApp(),
    );
  }
}

class eFreshApp extends StatefulWidget {
  @override
  eFreshAppState createState() => eFreshAppState();
}

class Product {
  final String name;
  final String image;
  final double weight;
  final double price;
  Product({
    required this.name,
    required this.image,
    required this.weight,
    required this.price,});
}

class eFreshAppState extends State<eFreshApp> {

  List<Product> fruits=[
    Product(name: 'Mango',
      image: 'https://www.nicepng.com/png/full/22-220781_mango-png-image-slice-mango-png.png',
      weight: 1,
      price: 6.25,),
    Product(name: 'Strawberry',
      image: 'https://i.pinimg.com/originals/09/73/d7/0973d7e2c655d60f8aaef22812df22ae.png',
      weight: 1,
      price: 5.30,),
    Product(name: 'Bananas',
      image: 'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1024-80.jpg.webp',
      weight: 1,
      price: 4.5,),
    Product(name: 'Apples',
      image: 'http://www.lap-biella.com/public/foto/01059.jpg',
      weight: 1,
      price: 3.65,),
    Product(name: 'Oranges',
      image: 'https://www.freepnglogos.com/uploads/orange-png/orange-png-image-purepng-transparent-png-29.png',
      weight: 1,
      price: 2.5,),
  ];

  int _selectedIndex = 0;
  bool get isHome{
    if(_selectedIndex==0)
      return true;
    else
      return false;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eFresh',
          style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold,),),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.search),
            color: Colors.grey,
            onPressed: () {
              print('Search Button is clickable');
            },
          ),
        ],
      ),
      body:isHome? SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(image: NetworkImage('https://get.wallhere.com/photo/colorful-food-fruit-berries-salad-1805469.jpg')),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            child: Text('Free Delivery',
                              style: TextStyle(color: Colors.lightGreen,
                                fontSize: 15.0,
                              ),
                            ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.lightGreen,
                            ),
                            color: Colors.green.shade50,
                          ),
                          height: 40.0,
                          width: 100.0,
                        ),
                        SizedBox(width: 10.0,),
                        Container(
                          child: Text('Near Me',style: TextStyle(color: Colors.amber,
                              fontSize: 15.0,
                            ),
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.amber,
                            ),
                            color: Colors.yellow.shade100,
                          ),
                          height: 40.0,
                          width: 70.0,
                        ),
                        SizedBox(width: 10.0,),
                        Container(
                          child: Text('Popular',style: TextStyle(color: Colors.red,
                              fontSize: 15.0,
                            ),
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                            ),
                            color: Colors.red.shade50,
                          ),
                          height: 40.0,
                          width: 70.0,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    Text('Fresh Sale',style: TextStyle(color: Colors.lightGreen,fontSize: 18.0),),
                    SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => buildProductItem(fruits[index]),
                        itemCount: fruits.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            ],
        ),
      ):Text(''),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.white,
    );
  }
  Widget buildProductItem(Product fruit) => GestureDetector(
    onTap: (){
      Navigator.push(
        context,
          MaterialPageRoute(
              builder: (context)=> ProductDescription(
                image: fruit.image,
                name: fruit.name,
                weight: fruit.weight.toInt(),
                price: fruit.price,),
          ),
      );
    },
    child: Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10.0,
        bottom: 10.0,
        end: 10.0,
      ),
      child:Container(
        padding: EdgeInsetsDirectional.only(
          top: 10.0,
          start: 10.0,
          bottom: 10.0,
        ),
        width: 120.0,
        child: Column(
          children: [
            Image(image: NetworkImage('${fruit.image}'),
              width: 100,
              height: 100,),
            SizedBox(height: 3.0,),
            Text('${fruit.name}',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,),),
            SizedBox(height: 3.0,),
            Text('${fruit.weight.toInt()}KG',style: TextStyle(fontSize: 13.0,color: Colors.grey),),
            SizedBox(height: 3.0,),
            Text('\$${fruit.price}',style: TextStyle(fontSize: 13.0,color: Colors.red),),
            SizedBox(height: 3.0,),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(3,0),
            ),
          ],
        ),
      ),
    ),
  );
}