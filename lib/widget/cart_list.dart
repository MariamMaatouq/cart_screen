import 'package:flutter/material.dart';
import '../widget/cart_item.dart';
import '../model/product.dart';
import '../screen/paymentscreen.dart';
class CartList extends StatefulWidget {
  const CartList({super.key,required this.products , required this.removeProduct});

 final List<ProductModel> products;
  final void Function(ProductModel product) removeProduct;

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.products.length,
            itemBuilder: (context, index) =>CartItem(product: widget.products[index], removeProduct:  widget.removeProduct,),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                const Text('Total Price ',style: TextStyle(fontWeight: FontWeight.w300),),
                Text('\$355',style: const TextStyle(fontSize:28,fontWeight: FontWeight.bold)),
              ],),
              SizedBox(height: 60, width: 200,
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentScreen(),));
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.blue.shade800 ,
                  ),
                  child: const Text('Check Out ',style: TextStyle(color: Colors.white , fontSize: 18),),),
              )
            ],
          ),
        )
      ],
    );

  }
}
