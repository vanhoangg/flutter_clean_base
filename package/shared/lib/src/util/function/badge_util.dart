// import 'package:collection/collection.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_app_badger/flutter_app_badger.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:tellme_flutter/app/model/response/notification/badge_data.dart';
// import 'package:tellme_flutter/app/use_case/user/check_authenticated_use_case.dart';
// import 'package:tellme_flutter/app/use_case/user/fetch_badge_use_case.dart';
// import 'package:tellme_flutter/app/util/app_log_util.dart';
// import 'package:tellme_flutter/app/util/check_null_util.dart';
// import 'package:tellme_flutter/di/di.dart';

// abstract class BadgeUtil {
//   static final List<BadgeData> _cache = [];
//   static final ReplaySubject<BadgeData> _subject = ReplaySubject<BadgeData>();

//   static Stream<BadgeData> stream = _subject.stream;

//   static Future add(BadgeData value) async {
//     final bool hasCache =
//         isNotNull(_cache.firstWhereOrNull((element) => element.id == value.id));
//     if (hasCache) {
//       _cache
//         ..removeWhere((element) => element.id == value.id)
//         ..add(value);
//     } else {
//       _cache.add(value);
//     }
//     _subject.add(value);

//     updateAppBadge(value);
//   }

//   static Future addBadges(List<BadgeData> values) async {
//     for (final value in values) {
//       add(value);
//     }
//   }

//   void close() {
//     _subject.close();
//   }

//   static Future fetchAndEmit() async {
//     final CheckAuthenticatedUseCase checkAuthenticatedUsecase = di();
//     final checkAuthResult = await checkAuthenticatedUsecase.call(const None());
//     await checkAuthResult.fold((l) {}, (r) async {
//       final FetchBadgeUseCase fetchBadgeUseCase = di();
//       final List<BadgeData> badges =
//           (await fetchBadgeUseCase.call(const None())).getOrElse(() => []);

//       BadgeUtil.addBadges(badges);
//     });
//   }

//   static Future<bool> _getBadgeSupport() async {
//     return await FlutterAppBadger.isAppBadgeSupported();
//   }

//   static Future reset() async {
//     for (final cache in _cache) {
//       _subject.add(BadgeData(id: cache.id, badgeText: ''));
//     }

//     final isAppBadgeSupported = await _getBadgeSupport();

//     if (isAppBadgeSupported) {
//       FlutterAppBadger.removeBadge();
//     }
//   }

//   static Future updateAppBadge(BadgeData value) async {
//     try {
//       final isAppBadgeSupported = await _getBadgeSupport();

//       if (!isAppBadgeSupported) {
//         return;
//       }

//       final int notificationBadgeCount = int.tryParse(value.badgeText) ?? 0;

//       if (notificationBadgeCount <= 0) {
//         FlutterAppBadger.removeBadge();
//       } else {
//         FlutterAppBadger.updateBadgeCount(notificationBadgeCount);
//       }
//     } catch (e, trace) {
//       AppLog.error('updateAppBadge ERROR', e, trace);
//     }
//   }

//   static void increaseAppBadge(String id) {
//     BadgeData? badge = _cache.firstWhereOrNull((element) => element.id == id);

//     if (isNotNull(badge)) {
//       final int badgeNumber = (badge!.getBadgeNumber) + 1;
//       badge = badge.copyWith(badgeText: '$badgeNumber');
//       add(badge);
//     }
//   }

//   static void decreaseAppBadge(String id) {
//     BadgeData? badge = _cache.firstWhereOrNull((element) => element.id == id);

//     if (isNotNull(badge)) {
//       final int badgeNumber =
//           ((badge!.getBadgeNumber) - 1).clamp(0, badge.getBadgeNumber);

//       badge = badge.copyWith(badgeText: '$badgeNumber');
//       add(badge);
//     }
//   }

//   static void resetAppBadge(String id) {
//     BadgeData? badge = _cache.firstWhereOrNull((element) => element.id == id);

//     if (isNotNull(badge)) {
//       const int badgeNumber = 0;

//       badge = badge!.copyWith(badgeText: '$badgeNumber');
//       add(badge);
//     }
//   }
// }
