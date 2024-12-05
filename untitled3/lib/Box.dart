import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class Box extends StatelessWidget {
  Box({Key?key ,required this.price,required this.brand,required this.type,required this.images_path,required this.i})
  {}
  var price;
  var brand;
  var type;
  var images_path;
  int i;
  @override
  Widget  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 120,
        height: 370,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 0),
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0,right: 7.0,top: 5.0),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: Image(
                        image: AssetImage(
                          "${images_path[i]}",
                        ),
                        width: 200,
                        height: 85,
                        fit: BoxFit.contain,
                      )),
                  Icon(Icons.favorite,color: Colors.red,)
                ],
                alignment: Alignment.topRight,
              ),
            ),
            Container(
              width: 200,
              height: 90,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 0),
                        blurRadius: 2)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${brand[i]}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "${type[i]}",
                      style:
                      TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${price[i]}\$",
                          style:
                          TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.w400),
                        ),

                        Icon(Icons.shopping_cart,color: Colors.green,)
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
