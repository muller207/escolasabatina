import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:escolasabatina/models/dia.model.dart';
import 'package:escolasabatina/models/licao.model.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';

class PostRepository {
  Future<List<Licao>> getLicoes(String url) async {
    try {
      Response response = await Dio().get(url);
      var document = parse(response.data);
      Iterable decoded;
      List<Licao> l;
      List<Element> els = document.getElementsByClassName('licoes');
      //els.forEach((element) {
      decoded = jsonDecode(els.first.innerHtml);
      l = decoded.map((x) => Licao.fromJson(x)).toList();
      //});
      return l;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> getContent(String url) async {
    String s = '';
    Dia d;
    try {
      Response response = await Dio().get(url);
      var document = parse(response.data);
      List<Element> els = document.getElementsByClassName('conteudoLicaoDia');
      List<Element> dias = document.getElementsByClassName('descriptionText');
      for (var i = 0; i < els.length; i++) {
        //if(dias[i].innerHtml.isNotEmpty)
          d = new Dia(title: dias[i].innerHtml, conteudo: els[i].innerHtml);
      }
      /*els.forEach((element) {
        s += element.innerHtml;
      });*/
      return d.conteudo;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
