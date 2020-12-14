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
        centerTitle: true,
        title: Text('Your Basket'),
        actions: [
          IconButton(
            color: Colors.red,
            icon: Icon(
              Icons.shopping_basket,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Card(
      //       margin: EdgeInsets.all(10.0),
      //       child: Padding(
      //         padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Row(
      //               children: [
      //                 Text(
      //                   'Deliver to',
      //                 ),
      //                 Icon(
      //                   Icons.assistant_navigation,
      //                   color: Colors.red,
      //                 )
      //               ],
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Center(
      //               child: Text(
      //                 'San Marino Residence, Cebu city',
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Card(
      //       margin: EdgeInsets.all(10.0),
      //       child: Padding(
      //         padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Center(
      //               child: Text(
      //                 'Place holder',
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     Card(
      //       margin: EdgeInsets.all(10.0),
      //       child: Padding(
      //         padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(2.0),
      //               child: Text(
      //                 'Payment',
      //                 style: TextStyle(
      //                   fontSize: 12,
      //                   color: Colors.grey[700],
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(2.0),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Icon(
      //                     Icons.attach_money,
      //                     color: Colors.grey[700],
      //                   ),
      //                   Text(
      //                     'CASH',
      //                     style: TextStyle(
      //                       fontSize: 12,
      //                       color: Colors.grey[700],
      //                     ),
      //                   ),
      //                   Icon(
      //                     Icons.check_box_rounded,
      //                     color: Colors.red[700],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(2.0),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Icon(
      //                     Icons.pages,
      //                     color: Colors.grey[700],
      //                   ),
      //                   Text(
      //                     'PROMO CODE',
      //                     style: TextStyle(
      //                       fontSize: 12,
      //                       color: Colors.grey[700],
      //                     ),
      //                   ),
      //                   Text(
      //                     'Enter Promo Code',
      //                     style: TextStyle(
      //                       fontSize: 10,
      //                       color: Colors.grey[500],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(2.0),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Icon(
      //                     Icons.wallet_giftcard,
      //                     color: Colors.grey[700],
      //                   ),
      //                   Text(
      //                     'PayMaya',
      //                     style: TextStyle(
      //                       fontSize: 12,
      //                       color: Colors.grey[700],
      //                     ),
      //                   ),
      //                   Text(
      //                     'Connect Account',
      //                     style: TextStyle(
      //                       fontSize: 10,
      //                       color: Colors.grey[500],
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //     RaisedButton(
      //       onPressed: () {},
      //       child: Text(
      //         'PLACE ORDER',
      //         style: TextStyle(
      //           color: Colors.white,
      //         ),
      //       ),
      //       color: Colors.red,
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(18.0),
      //           side: BorderSide(color: Colors.red)),
      //     )
      //   ],
      // ),
    );
  }
}
