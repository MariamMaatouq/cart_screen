import 'package:flutter/material.dart';
import '../screen/paymentscreen.dart';
import '../widget/cart_list.dart';

import '../model/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<ProductModel> _products = [
    ProductModel(id: '1',
        description: 'Woman Style',
        img:
            'https://www.forevernew.com.au/media/catalog/product/A/l/AllTerritories_OnBody_25717201_F5.jpg',
        price: 122,
        title: 'Hot Pants'),
    ProductModel(id: '2',
        description: 'Woman Style',
        img:
            'https://www.lovehappensmag.com/blog/wp-content/uploads/2018/12/72517b48-f1ad-11e8-9fed-0242ac110002.png',
        price: 223,
        title: 'Casual Jeans'),
    ProductModel(id: '3',
        description: 'Woman Style',
        img:
        'https://www.lovehappensmag.com/blog/wp-content/uploads/2018/12/72517b48-f1ad-11e8-9fed-0242ac110002.png',
        price: 223,
        title: 'Casual Jeans')
  ];
  void _removeProduct(ProductModel product){
    final productIndex=_products.indexOf(product);
    setState(() {
      _products.remove(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(action:SnackBarAction(label: 'Undo', onPressed: (){
      setState(() {
        _products.insert(productIndex, product);
      });
    }),content: const Text('Product Deleted '),duration:const  Duration(seconds: 3),),);
  }

  @override
  Widget build(BuildContext context) {
    Widget Content = Center(child: Text('Obs You do not have products in your Card , fill it now  '));
    if(_products.isNotEmpty){
      Content=CartList(products: _products , removeProduct: _removeProduct);
    }
    return Scaffold( backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Center(
          child: Text(
            'Your Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),color: Colors.white,
            onPressed: () {
              // Handle back button press
            },
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child:Content ),
          ],
        ),
      ),
    );
  }
}
//
