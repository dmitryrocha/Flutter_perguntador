import 'dart:ffi';

import 'Pergunta.dart';

class CerebroPerguntador {

  int _perguntaNumero = 0;

  List<Pergunta> _listaDePerguntas = [
    Pergunta('Tonga é um país da África?', false),
    Pergunta('Limpar os ouvidos com cotonete é saudável?', false),
    Pergunta('A África está localizada nos quatro hemisférios terrestres (Hemisférios Norte, Sul, Ocidental e Oriental)?', true),
    Pergunta('Porto Rico é um país?', false),
    Pergunta('Carvão clareia os dentes?', false),
    Pergunta('Cães precisam ter filhotes antes da castração?', false),
    Pergunta('O Vaticano é mais densamente populoso que a China?', true),
    Pergunta('Palitar os dentes faz mal?', true),
    Pergunta('Avestruzes enterram a cabeça quando se sentem ameaçados?', false),
    Pergunta('O pescoço de uma girafa tem o mesmo número de vértebras quer o de um homem?', true),
    Pergunta('Morcegos são cegos?', false),
    Pergunta('A maior parte do oxigênio da Terra vem das árvores', false),
    Pergunta('A luz é afetada pela gravidade?', true),
    Pergunta('Ciranças têm mais ossos no corpo que adultos?', true),
    Pergunta('Está é a última pergunta?', true)
  ];

  void proximaPergunta() {
    if(_perguntaNumero < _listaDePerguntas.length){
      _perguntaNumero++;
    }
  }

  String getPergunta(_perguntaNumero) {
    return _listaDePerguntas[_perguntaNumero].pregunta;
  }

  bool getResposta(_perguntaNumero) {
    return _listaDePerguntas[_perguntaNumero].resposta;
  }

  int getPerguntaNumero() {
    return _perguntaNumero;
  }

  int tamanhoLista() {
    return _listaDePerguntas.length;
  }

  void perguntaNumero(int value) {
    _perguntaNumero = value;
  }

}