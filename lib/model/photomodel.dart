class Photomodel {
  String? url;
  srcmodel src;

  Photomodel({this.url, required this.src});

  factory Photomodel.fromJson(Map<String, dynamic> Parsedjson) {
    return Photomodel(
      url: Parsedjson["url"],
      src: srcmodel.fromMap(Parsedjson["src"]),
    );
  }
}

class srcmodel {
  String? Protrait;
  String? Large;
  String? Landscape;
  String? Medium;

  srcmodel({this.Protrait, this.Large, this.Landscape, this.Medium});

  factory srcmodel.fromMap(Map<String, dynamic> srcJson) {
    return srcmodel(
      Protrait: srcJson["portrait"],
      Landscape: srcJson["landscape"],
      Large: srcJson["large"],
      Medium: srcJson["medium"],
    );
  }
}
