abstract class NetworkConfig {
  static const int receiveTimeout = 31000;
  static const int connectTimeout = 31000;
  static const sendTimeout = 31000;
}

abstract class EndPoint {
  static const List<String> listPathNotRequireToken = [
    loginPinCode,
    checkUserByPhone,
    searchAddressSuggest,
  ];
  // domain
  static const String appDomain = '/app';
  static const String chatDomain = '/chat';
  static const String walletDomain = '/app/wallet';
  static const String fileDomain = '/file';

  /// Auth
  static const String loginPinCode = '$appDomain/auth/login-pin-code';
  static const String checkUserByPhone = '$appDomain/auth/check-user-by-phone';
  static const String sentOtp = '$appDomain/auth/request-phone-otp';
  static const String validateOTP = '$appDomain/auth/validate-phone-otp';
  static const String registerClient = '$appDomain/auth/register-as-client';
  static const String registerStaff = '$appDomain/auth/register-as-staff';
  static const String resetPinCode = '$appDomain/auth/reset-pin-code';

  // Meta Data
  static const String getListInterest =
      '$appDomain/metadata/get-service-as-interest';
  static const String getSystemData = '$appDomain/system/get-feature-data';
  static const String updateSystemData =
      '$appDomain/system/update-feature-data';
  static const String getUserJob = '$appDomain/metadata/get-user-job';

  /// User
  static const String updateMyLocation = '$appDomain/user/update-my-location';
  static const String updateBookingTip =
      '$appDomain/user/update-my-booking-tip';
  static const String getBookingServices =
      '$appDomain/user/get-my-booking-service';
  static const String updateBookingServices =
      '$appDomain/user/update-my-booking-service';
  static const String getProfile = '$appDomain/user/get-my-profile';
  static const String updateProfile = '$appDomain/user/update-my-profile';
  static const String updatePinCode = '$appDomain/user/update-my-pin-code';
  static const String getMyBookingService =
      '$appDomain/user/get-my-booking-service';

  static const String updateMyDevice = '/app/user/update-my-device-info';
  static const String clearMyDevice = '/app/user/clear-my-device-info';
  static const String updateMyOnlineState = '/app/user/change-online-state';
  static const String updateMySocialStatus = '/app/user/update-my-status';

  static const String getDetailUserProfile =
      '$appDomain/user/get-detail-user-profile';
  static const String unblockUsers = '$appDomain/user/unblock-user';
  static const String getMyBlockUser = '$appDomain/user/get-my-blocked-user';

  /// Booking
  static const String getBooking = '$appDomain/service/get-for-booking';
  static const String nearbyStaffForClient =
      '$appDomain/booking/nearby-staff-for-client';
  static const String nearbyClientForStaff =
      '$appDomain/booking/nearby-client-for-staff';
  static const String openBookingClient =
      '$appDomain/booking/open-booking-by-client';
  static const String selectMemberByClient =
      '$appDomain/booking/select-member-by-client';
  static const String getMyCurrentBooking =
      '$appDomain/booking/get-my-current-booking';
  static const String cancelOpenedBooking =
      '$appDomain/booking/cancel-opened-booking';
  static const String getMyBookingHistory =
      '$appDomain/booking/get-my-booking-history';
  static const String scheduleBookingByClient =
      '$appDomain/booking/schedule-booking-by-client';
  static const String rateMyBooking = '$appDomain/booking/rate-my-booking';
  static const String deleteMyBooking = '$appDomain/booking/delete-my-booking';
  static const String getMyScheduledBooking =
      '$appDomain/booking/get-my-scheduled-booking';
  static const String acceptOpenedBookingByStaff =
      '$appDomain/booking/accept-opened-booking-by-staff';
  static const String startBookingByStaff =
      '$appDomain/booking/start-booking-by-staff';
  static const String completeBookingByClient =
      '$appDomain/booking/complete-booking-by-client';
  static const String acceptScheduledBookingByStaff =
      '$appDomain/booking/accept-scheduled-booking-by-staff';
  static const String cancelScheduledBookingByStaff =
      '$appDomain/booking/cancel-scheduled-booking-by-staff';

  /// Search
  static const String searchStaff =
      '$appDomain/booking/list_staff_for_exploring';

  /// CHAT
  static const String getListConversation = '$chatDomain/list-channel';
  static const String getConversationDetail = '$chatDomain/channel-detail';
  static const String getListMessageFromConversation = '$chatDomain/messages';
  static const String deleteConversation = '$chatDomain/delete-chat-channel';
  static const String createPrivateConversation =
      '$appDomain/$chatDomain/client-create-private-chat';

  /// Google maps
  static const String searchAddressSuggest = 'place/textsearch/json';

  // Wallet
  static const String myWallet = '$walletDomain/my-wallet';
  static const String giftStaff = '$walletDomain/gift-staff-by-client';

  /// Notification
  static const String fetchNotifications = '/app/noti/my-list-notification';
  static const String resetUnreadNotification =
      '/app/noti/reset-unread-notification';
  static const String fetchNotificationUnreadCount =
      '/app/noti/my-unread-notification';

  // File
  static const String uploadSingleFile = '/upload-file/execute';

  /// Trade
  static const String fetchFloor = '/market/list-product';

  static const String getListProductCategory = '/market/categories';

  static const String interestProduct = '/market/interest';

  static const String fetchInterestProduct = '/market/interests';
}

abstract class ErrorMessage {
  static const invalidResponse = 'Invalid response';
}

abstract class HttpCode {
  static const int unauthorized = 401;
  static const int maintain = 503;
  static const int badGateway = 502;
  static const int system = 500;
}

abstract class BookingSocketMessageType {
  static const String newBooking = 'NEW_BOOKING';
  static const String staffAccept = 'STAFF_ACCEPT';
  static const String clientSelect = 'CLIENT_SELECT';
  static const String clientNotSelect = 'CLIENT_NOT_SELECT';
  static const String staffReady = 'STAFF_READY';
  static const String startedBooking = 'STARTED_BOOKING';
  static const String clientCancel = 'CLIENT_CANCEL';
  static const String staffCancel = 'STAFF_CANCEL';
  static const String memberLocation = 'MEMBER_LOCATION';
  static const String memberArrived = 'MEMBER_ARRIVED';
  static const String completedBooking = 'COMPLETED_BOOKING';
  static const String newScheduledBooking = 'NEW_SCHEDULED_BOOKING';
  static const String staffAcceptScheduled = 'STAFF_ACCEPT_SCHEDULED';
  static const String staffCancelScheduled = 'STAFF_CANCEL_SCHEDULED';
  static const String clientCancelScheduled = 'CLIENT_CANCEL_SCHEDULED';
  static const String nearCompletedBooking = 'NEAR_COMPLETED_BOOKING';
  static const String completedBookingOneStaff = 'COMPLETED_BOOKING_ONE_STAFF';
  static const String nearStartBooking = 'NEAR_START_BOOKING';
  static const String startedScheduledBooking = 'STARTED_SCHEDULED_BOOKING';
  static const String clientCancelNoMember = 'CLIENT_CANCEL_NO_MEMBER';
}

abstract class BadgeConfig {
  static const String notification = 'notification';
}

String keyData = 'data';

abstract class ChatMessageEventType {
  static const String gotBlocked = 'GOT_BLOCKED';
  static const String didBlock = 'DID_BLOCK';
}
