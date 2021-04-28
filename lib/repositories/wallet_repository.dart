import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/transaction.dart';
import 'package:trendys_sdk/models/responses/common/wallet.dart';
import 'package:trendys_sdk/providers/wallet/wallet_provider.dart';

class WalletRepository {
  WalletRepository({
    required WalletProvider walletProvider,
  }) : _walletProvider = walletProvider;

  WalletProvider _walletProvider;

  Future<Wallet> get(String walletId) async {
    return _walletProvider.get(walletId);
  }

  Future<HttpResponse<List<Transaction>>> transactions(String walletId, {PaginateFilters? paginate}) async {
    return _walletProvider.transactions(walletId, paginate: paginate);
  }
}
