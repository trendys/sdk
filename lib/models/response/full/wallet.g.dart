// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet(
    id: json['id'] as String,
    balance: (json['balance'] as num)?.toDouble(),
    currency: json['currency'] as String,
  );
}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'currency': instance.currency,
    };
