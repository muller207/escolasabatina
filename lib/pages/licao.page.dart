import 'package:escolasabatina/models/licao.model.dart';
import 'package:escolasabatina/repositories/post.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
//import 'package:flutter_markdown/flutter_markdown.dart';

class LicaoPage extends StatelessWidget {
  final Licao licao;
  final repository = new PostRepository();

  LicaoPage({@required this.licao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(licao.title),
      ),
      body: FutureBuilder(
          future: repository.getContent(licao.link),
          builder: (ctx, snp) {
            if (snp.hasData) {
              return SingleChildScrollView(
                child: Html(
                  data: snp.data,
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
