import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  Wallet({
    required this.id,
    required this.balance,
    required this.currency,
  });

  final String id;
  final double balance;
  final String currency;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
