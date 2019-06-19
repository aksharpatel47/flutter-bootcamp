// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceModel _$PriceModelFromJson(Map<String, dynamic> json) {
  return PriceModel(
      ask: (json['ask'] as num)?.toDouble(),
      last: (json['last'] as num)?.toDouble(),
      bid: (json['bid'] as num)?.toDouble(),
      high: (json['high'] as num)?.toDouble(),
      low: (json['low'] as num)?.toDouble());
}

Map<String, dynamic> _$PriceModelToJson(PriceModel instance) =>
    <String, dynamic>{
      'ask': instance.ask,
      'last': instance.last,
      'bid': instance.bid,
      'high': instance.high,
      'low': instance.low
    };
