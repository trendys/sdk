import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/transation_state.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  Transaction({
    required this.amount,
    required this.currency,
    required this.state,
    required this.acceptedAt,
    required this.createdAt,
  });

  final double amount;
  final String currency;
  @JsonKey(unknownEnumValue: TransactionState.unknown)
  final TransactionState state;
  @JsonKey(name: 'accepted_at')
  final DateTime? acceptedAt;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
