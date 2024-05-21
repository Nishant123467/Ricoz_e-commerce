// lib/screens/product_detail_screen.dart

import 'package:e_commerce_ui/models/products.dart';
import 'package:flutter/material.dart';


class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
         centerTitle: true,
        title: Text(
          product.name,
          style: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w900,
            fontSize: 18,
            height: 1.22,
            color: Color(0xFF222222),
          ),
        ),
        
        actions: [
          IconButton(
            icon: Icon(Icons.share, size: 26),
            onPressed: () {
              // Add your share functionality here
            },
          ),
        ],
       
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.imageUrl.isNotEmpty
                ? Image.network(product.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover)
                : Icon(Icons.image, size: 200),
            SizedBox(height: 16.0),
            Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Lato',)),
            SizedBox(height: 8.0),
          //  Text('\$${product.price}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
           Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$${product.price}',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  height: 1.2,
                  color: Color(0xFF222222),
                ),
              ),
            ),
            SizedBox(height: 16.0),
           // Text(product.description),
            SizedBox(
              width: 343,
              height: 84,
              child: Text(
                product.description,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 1.5,
                  letterSpacing: -0.15,
                  color: Color(0xFF222222),
                ),
              ),
            ),
             SizedBox(height: 19),
            // Add to Cart button
            Spacer(), // Push the button to the bottom
            Padding(
              padding: const EdgeInsets.only(left: 16.0), // Left padding of 16px
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 343,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle add to cart action
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFDB3022), // Button color
                      onPrimary: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25), // Border radius
                      ),
                      elevation: 4, // Shadow elevation
                      shadowColor: Color(0x40D32626), // Shadow color with opacity
                    ),
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.43, // Line height
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), 
            //  ElevatedButton(
            //   onPressed: () {
            //     // Add functionality to add the product to the cart
            //     // You can define your logic here
            //   },
            //   style: ButtonStyle(
            //     minimumSize: MaterialStateProperty.all<Size>(
            //       Size(343, 48),
                  
            //     ),
            //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25),
            //       ),
            //     ),
            //     backgroundColor: MaterialStateProperty.all<Color>(
            //       Color(0xFFDB3022),
            //     ),
            //     elevation: MaterialStateProperty.all<double>(8),
            //     shadowColor: MaterialStateProperty.all<Color>(
            //       Color.fromRGBO(211, 38, 38, 0.25),
            //     ),
            //   ),
            //  child: Container(
            //     width: 93,
            //     height: 20,
              
            //     child: Center(
            //       child: Center(
            //         child: Text(
            //           'ADD TO CART',
            //           style: TextStyle(
                       
            //             fontWeight: FontWeight.w500,
            //             fontSize: 14,
            //             height: 1.43,
            //             color: Colors.white,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
