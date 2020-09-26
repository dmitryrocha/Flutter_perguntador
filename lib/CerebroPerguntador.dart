import 'dart:ffi';

import 'Pergunta.dart';

class CerebroPerguntador {

  int _perguntaNumero = 0;

  List<Pergunta> _listaDePerguntas = [
    Pergunta(pergunta:'Tonga é um país da África?', resposta:false),
    Pergunta(pergunta:'Limpar os ouvidos com cotonete é saudável?', resposta:false),
    Pergunta(pergunta:'A África está localizada nos quatro hemisférios terrestres (Hemisférios Norte, Sul, Ocidental e Oriental)?', resposta:true),
    Pergunta(pergunta:'Porto Rico é um país?', resposta:false),
    Pergunta(pergunta:'Carvão clareia os dentes?', resposta:false),
    Pergunta(pergunta:'Cães precisam ter filhotes antes da castração?', resposta:false),
    Pergunta(pergunta:'O Vaticano é mais densamente populoso que a China?', resposta:true),
    Pergunta(pergunta:'Palitar os dentes faz mal?', resposta:true),
    Pergunta(pergunta:'Avestruzes enterram a cabeça quando se sentem ameaçados?', resposta:false),
    Pergunta(pergunta:'O pescoço de uma girafa tem o mesmo número de vértebras quer o de um homem?', resposta:true),
    Pergunta(pergunta:'Morcegos são cegos?', resposta:false),
    Pergunta(pergunta:'A maior parte do oxigênio da Terra vem das árvores', resposta:false),
    Pergunta(pergunta:'A luz é afetada pela gravidade?', resposta:true),
    Pergunta(pergunta:'Ciranças têm mais ossos no corpo que adultos?', resposta:true),
    Pergunta(pergunta:'Está é a última pergunta?', resposta:true)
  ];

  void proximaPergunta() {
    if(_perguntaNumero < _listaDePerguntas.length){
      _perguntaNumero++;
    }
  }

  String getPergunta(_perguntaNumero) {
    return _listaDePerguntas[_perguntaNumero].pergunta;
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