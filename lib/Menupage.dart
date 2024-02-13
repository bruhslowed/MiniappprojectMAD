import 'package:flutter/material.dart';
import 'package:project1_hungry/checkoutpage.dart';
import 'dialogformenu.dart';

class MenuItem extends StatefulWidget {
  final String optionName;
  final String imagePath;
  final int price;
  final int indexnumber;
  final Function(String, bool, int, int) onchangedf;
  final Function(String, bool, int, int) numc;
  final List<String> info = [
    "To put it simply, it is a different class of durian and the emperor of all. Think you have tasted the best durians? Well, you’ve got to try the Black Gold durian which is the enhanced and more premium version of Mao Shan Wang durians!",
    "The Mao Shan Wang is the most popular variety, with its extremely creamy and rich taste. Enjoy the bittersweet succulent meat that will tantalize your taste buds.",
    "The Red Prawn durian is perfect for those with a sweet tooth. The texture is creamy and has a very fruity sweet taste. The shells are thick and hard to open and has a dusky brown colour. The colour of the flesh is very different as it usually has an orange to red hue which makes it so distinctive.",
    "The Black Pearl Durian variety is said to have originated in Johor Malaysia. Also known as Hei Zhen Zhu, black pearl has a pale yellow grayish color. The texture is smooth and creamy and the taste is slightly bitter. The husk or pericarp is color yellow- green which will slightly change to brown when ripe.",
    "One of the key attributes that set Butter King Durians apart is their unique flavour profile. When ripe, these durians offer a delectable combination of sweetness and creaminess that is truly exceptional. The flesh of the Butter King Durian is smooth and buttery, with a velvety texture that melts in your mouth. It is notably less fibrous compared to other durian varieties, allowing for a more enjoyable eating experience.",
    "This is Horlor, a durian famous in Penang, Malaysia for its thick, nearly peanut-butter-like consistency. It’s not going to get stuck to the roof of your mouth, but you will want to eat it more slowly than its wetter cousins.As for taste, Horlor is pretty high on the bitter scale, up there with Lin Feng-jiao (Jackie Chan’s Wife). This one was chocolatey with slight numbness in some bites, a nuance that only an old tree can give. But with all these wrinkles, you already knew this was from an old tree "
  ];
  MenuItem(
      {required this.optionName,
      required this.imagePath,
      required this.onchangedf,
      required this.price,
      required this.numc,
      required this.indexnumber});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool isChecked = false;
  int selectedQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.lightGreenAccent,
        child: Column(
          children: [
            Image.asset(
              widget.imagePath,
              height: 100, // Adjust the height as needed
            ),
            SizedBox(height: 8), // Add spacing between image and text
            Text(
              widget.optionName + "  \$" + widget.price.toString(),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8), // Add spacing before button and checkbox
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Durian Info for " + widget.optionName),
                            content: Text(info[widget.indexnumber]),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                  child: Text("View details"),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                  ),
                ),
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                        widget.onchangedf(widget.optionName, isChecked,
                            widget.price, selectedQuantity);
                      });
                    }),
                DropdownButton<int>(
                  value: selectedQuantity,
                  onChanged: (value) {
                    setState(() {
                      selectedQuantity = value!;
                      widget.numc(widget.optionName, isChecked, widget.price,
                          selectedQuantity);
                    });
                  },
                  items: List.generate(10, (index) => index + 1)
                      .map((quantity) => DropdownMenuItem<int>(
                            value: quantity,
                            child: Text('$quantity'),
                          ))
                      .toList(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Menupage extends StatelessWidget {
  final List<String> selectednames = [];
  final List<int> selectedprice = [];
  final List<int> qty = [];
  final List<String> optionNames = [
    'Black gold',
    'Mao shang wang',
    'Red prawn',
    'Black pearl',
    'Butter king',
    'D24'
  ];
  final List<String> imagestring = [
    'images/blackgold.jpg',
    'images/msw.png',
    'images/redprawn.jpg',
    'images/bpearl.jpg',
    'images/butterking.jpg',
    'images/d24.jpeg'
  ];

  final List<int> price = [124, 421, 411, 412, 41, 42];
  void onchangedcallback(
      String option, bool ischecked, int price, int quantity) {
    if (ischecked == true) {
      selectednames.add(option);
      selectedprice.add(price);
      qty.add(quantity);
      for (var element in selectednames) {
        print(element);
      }
      for (var element in selectedprice) {
        print(element);
      }
      for (var element in qty) {
        print(element);
      }
    } else {
      selectednames.remove(option);
      selectedprice.remove(price);
      qty.remove(quantity);
      for (var element in selectednames) {
        print(element);
      }
      for (var element in selectedprice) {
        print(element);
      }
      for (var element in qty) {
        print(element);
      }
    }
  }

  void qtychange(String option, bool ischecked, int price, int quantity) {
    if (ischecked == true) {
      int index = selectednames.indexOf(option);
      qty[index] = quantity;
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              physics:
                  NeverScrollableScrollPhysics(), // Disable scrolling within the GridView
              shrinkWrap:
                  true, // Enable GridView to take only the space it needs
              children: List.generate(
                imagestring.length,
                (index) => MenuItem(
                  optionName: optionNames[index],
                  imagePath: imagestring[index],
                  onchangedf: onchangedcallback,
                  price: price[index],
                  numc: qtychange,
                  indexnumber: index,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (selectednames.length <= 0) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Null selection"),
                            content: Text("You did not select any durians!"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Coutpg(
                                optionnames: selectednames,
                                optionprice: selectedprice,
                                quantity: qty,
                              )),
                    );
                  }
                },
                child: Text("Place Order"))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Menupage(),
  ));
}
