import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';
@JsonSerializable()
class Country {
  String name;
  String region;
  String alpha2Code;
  Flags flags;
  Country(this.name, this.region, this.alpha2Code, this.flags);
  factory Country.fromJson(Map<String,dynamic> json) => _$CountryFromJson(json);
}

class Flags {
    String svg;
    String png;

    Flags({
        required this.svg,
        required this.png,
    });

    factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        svg: json["svg"],
        png: json["png"],
    );

    Map<String, dynamic> toJson() => {
        "svg": svg,
        "png": png,
    };
}