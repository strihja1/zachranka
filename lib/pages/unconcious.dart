import 'package:flutter/material.dart';

class Unconsious extends StatefulWidget {
  @override
  _UnconsiousState createState() => _UnconsiousState();
}

class _UnconsiousState extends State<Unconsious> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Bezvědomí"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  "Je stav, kdy postižený nereaguje na hlasité oslovení a jemné zatřesení rameny. Vždy dbejte na svoji vlastní bezpečnost, i bezpečnost postiženého"),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pomoc při bezvědomí",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              _textWithPaddingAbove(
                  "1. Zprůchodněte dýchací cesty a zkontrolujte dýchání"),
              _textWithPaddingAbove("2. Zavolejte na tísňovou linku 155"),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Postižený nedýchá",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
              _textWithPaddingAbove(
                  "3. Ihned zahajte resuscitaci. Pokud je k dispozici, použijte externí defibrilátor AED."),
              _textWithPaddingAbove(
                  "4. Pokud není, klekněte si zboku vedle postiženého, umistěte zápestní část dlaně jedné ruky na střed hrudníku postiženého, druhou ruku přiložte shora a propleťte prsty obou rukou."),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.network(
                    "http://blog.mojeambulance.cz/wp-content/uploads/2020/03/resuscitace-e1584088549616.jpg"),
              ),
              _textWithPaddingAbove(
                  "5. Propněte svoje horní končetiny v loktech a začněte rytmicky stlačovat hrudník do hloubky 5-6 cm frekvencí 100-120 stlačení za minutu."),
              _textWithPaddingAbove(
                  "6. Po každém stlačení hrudník úplně uvolněte!"),
              _textWithPaddingAbove(
                  "7. Operátor na lince 155 nebo píseň Stayin' Alive od Bee Gees vám pomůže dosáhnout správné frekvence."),
              _textWithPaddingAbove(
                  "8. Pokračujte tak dlouho, dokud se postižený nezačne probouzet a bránit se, nebudete vystřídáni, nebo do úplného vyčerpání."),
              _textWithPaddingAbove(
                  "9. Srdeční masáž lze střídat s umělým dýcháním do úst pacienta v poměru 30 stlačení a 2 vdechy"),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Postižený dýchá",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
              _textWithPaddingAbove(
                  "3. Uložte postiženého do zotavovací polohy"),
              Image.network(
                  "https://hasicisvobodanadupou.wbs.cz/Prvni_pomoc/St.poloha.jpg"),
              _textWithPaddingAbove(
                  "4. Sledujte stav postiženého do příjezdu záchranné služby."),
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
