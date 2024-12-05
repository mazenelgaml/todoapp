import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class Item extends StatelessWidget {
  Item({Key?key ,required this.rate,required this.price,required this.brand,required this.sizes,required this.color,required this.type,required this.images_path})
  {}
  var rate;
  var price;
  var brand;
  var sizes;
  var color;
  var type;
  var images_path;
  var i;
  @override
  Widget  build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: 105,
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: const [
                 BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0),
                    blurRadius: 5)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                  child: Image(
                    image: AssetImage("${images_path[i]}"),
                    height: 105,
                    width: 105,
                    fit: BoxFit.fitHeight,
                  )),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${brand[i]}",
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 15),
                        ),
                      ],
                    ),
                    Text(
                      "${type[i]}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Color:",
                              style:  TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8),
                              child: Text(
                                "${color[i]}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding:
                                EdgeInsets.only(left: 30),
                                child: Text(
                                  "size:",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 8),
                                child: Text(
                                  "${sizes[i]}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${price[i]}\$",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 83),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 5,
                                height: 20,
                                child: RatingBar.builder(
                                  initialRating: rate[i],
                                  minRating: 1,
                                  direction: Axis.vertical,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    rating = i + 1;
                                    print(rating);
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 95),
                                child: Text(
                                  "(${rate[i]})",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
