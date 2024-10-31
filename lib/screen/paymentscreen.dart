import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController _phoneNumberController = TextEditingController();
  late TextEditingController _addressController = TextEditingController();
  void _submit(){
    if(_phoneNumberController.text.trim().isEmpty ||_addressController.text.trim().isEmpty ){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Invalid Input',
          ),
          content: Text(
            'Please make sure a valid phone number  and  Address was enterd  ',
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'))
          ],
        ),
      );
      return;
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.indigo[900],
            title: Center(
              child: Text(
                'Payment',
                style: TextStyle(color: Colors.white),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )
        ),
      body: Padding(
        padding: const EdgeInsets.all(16),
          child: Column( mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const  SizedBox(
                width: 250.0,
                child: Text(
                  "Complete Your  Payment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 50,),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration:_buildInputDecoration('Phone Number', Icons.call) ,
              ),
              SizedBox(height: 16,),
              TextField(
                controller: _addressController,
                keyboardType: TextInputType.phone,
                decoration:_buildInputDecoration('Address', Icons.home) ,
              ),
              SizedBox(height: 16,),
              ListTile(
                title: Text('Cach on delivry',style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.directions_run,size:30 ,color: Colors.black,),
              ),
              Spacer(),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800),
                      onPressed:_submit ,
                      child:const  Text("Submit Order ",
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.white)))),
            ],
          ),
      )
    );
  }
}
InputDecoration _buildInputDecoration(String label, IconData suffixIcon) {
  return InputDecoration(
      fillColor: Colors.grey[50],
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)),
      focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      filled: true,
      labelStyle: TextStyle(color: Colors.black),
      labelText: label,
      suffixIcon: Icon(
        suffixIcon,
        color: Colors.black,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)));
}
