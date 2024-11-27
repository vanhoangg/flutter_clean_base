import '../../constant/definition/enums.dart';

class EnumUtil {
  static int genderConvertEnumToInt(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 0;
      case Gender.female:
        return 1;
      case Gender.total:
        return 2;
    }
  }

  static Gender genderConvertIntToEnum(int gender) {
    switch (gender) {
      case 0:
        return Gender.male;
      case 1:
        return Gender.female;
      case 2:
        return Gender.total;
      default:
        return Gender.male;
    }
  }

  static int userTypeConvertEnumToInt(UserType userType) {
    switch (userType) {
      case UserType.client:
        return 3;
      case UserType.staff:
        return 2;
      case UserType.admin:
        return 1;
    }
  }

  static UserType userTypeConvertIntToEnum(int userType) {
    switch (userType) {
      case 3:
        return UserType.client;
      case 2:
        return UserType.staff;
      case 1:
        return UserType.admin;
      default:
        return UserType.client;
    }
  }

  static int transactionTypeConvertEnumToInt(TransactionType transactionType) {
    switch (transactionType) {
      case TransactionType.expense:
        return 0;
      case TransactionType.receive:
        return 1;
    }
  }

  static TransactionType transactionTypeConvertIntToEnum(int transactionType) {
    switch (transactionType) {
      case 0:
        return TransactionType.expense;
      case 1:
        return TransactionType.receive;
      default:
        return TransactionType.expense;
    }
  }

  static int staffSortTypeConvertEnumToInt(StaffSortType sortType) {
    switch (sortType) {
      case StaffSortType.nearest:
        return 1;
      case StaffSortType.newest:
        return 2;
      case StaffSortType.bestRate:
        return 3;
      case StaffSortType.foreignLanguage:
        return 4;
    }
  }

  static StaffSortType staffSortTypeConvertEIntToEnum(int sortType) {
    switch (sortType) {
      case 1:
        return StaffSortType.nearest;
      case 2:
        return StaffSortType.newest;
      case 3:
        return StaffSortType.bestRate;
      case 4:
        return StaffSortType.foreignLanguage;
      default:
        return StaffSortType.nearest;
    }
  }

  static String staffSortTypeConvertEEnumToString(StaffSortType sortType) {
    switch (sortType) {
      case StaffSortType.nearest:
        return 'Gần đây';
      case StaffSortType.newest:
        return 'Mới';
      case StaffSortType.bestRate:
        return 'Đ.giá';
      case StaffSortType.foreignLanguage:
        return 'N.ngữ';
    }
  }

  static int serviceTypeConvertEnumToInt(ServiceType serviceType) {
    switch (serviceType) {
      case ServiceType.defaultService:
        return 0;
      case ServiceType.vip:
        return 1;
      case ServiceType.interest:
        return 2;
    }
  }

  static ServiceType serviceTypeConvertIntToEnum(int serviceType) {
    switch (serviceType) {
      case 0:
        return ServiceType.defaultService;
      case 1:
        return ServiceType.vip;
      case 2:
        return ServiceType.interest;
      default:
        return ServiceType.defaultService;
    }
  }

  static int bookingStatusConvertEnumToInt(BookingStatus bookingStatus) {
    switch (bookingStatus) {
      case BookingStatus.statusDefault:
        return 9;
      case BookingStatus.statusSearchForStaff:
        return -2;
      case BookingStatus.statusNewAndWaitForAccepting:
        return -1;
      case BookingStatus.statusWaitingAfterDurationExtended:
        return 0;
      case BookingStatus.statusCancelled:
        return 1;
      case BookingStatus.statusReadyAndWaitForComing:
        return 2;
      case BookingStatus.statusStartedByStaff:
        return 3;
      case BookingStatus.statusExtendedDuration:
        return 4;
      case BookingStatus.statusCompleted:
        return 5;
      case BookingStatus.statusRated:
        return 6;
      case BookingStatus.statusCancelledDurationExtension:
        return 7;
      case BookingStatus.statusEdited:
        return 8;
      case BookingStatus.statusNewFromInterestAndWaitForAccepting:
        return -3;
    }
  }

  static BookingStatus bookingStatusConvertIntToEnum(int bookingStatus) {
    switch (bookingStatus) {
      case 9:
        return BookingStatus.statusDefault;
      case -2:
        return BookingStatus.statusSearchForStaff;
      case -1:
        return BookingStatus.statusNewAndWaitForAccepting;
      case 0:
        return BookingStatus.statusWaitingAfterDurationExtended;
      case 1:
        return BookingStatus.statusCancelled;
      case 2:
        return BookingStatus.statusReadyAndWaitForComing;
      case 3:
        return BookingStatus.statusStartedByStaff;
      case 4:
        return BookingStatus.statusExtendedDuration;
      case 5:
        return BookingStatus.statusCompleted;
      case 6:
        return BookingStatus.statusRated;
      case 7:
        return BookingStatus.statusCancelledDurationExtension;
      case 8:
        return BookingStatus.statusEdited;
      case -3:
        return BookingStatus.statusNewFromInterestAndWaitForAccepting;
      default:
        return BookingStatus.statusDefault;
    }
  }

  static int paymentMethodConvertEnumToInt(PaymentMethod paymentMethod) {
    switch (paymentMethod) {
      case PaymentMethod.cash:
        return 0;
      case PaymentMethod.wallet:
        return 1;
    }
  }

  static PaymentMethod paymentMethodConvertIntToEnum(int paymentMethod) {
    switch (paymentMethod) {
      case 0:
        return PaymentMethod.cash;
      case 1:
        return PaymentMethod.wallet;
      default:
        return PaymentMethod.cash;
    }
  }

  static ResponseOTP getOTPResponseEnumFromString(String data) {
    switch (data) {
      case 'PHONE_ALREADY_VERIFIED':
        return ResponseOTP.verified;
      default:
        return ResponseOTP.nonError;
    }
  }

  static int channelTypeConvertToInt(ChannelType type) {
    switch (type) {
      case ChannelType.privateChat:
        return 2;
      case ChannelType.bookingChat:
        return 1;
    }
  }
}
