import 'package:bigbys/colors.dart';
import 'package:bigbys/screens/order_slip_screen.dart';
// import 'package:bigbys/screens/order_slip_screen.dart';
import 'package:flutter/material.dart';

class Basket extends StatefulWidget {
  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: titleColor, //change your color here
        ),
        backgroundColor: canvasColor,
        centerTitle: true,
        title: Text(
          'Your Basket',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: titleColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: buttonColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: buttonColor,
                        ),
                        Text(
                          'Deliver to',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        'San Marino Residence, Cebu city',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Orders',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: titleColor,
                          ),
                        ),
                        ButtonTheme(
                          buttonColor: Colors.grey[300],
                          minWidth: 40,
                          height: 20,
                          child: RaisedButton(
                            onPressed: () {},
                            child: Text(
                              "CLEAR",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu 1',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            '400.00',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu 2',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey[700],
                            ),
                          ),
                          Icon(
                            Icons.dangerous,
                            color: buttonColor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu 3',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            '400.00',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 26, bottom: 26),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Amount',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '₱ 1,370.00',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Icon(
                          Icons.money,
                          color: Colors.grey[700],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Icon(
                          Icons.pages,
                          color: Colors.grey[700],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Icon(
                          Icons.credit_card,
                          color: Colors.grey[700],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Cash',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Promo Code',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'PayMaya',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        SizedBox(
                          height: 6,
                        ),
                        Icon(
                          Icons.check_box_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Enter Promo Code',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Poppins',
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Connect Account',
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Poppins',
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderSlip(),
                          ),
                        );
                      },
                      child: Text(
                        'PLACE ORDER',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
