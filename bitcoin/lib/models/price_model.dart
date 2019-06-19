import 'package:json_annotation/json_annotation.dart';
part 'price_model.g.dart';

@JsonSerializable()
class PriceModel {
  final double ask;
  final double last;
  final double bid;
  final double high;
  final double low;
  
  PriceModel({this.ask, this.last, this.bid, this.high, this.low});

  factory PriceModel.fromJson(Map<String, dynamic> json) =>
      _$PriceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriceModelToJson(this);
}
