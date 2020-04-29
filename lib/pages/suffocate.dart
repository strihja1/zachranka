import 'package:flutter/material.dart';

class Suffocate extends StatefulWidget {
  @override
  _SuffocateState createState() => _SuffocateState();
}

class _SuffocateState extends State<Suffocate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Dušení"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  "Dušení je stav, kdy vdechnutí cizího tělesa způsobí částečnou, nebo úplnou neprůchodnost dýchacích cest. Neprůchodnost dýchacích cest může způsobit srdeční zástavu."),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pomoc při dušení",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              _textWithPaddingAbove(
                  "1. Podepřete jednou rukou hrudník postiženého, předkloňte ho dopředu tak, aby se cizí těleso dostalo ven ústy. Zápěstní hranou vaší druhé ruky prověďte až 5 rázných úderů mezi lopatky."),
              Image.network(
                  'https://www.tevapoint.cz/wp-content/uploads/2016/07/du%C5%A1en%C3%AD-ciz%C3%ADm-t%C4%9Blsem.jpg'),
              _textWithPaddingAbove(
                  "2. Pokud toto nepomohlo, proveďte až 5 stlačení nadbřišku zezadu. Postavte se k postiženému zezadu, obejměte ho a oběma rukama stlačujte nadbřišek."),
              Center(
                  child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/AbdominalThrust_HeimlichManoeuvre.svg/300px-AbdominalThrust_HeimlichManoeuvre.svg.png',
                height: 200,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _textWithPaddingAbove(String text) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Text(text),
  );
}
