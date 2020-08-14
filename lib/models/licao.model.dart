class Licao {
  String img;
  String title;
  String verso;
  String periodo;
  String link;

  Licao({this.img, this.title, this.verso, this.periodo, this.link});

  Licao.fromJson(Map<String, dynamic> json) {
    img = json['img'];
    title = json['title'];
    verso = json['verso'];
    periodo = json['periodo'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['title'] = this.title;
    data['verso'] = this.verso;
    data['periodo'] = this.periodo;
    data['link'] = this.link;
    return data;
  }
}
