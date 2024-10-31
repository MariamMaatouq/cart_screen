import 'package:flutter/material.dart';
import '../model/product.dart';
class CartItem extends StatefulWidget {
  const CartItem({super.key , required this.product , required this.removeProduct });

  final ProductModel product;
  final void Function(ProductModel product) removeProduct;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int counter=1;
  bool _isChecked=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Card( color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
           elevation: 3,
           margin:const  EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)
                    ),
                    child:Image.network(widget.product.img,height:130 ,fit: BoxFit.cover, width: 90,),
                  ),

                  const SizedBox(width: 16,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.product.title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text(widget.product.description,style:const  TextStyle(fontWeight: FontWeight.w300)),
                       const  SizedBox(height: 24,),
                        Text('\$${widget.product.price}',style: const  TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column( crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Checkbox(activeColor: Colors.blue[800],
                          shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                        ) ,
                          value: _isChecked, onChanged:(value) { setState(() {
                          _isChecked = value!;
                        });},),
                        const SizedBox(height: 32,),
                        Container(width: 110,height: 30,
                          decoration: BoxDecoration(border: Border.all(width: 0.5), borderRadius: BorderRadius.circular(25),),
                          child: Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){setState(() {

                             if(counter==1){
                               widget.removeProduct(widget.product);
                             }else{
                               counter--;
                             }
                            });},
                                icon: const Icon(Icons.remove),iconSize: 15),
                            Text('${counter}'),
                            IconButton(onPressed: (){setState(() {
                              counter++;
                              //total
                            });},
                                icon:const  Icon(Icons.add),iconSize: 15,)
                          ],
                        ) ,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}
