import 'package:appdev_midterm/cubit/cubit/dark_mode_cubit.dart';
import 'package:appdev_midterm/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCard extends StatelessWidget {
  final Product product;

  const MyCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: BlocBuilder<DarkModeCubit, DarkModeState>(
          builder: (context, state) {
            return Stack(children: [
              Card(
                color: state is DarkModeFalse
                    ? Colors.white
                    : const Color.fromARGB(255, 15, 15, 15),
                elevation: 8,
                margin: EdgeInsets.all(2),
                shadowColor: Colors.black,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        child: Image.network(
                          fit: BoxFit.cover,
                          product.image,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        product.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: state is DarkModeTrue
                              ? const Color.fromARGB(255, 191, 191, 191)
                              : const Color.fromARGB(255, 15, 15, 15),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: const Color.fromARGB(255, 184, 146, 191),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  product.category.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color.fromARGB(255, 207, 152, 81),
                              ),
                              Text(
                                product.rating.rate.toString(),
                                style: TextStyle(
                                  color: state is DarkModeTrue
                                      ? const Color.fromARGB(255, 241, 239, 241)
                                      : const Color.fromARGB(255, 6, 6, 6),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: state is DarkModeFalse
                                ? const Color.fromARGB(255, 191, 191, 191)
                                : const Color.fromARGB(255, 15, 15, 15),
                          ),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart),
                              label: Text(
                                'Add To Cart',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: state is DarkModeFalse
                        ? const Color.fromARGB(255, 127, 73, 142)
                        : const Color.fromARGB(255, 181, 104, 212),
                  ),
                  child: const Icon(
                    Icons.heart_broken_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}
