// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    amount: (json['amount'] as num).toDouble(),
    currency: json['currency'] as String,
    state: _$enumDecode(_$TransactionStateEnumMap, json['state'],
        unknownValue: TransactionState.unknown),
    acceptedAt: json['accepted_at'] == null
        ? null
        : DateTime.parse(json['accepted_at'] as String),
    createdAt: DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currency': instance.currency,
      'state': _$TransactionStateEnumMap[instance.state],
      'accepted_at': instance.acceptedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TransactionStateEnumMap = {
  TransactionState.unknown: 'unknown',
  TransactionState.created: 'created',
  TransactionState.accepted: 'accepted',
  TransactionState.canceled: 'canceled',
  TransactionState.refused: 'refused',
};
