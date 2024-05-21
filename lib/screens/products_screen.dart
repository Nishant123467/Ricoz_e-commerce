// lib/screens/product_list_screen.dart
import 'package:e_commerce_ui/models/products.dart';
import 'package:e_commerce_ui/screens/products_details_screen.dart';
import 'package:e_commerce_ui/services/api_services.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.grey[100],
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Text('Products',style: TextStyle(fontSize: 30,color: Colors.black),),

            ],
          ),
        ),
        Text('Super summer sale',style: TextStyle(fontSize: 14,color: Colors.grey[500]),),
      ],
    ),
  ),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available'));
          } else {
            return Container(
              //color: Colors.red,
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 8,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                  color: Colors.white, // Background color for image container
                                ),
                                child: product.imageUrl.isNotEmpty
                                    ? ClipRRect(
                                    borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                                    child: Image.network(product.imageUrl, fit: BoxFit.fill))
                                    : Icon(Icons.image, size: 50),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 130,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                                  color: Color(0xFFFFFFFF),
                                  // Background color for text container
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.end,
                                        children: List.generate(5, (index) => Image.asset("assets/images/star.png",width: 15,))..add(Text(" (10)",style: TextStyle(color: Colors.grey),))),
                                    SizedBox(height: 2),
                                    Text(
                                      "Subtitle",style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(height: 2),Text(
                                      product.name,
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '\$${product.price}',
                                      style: TextStyle(fontSize: 16, color: Colors.red,fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 8),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}


// import 'package:e_commerce_ui/models/products.dart';
// import 'package:e_commerce_ui/screens/products_details_screen.dart';
// import 'package:e_commerce_ui/services/api_services.dart';
// import 'package:flutter/material.dart';

// import 'package:e_commerce_ui/models/products.dart';
// import 'package:e_commerce_ui/screens/products_details_screen.dart';
// import 'package:e_commerce_ui/services/api_services.dart';
// import 'package:flutter/material.dart';

// class ProductListScreen extends StatefulWidget {
//   @override
//   _ProductListScreenState createState() => _ProductListScreenState();
// }

// class _ProductListScreenState extends State<ProductListScreen> {
//   late Future<List<Product>> futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     futureProducts = ApiService().fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: futureProducts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No products available'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final product = snapshot.data![index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailScreen(product: product),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     padding: EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.lightBlueAccent.withOpacity(0.1), // Background color
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: [
//                         product.imageUrl.isNotEmpty
//                             ? Image.network(product.imageUrl, width: 110, height: 110)
//                             : Icon(Icons.image, size: 50),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 product.name,
//                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 '\$${product.price}',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 product.description,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }



// class ProductListScreen extends StatefulWidget {
//   @override
//   _ProductListScreenState createState() => _ProductListScreenState();
// }

// class _ProductListScreenState extends State<ProductListScreen> {
//   late Future<List<Product>> futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     futureProducts = ApiService().fetchProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//       ),
//       body: FutureBuilder<List<Product>>(
//         future: futureProducts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No products available'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 final product = snapshot.data![index];
//                 return ListTile(
//                   leading: product.imageUrl.isNotEmpty
//                       ? Image.network(product.imageUrl, width: 110, height: 110)
//                       : Icon(Icons.image, size: 50),
//                   title: Text(product.name),
//                   subtitle: Text('\$${product.price}\n${product.description}'),
//                   isThreeLine: true,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ProductDetailScreen(product: product),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
