import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/responses/common/transaction.dart';
import 'package:trendys_sdk/models/responses/common/wallet.dart';

part 'wallet_provider.g.dart';

@RestApi()
abstract class WalletProvider {
  factory WalletProvider(Dio dio, {String baseUrl}) = _WalletProvider;

  @GET('/wallets/{id}')
  Future<Wallet> get(@Path('id') String walletId);

  @GET('/wallets/{id}/transactions')
  Future<HttpResponse<List<Transaction>>> transactions(
    @Path('id') String walletId, {
    @Queries() PaginateFilters? paginate,
  });
}
