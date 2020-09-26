import 'package:Perguntador/CerebroPerguntador.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

CerebroPerguntador cerebroPerguntador = CerebroPerguntador();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> placar = [];
  int count = 0;

  void checagem(bool respostaDada) {
    setState(() {
      if (respostaDada ==
          cerebroPerguntador
              .getResposta(cerebroPerguntador.getPerguntaNumero())) {
        placar.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
        count++;
      } else {
        placar.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if(cerebroPerguntador.getPerguntaNumero() < cerebroPerguntador.tamanhoLista()-1) {
        cerebroPerguntador.proximaPergunta();
      } else {
        placar = [];
        cerebroPerguntador.perguntaNumero(0);
        Alert(
          context: context,
          type: AlertType.error,
          title: "Acabou o jogo!",
          desc: "Seu placar foi de: $count\nAperte o botão para começar de novo.",
          buttons: [
            DialogButton(
              child: Text(
                "Reiniciar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  cerebroPerguntador.perguntaNumero(0);
                });
              }
            )
          ],
        ).show();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                cerebroPerguntador
                    .getPergunta(cerebroPerguntador.getPerguntaNumero()),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checagem(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checagem(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: placar,
          // Icon(
          //   Icons.check,
          //   color: Colors.green,
          // ),
          // Icon(
          //   Icons.close,
          //   color: Colors.red,
          // ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
