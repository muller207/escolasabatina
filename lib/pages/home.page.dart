import 'package:escolasabatina/models/licao.model.dart';
import 'package:escolasabatina/pages/licao.page.dart';
import 'package:escolasabatina/repositories/post.repository.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var repository = new PostRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lições'),
      ),
      body: FutureBuilder(
        future: repository.getLicoes(START_URL),
        builder: (ctx, snp) {
          if (snp.hasData) {
            List<Licao> licoes = snp.data;
            return ListView.builder(
              itemCount: licoes.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(licoes[i].title),
                  subtitle: Text(licoes[i].periodo),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LicaoPage(licao: licoes[i]),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
