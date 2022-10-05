import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CartWidget extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  const CartWidget({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  TextEditingController numController = TextEditingController();
  double? totalSum;

  @override
  void initState() {
    totalSum = widget.price;
    numController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    numController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              width: screenSize.height * 0.13,
              child: Image(
                image: AssetImage(widget.image),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (numController.text == '1') {
                          return;
                        } else {
                          setState(() {
                            numController.text =
                                (int.parse(numController.text) - 1).toString();
                            totalSum =
                                int.parse(numController.text) * widget.price;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.remove),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: screenSize.width * 0.1,
                      width: screenSize.width * 0.1,
                      child: TextField(
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        controller: numController,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp('[0-9]'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              numController.text = '1';
                            } else {
                              return;
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        if (numController.text == '10') {
                          return;
                        } else {
                          setState(() {
                            numController.text =
                                (int.parse(numController.text) + 1).toString();
                            totalSum =
                                int.parse(numController.text) * widget.price;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Image.asset(
                                'assets/images/warning-sign.png',
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text('Quitar elemento'),
                            ],
                          ),
                          content: const Text('¿Quitar este elemento?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'CANCELAR',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'SI',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.trash,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '\$${totalSum.toString()}',
                  style: GoogleFonts.notoSerif(fontSize: 18),
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
