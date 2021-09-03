import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class YourCart extends StatefulWidget {
  final String name;
  final String image;
  final int weight;
  final double price;
  final bool addtoCart;
  YourCart({
    required this.addtoCart,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
  });
  @override
  YourCartState createState() => YourCartState(image: image,name: name,weight: weight,price: price,addtoCart: addtoCart,);
}



class YourCartState extends State<YourCart> {
  final String name;
  final String image;
   int weight;
  final double price;
  final bool addtoCart;
  YourCartState({
    required this.addtoCart,
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black87,size: 20.0,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Your Cart',style: TextStyle(color: Colors.black87,),),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: addtoCart?Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 4,
                ),
                ],
              ),
              child: Row(
                children: [
                  Image(image: NetworkImage(image),
                    width: 100.0,
                    height: 100.0,
                    ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(name,style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10.0,),
                        Text('\$'+price.toString(),style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                  Column(
                      children: [
                        FloatingActionButton(onPressed: (){
                          setState(() {
                              weight++;
                          });
                        },
                          child: Icon(Icons.add,color: Colors.white,),
                          mini: true,
                          backgroundColor: Colors.lightGreen,
                          heroTag: 'weight+',
                        ),
                        SizedBox(height: 5.0,),
                        Text(weight.toInt().toString(),style: TextStyle(fontSize: 18.0),),
                        SizedBox(height: 5.0,),
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            if(weight>1)
                              weight--;
                          });
                          },
                          child: Icon(Icons.remove,color: Colors.white,),
                          mini: true,
                          backgroundColor: Colors.lightGreen,
                          heroTag: 'weight-',
                        ),
                      ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ):Text(''),
    );
  }
}