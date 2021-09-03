import 'package:efresh_app/your_cart.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatefulWidget {
  final String name;
  final String image;
  final int weight;
  final double price;
  ProductDescription({
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
  });
  @override
  ProductDescriptionState createState() => ProductDescriptionState(image: image,name: name,weight: weight,price: price);
}

class ProductDescriptionState extends State<ProductDescription>{
  final String name;
  final String image;
  final int weight;
  final double price;
  bool addtoCart =false;
  ProductDescriptionState({
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black87,size: 20.0,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('eFresh',
          style: TextStyle(color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> YourCart(
                  image: image,
                  name: name,
                  weight: weight.toInt(),
                  price: price,
                  addtoCart: addtoCart,
                ),
              ),
            );
          },
            icon: Icon(Icons.shopping_cart,
              color: Colors.green,size: 20.0,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image(image: NetworkImage(image),
                      width: 175,
                      height: 175,
                    ),
                    Text(name,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5.0,),
                    Text(weight.toString()+'KG',style: TextStyle(fontSize: 13.0,color: Colors.grey),),
                    SizedBox(height: 5.0,),
                    Text('\$'+price.toString(),style: TextStyle(fontSize: 13.0,color: Colors.red),),
                    SizedBox(height: 10.0,),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    blurRadius: 4,
                  ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text('Text text Text text text text text Text text text text text text text text text text text text text text text text text text text.',
                    style: TextStyle(color: Colors.grey[800],
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Text('Related items',
                    style: TextStyle(color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Container(
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
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: Column(
                        children: [
                          Text(name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                          SizedBox(height: 5.0,),
                          Text('\$'+price.toString(),style: TextStyle(color: Colors.grey),),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    Icon(Icons.favorite_border,color: Colors.grey,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              width: double.infinity,
              color: addtoCart? Colors.grey: Colors.lightGreen,
              child: TextButton(
                onPressed: (){
                  setState(() {
                    addtoCart=true;
                  });
              },
              child: Text(addtoCart? 'Added' : 'Add to Cart',
                style: addtoCart? TextStyle(color: Colors.black87,fontSize: 18.0,fontWeight: FontWeight.bold,):TextStyle(color: Colors.white,fontSize: 18.0,),
              ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}