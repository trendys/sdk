import 'package:dio/dio.dart';
import 'package:trendys_sdk/config/api.dart';
import 'package:trendys_sdk/config/app_logger.dart';
import 'package:trendys_sdk/config/interceptors/authentication_interceptor.dart';
import 'package:trendys_sdk/config/interceptors/logger_interceptor.dart';
import 'package:trendys_sdk/config/session_manager.dart';
import 'package:trendys_sdk/enums/environment.dart';
import 'package:trendys_sdk/providers/action/action_provider.dart';
import 'package:trendys_sdk/providers/authentication/authentication_provider.dart';
import 'package:trendys_sdk/providers/brand/brand_provider.dart';
import 'package:trendys_sdk/providers/categorizing/categorizing_provider.dart';
import 'package:trendys_sdk/providers/category/category_provider.dart';
import 'package:trendys_sdk/providers/component/component_provider.dart';
import 'package:trendys_sdk/providers/image/image_provider.dart';
import 'package:trendys_sdk/providers/influencer/influencer_provider.dart';
import 'package:trendys_sdk/providers/item/item_provider.dart';
import 'package:trendys_sdk/providers/package/package_provider.dart';
import 'package:trendys_sdk/providers/point/point_provider.dart';
import 'package:trendys_sdk/providers/session/session_provider.dart';
import 'package:trendys_sdk/providers/user/user_provider.dart';
import 'package:trendys_sdk/providers/wallet/wallet_provider.dart';
import 'package:trendys_sdk/repositories/action_repository.dart';
import 'package:trendys_sdk/repositories/authentication_repository.dart';
import 'package:trendys_sdk/repositories/brand_repository.dart';
import 'package:trendys_sdk/repositories/categorizing_repository.dart';
import 'package:trendys_sdk/repositories/category_repository.dart';
import 'package:trendys_sdk/repositories/component_repository.dart';
import 'package:trendys_sdk/repositories/image_repository.dart';
import 'package:trendys_sdk/repositories/influencer_repository.dart';
import 'package:trendys_sdk/repositories/item_repository.dart';
import 'package:trendys_sdk/repositories/package_repository.dart';
import 'package:trendys_sdk/repositories/point_repository.dart';
import 'package:trendys_sdk/repositories/session_repository.dart';
import 'package:trendys_sdk/repositories/user_repository.dart';
import 'package:trendys_sdk/repositories/wallet_repository.dart';

class TrendysSDK {
  TrendysSDK({required Environment environment, String globalKey = 'trendys'}) {
    final dioOptions = Api.dioOptions;

    switch (environment) {
      case Environment.production:
        dioOptions.baseUrl = 'https://api.app.trendys.fr';
        break;

      case Environment.staging:
        dioOptions.baseUrl = 'https://api.app.staging.trendys.fr';
        break;

      default:
        throw ArgumentError('environment is invalid');
    }

    _logger = AppLogger();
    _logger.newSession();

    final authenticationDio = Dio(dioOptions);
    authenticationDio.interceptors.add(LoggerInterceptor(
      logger: _logger,
    ));

    _sessionManager = SessionManager(globalKey);
    _authenticationRepository = AuthenticationRepository(
      authenticationProvider: AuthenticationProvider(authenticationDio),
      sessionManager: _sessionManager,
    );

    _dio = Dio(dioOptions);
    _dio.interceptors.add(LoggerInterceptor(
      logger: _logger,
    ));
    _dio.interceptors.add(AuthenticationInterceptor(
      dio: _dio,
      authenticationRepository: _authenticationRepository,
      sessionManager: _sessionManager,
    ));

    _userRepository = UserRepository(
      userProvider: UserProvider(_dio),
      sessionProvider: SessionProvider(_dio),
      sessionManager: _sessionManager,
    );

    _sessionRepository = SessionRepository(
      sessionProvider: SessionProvider(_dio),
    );

    _walletRepository = WalletRepository(
      walletProvider: WalletProvider(_dio),
    );

    _influencerRepository = InfluencerRepository(
      influencerProvider: InfluencerProvider(_dio),
      actionProvider: ActionProvider(_dio),
    );

    _packageRepository = PackageRepository(
      packageProvider: PackageProvider(_dio),
    );

    _actionRepository = ActionRepository(
      actionProvider: ActionProvider(_dio),
    );

    _itemRepository = ItemRepository(
      itemProvider: ItemProvider(_dio),
    );

    _brandRepository = BrandRepository(
      brandProvider: BrandProvider(_dio),
    );

    _categoryRepository = CategoryRepository(
      categoryProvider: CategoryProvider(_dio),
    );

    _categorizingRepository = CategorizingRepository(
      categorizingProvider: CategorizingProvider(_dio),
    );

    _componentRepository = ComponentRepository(
      componentProvider: ComponentProvider(_dio),
    );

    _imageRepository = ImageRepository(
      imageProvider: ImageProvider(_dio),
    );

    _pointRepository = PointRepository(
      pointProvider: PointProvider(_dio),
    );
  }

  late final Dio _dio;
  late final AppLogger _logger;
  late final SessionManager _sessionManager;
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;
  late final SessionRepository _sessionRepository;
  late final WalletRepository _walletRepository;
  late final InfluencerRepository _influencerRepository;
  late final PackageRepository _packageRepository;
  late final ActionRepository _actionRepository;
  late final ItemRepository _itemRepository;
  late final BrandRepository _brandRepository;
  late final CategoryRepository _categoryRepository;
  late final CategorizingRepository _categorizingRepository;
  late final ComponentRepository _componentRepository;
  late final ImageRepository _imageRepository;
  late final PointRepository _pointRepository;

  AppLogger get logger => _logger;

  AuthenticationRepository get authenticationRepository => _authenticationRepository;

  UserRepository get userRepository => _userRepository;

  SessionRepository get sessionRepository => _sessionRepository;

  WalletRepository get walletRepository => _walletRepository;

  InfluencerRepository get influencerRepository => _influencerRepository;

  PackageRepository get packageRepository => _packageRepository;

  ActionRepository get actionRepository => _actionRepository;

  ItemRepository get itemRepository => _itemRepository;

  BrandRepository get brandRepository => _brandRepository;

  CategoryRepository get categoryRepository => _categoryRepository;

  CategorizingRepository get categorizingRepository => _categorizingRepository;

  ComponentRepository get componentRepository => _componentRepository;

  ImageRepository get imageRepository => _imageRepository;

  PointRepository get pointRepository => _pointRepository;
}
