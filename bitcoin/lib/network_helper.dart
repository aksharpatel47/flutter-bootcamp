import 'dart:convert';

import 'package:bitcoin_ticker/models/price_model.dart';
import 'package:http/http.dart' as http;

Future<PriceModel> getCryptoPricesFor({String crypto, String currency}) async {
  final url = "https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$currency";
  final result = await http.get(url);
  final jsonData = jsonDecode(result.body);
  return PriceModel.fromJson(jsonData);
}