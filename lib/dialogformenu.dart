import 'package:flutter/material.dart';

final List<String> info = [
  "To put it simply, it is a different class of durian and the emperor of all. Think you have tasted the best durians? Well, you’ve got to try the Black Gold durian which is the enhanced and more premium version of Mao Shan Wang durians!",
  "The Mao Shan Wang is the most popular variety, with its extremely creamy and rich taste. Enjoy the bittersweet succulent meat that will tantalize your taste buds.",
  "The Red Prawn durian is perfect for those with a sweet tooth. The texture is creamy and has a very fruity sweet taste. The shells are thick and hard to open and has a dusky brown colour. The colour of the flesh is very different as it usually has an orange to red hue which makes it so distinctive.",
  "The Black Pearl Durian variety is said to have originated in Johor Malaysia. Also known as Hei Zhen Zhu, black pearl has a pale yellow grayish color. The texture is smooth and creamy and the taste is slightly bitter. The husk or pericarp is color yellow- green which will slightly change to brown when ripe.",
  "One of the key attributes that set Butter King Durians apart is their unique flavour profile. When ripe, these durians offer a delectable combination of sweetness and creaminess that is truly exceptional. The flesh of the Butter King Durian is smooth and buttery, with a velvety texture that melts in your mouth. It is notably less fibrous compared to other durian varieties, allowing for a more enjoyable eating experience.",
  "This is Horlor, a durian famous in Penang, Malaysia for its thick, nearly peanut-butter-like consistency. It’s not going to get stuck to the roof of your mouth, but you will want to eat it more slowly than its wetter cousins.As for taste, Horlor is pretty high on the bitter scale, up there with Lin Feng-jiao (Jackie Chan’s Wife). This one was chocolatey with slight numbness in some bites, a nuance that only an old tree can give. But with all these wrinkles, you already knew this was from an old tree "
];

class dmenu extends StatelessWidget {
  @override
  final String durianname;
  final int indexnumber;

  const dmenu({super.key, required this.durianname, required this.indexnumber});
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Durian Info for ' + durianname),
            content: Text(info[indexnumber]),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });

    return Container();
  }
}
