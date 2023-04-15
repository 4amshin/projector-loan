import 'package:flutter_cache_manager/flutter_cache_manager.dart';

final customCacheManager = CacheManager(
  Config(
    'customCacheKey',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 100,
  ),
); //For storing cache image in local