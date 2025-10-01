
import 'dart:convert';

LoginResponse welcomeFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String welcomeToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool success;
  String message;
  Data data;

  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  String id;
  RestaurantId restaurantId;
  String waiterNameEnglish;
  String waiterNameArabic;
  String image;
  String countryCode;
  String countryIso;
  String mobileNumber;
  String email;
  String roleDesignation;
  DateTime dob;
  String password;
  dynamic otp;
  List<AssignedTable> assignedTables;
  bool isBlocked;
  String language;
  String accessToken;
  bool isActive;
  String waiterId;
  String deviceToken;
  int createdAt;
  int updatedAt;

  Data({
    required this.id,
    required this.restaurantId,
    required this.waiterNameEnglish,
    required this.waiterNameArabic,
    required this.image,
    required this.countryCode,
    required this.countryIso,
    required this.mobileNumber,
    required this.email,
    required this.roleDesignation,
    required this.dob,
    required this.password,
    required this.otp,
    required this.assignedTables,
    required this.isBlocked,
    required this.language,
    required this.accessToken,
    required this.isActive,
    required this.waiterId,
    required this.deviceToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    restaurantId: RestaurantId.fromJson(json["restaurantId"]),
    waiterNameEnglish: json["waiterNameEnglish"],
    waiterNameArabic: json["waiterNameArabic"],
    image: json["image"],
    countryCode: json["countryCode"],
    countryIso: json["countryISO"],
    mobileNumber: json["mobileNumber"],
    email: json["email"],
    roleDesignation: json["roleDesignation"],
    dob: DateTime.parse(json["dob"]),
    password: json["password"],
    otp: json["otp"],
    assignedTables: List<AssignedTable>.from(json["assignedTables"].map((x) => AssignedTable.fromJson(x))),
    isBlocked: json["isBlocked"],
    language: json["language"],
    accessToken: json["access_token"],
    isActive: json["isActive"],
    waiterId: json["waiterId"],
    deviceToken: json["deviceToken"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "restaurantId": restaurantId.toJson(),
    "waiterNameEnglish": waiterNameEnglish,
    "waiterNameArabic": waiterNameArabic,
    "image": image,
    "countryCode": countryCode,
    "countryISO": countryIso,
    "mobileNumber": mobileNumber,
    "email": email,
    "roleDesignation": roleDesignation,
    "dob": dob.toIso8601String(),
    "password": password,
    "otp": otp,
    "assignedTables": List<dynamic>.from(assignedTables.map((x) => x.toJson())),
    "isBlocked": isBlocked,
    "language": language,
    "access_token": accessToken,
    "isActive": isActive,
    "waiterId": waiterId,
    "deviceToken": deviceToken,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class AssignedTable {
  String id;
  String tableNumber;
  String restaurantId;
  int totalGuest;
  String qrcode;
  bool isBlocked;
  bool isActive;
  int createdAt;
  int updatedAt;

  AssignedTable({
    required this.id,
    required this.tableNumber,
    required this.restaurantId,
    required this.totalGuest,
    required this.qrcode,
    required this.isBlocked,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssignedTable.fromJson(Map<String, dynamic> json) => AssignedTable(
    id: json["_id"],
    tableNumber: json["tableNumber"],
    restaurantId: json["restaurantId"],
    totalGuest: json["totalGuest"],
    qrcode: json["qrcode"],
    isBlocked: json["isBlocked"],
    isActive: json["isActive"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "tableNumber": tableNumber,
    "restaurantId": restaurantId,
    "totalGuest": totalGuest,
    "qrcode": qrcode,
    "isBlocked": isBlocked,
    "isActive": isActive,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

class RestaurantId {
  String id;
  String countryCode;
  String countryIso;
  String mobileNumber;
  String coverImage;
  String profileImage;
  int otp;
  int profileType;
  List<dynamic> resCategory;
  String resName;
  String ownerFirstName;
  String ownerLastName;
  String email;
  String password;
  String payOutCycle;
  AddressDetails addressDetails;
  Documents documents;
  BankDetails bankDetails;
  OtherDetails otherDetails;
  bool isBlocked;
  bool isRestaurantInfoUpdated;
  bool isOtpVerified;
  bool isBankDetailsUpdated;
  bool isDocumentsUploaded;
  int profileCompletion;
  bool isLocationDetails;
  bool isDelivery;
  bool isPickUp;
  int restaurantStatus;
  int deviceType;
  int commissionValue;
  int commissionPercentage;
  String deviceToken;
  String accessToken;
  String rejectionType;
  String rejectedReason;
  String supplierId;
  String colorCode;
  String myFatoorahStatus;
  int createdAt;
  int rejectedAt;
  int updatedAt;
  String language;

  RestaurantId({
    required this.id,
    required this.countryCode,
    required this.countryIso,
    required this.mobileNumber,
    required this.coverImage,
    required this.profileImage,
    required this.otp,
    required this.profileType,
    required this.resCategory,
    required this.resName,
    required this.ownerFirstName,
    required this.ownerLastName,
    required this.email,
    required this.password,
    required this.payOutCycle,
    required this.addressDetails,
    required this.documents,
    required this.bankDetails,
    required this.otherDetails,
    required this.isBlocked,
    required this.isRestaurantInfoUpdated,
    required this.isOtpVerified,
    required this.isBankDetailsUpdated,
    required this.isDocumentsUploaded,
    required this.profileCompletion,
    required this.isLocationDetails,
    required this.isDelivery,
    required this.isPickUp,
    required this.restaurantStatus,
    required this.deviceType,
    required this.commissionValue,
    required this.commissionPercentage,
    required this.deviceToken,
    required this.accessToken,
    required this.rejectionType,
    required this.rejectedReason,
    required this.supplierId,
    required this.colorCode,
    required this.myFatoorahStatus,
    required this.createdAt,
    required this.rejectedAt,
    required this.updatedAt,
    required this.language,
  });

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    id: json["_id"],
    countryCode: json["countryCode"],
    countryIso: json["countryISO"],
    mobileNumber: json["mobileNumber"],
    coverImage: json["coverImage"],
    profileImage: json["profileImage"],
    otp: json["otp"],
    profileType: json["profileType"],
    resCategory: List<dynamic>.from(json["resCategory"].map((x) => x)),
    resName: json["resName"],
    ownerFirstName: json["ownerFirstName"],
    ownerLastName: json["ownerLastName"],
    email: json["email"],
    password: json["password"],
    payOutCycle: json["payOutCycle"],
    addressDetails: AddressDetails.fromJson(json["addressDetails"]),
    documents: Documents.fromJson(json["documents"]),
    bankDetails: BankDetails.fromJson(json["bankDetails"]),
    otherDetails: OtherDetails.fromJson(json["otherDetails"]),
    isBlocked: json["isBlocked"],
    isRestaurantInfoUpdated: json["isRestaurantInfoUpdated"],
    isOtpVerified: json["isOtpVerified"],
    isBankDetailsUpdated: json["isBankDetailsUpdated"],
    isDocumentsUploaded: json["isDocumentsUploaded"],
    profileCompletion: json["profileCompletion"],
    isLocationDetails: json["isLocationDetails"],
    isDelivery: json["isDelivery"],
    isPickUp: json["isPickUp"],
    restaurantStatus: json["restaurantStatus"],
    deviceType: json["deviceType"],
    commissionValue: json["commissionValue"],
    commissionPercentage: json["commissionPercentage"],
    deviceToken: json["deviceToken"],
    accessToken: json["access_token"],
    rejectionType: json["rejectionType"],
    rejectedReason: json["rejectedReason"],
    supplierId: json["supplierId"],
    colorCode: json["colorCode"],
    myFatoorahStatus: json["myFatoorahStatus"],
    createdAt: json["createdAt"],
    rejectedAt: json["rejectedAt"],
    updatedAt: json["updatedAt"],
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "countryCode": countryCode,
    "countryISO": countryIso,
    "mobileNumber": mobileNumber,
    "coverImage": coverImage,
    "profileImage": profileImage,
    "otp": otp,
    "profileType": profileType,
    "resCategory": List<dynamic>.from(resCategory.map((x) => x)),
    "resName": resName,
    "ownerFirstName": ownerFirstName,
    "ownerLastName": ownerLastName,
    "email": email,
    "password": password,
    "payOutCycle": payOutCycle,
    "addressDetails": addressDetails.toJson(),
    "documents": documents.toJson(),
    "bankDetails": bankDetails.toJson(),
    "otherDetails": otherDetails.toJson(),
    "isBlocked": isBlocked,
    "isRestaurantInfoUpdated": isRestaurantInfoUpdated,
    "isOtpVerified": isOtpVerified,
    "isBankDetailsUpdated": isBankDetailsUpdated,
    "isDocumentsUploaded": isDocumentsUploaded,
    "profileCompletion": profileCompletion,
    "isLocationDetails": isLocationDetails,
    "isDelivery": isDelivery,
    "isPickUp": isPickUp,
    "restaurantStatus": restaurantStatus,
    "deviceType": deviceType,
    "commissionValue": commissionValue,
    "commissionPercentage": commissionPercentage,
    "deviceToken": deviceToken,
    "access_token": accessToken,
    "rejectionType": rejectionType,
    "rejectedReason": rejectedReason,
    "supplierId": supplierId,
    "colorCode": colorCode,
    "myFatoorahStatus": myFatoorahStatus,
    "createdAt": createdAt,
    "rejectedAt": rejectedAt,
    "updatedAt": updatedAt,
    "language": language,
  };
}

class AddressDetails {
  Location location;
  String address;
  String building;
  String tower;
  String city;
  String area;
  String postalCode;
  String landmark;

  AddressDetails({
    required this.location,
    required this.address,
    required this.building,
    required this.tower,
    required this.city,
    required this.area,
    required this.postalCode,
    required this.landmark,
  });

  factory AddressDetails.fromJson(Map<String, dynamic> json) => AddressDetails(
    location: Location.fromJson(json["location"]),
    address: json["address"],
    building: json["building"],
    tower: json["tower"],
    city: json["city"],
    area: json["area"],
    postalCode: json["postalCode"],
    landmark: json["landmark"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "address": address,
    "building": building,
    "tower": tower,
    "city": city,
    "area": area,
    "postalCode": postalCode,
    "landmark": landmark,
  };
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class BankDetails {
  String bankAccountNo;
  String accHolderName;
  String bankId;
  String iban;

  BankDetails({
    required this.bankAccountNo,
    required this.accHolderName,
    required this.bankId,
    required this.iban,
  });

  factory BankDetails.fromJson(Map<String, dynamic> json) => BankDetails(
    bankAccountNo: json["bankAccountNo"],
    accHolderName: json["accHolderName"],
    bankId: json["bankId"],
    iban: json["iban"],
  );

  Map<String, dynamic> toJson() => {
    "bankAccountNo": bankAccountNo,
    "accHolderName": accHolderName,
    "bankId": bankId,
    "iban": iban,
  };
}

class Documents {
  String license;
  String idProof;
  List<dynamic> workingDays;
  String openingTime;
  String closingTime;

  Documents({
    required this.license,
    required this.idProof,
    required this.workingDays,
    required this.openingTime,
    required this.closingTime,
  });

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
    license: json["license"],
    idProof: json["idProof"],
    workingDays: List<dynamic>.from(json["workingDays"].map((x) => x)),
    openingTime: json["openingTime"],
    closingTime: json["closingTime"],
  );

  Map<String, dynamic> toJson() => {
    "license": license,
    "idProof": idProof,
    "workingDays": List<dynamic>.from(workingDays.map((x) => x)),
    "openingTime": openingTime,
    "closingTime": closingTime,
  };
}

class OtherDetails {
  String supplierCode;
  String supplierName;
  AllShareHolderpassportCopyies commercialLicence;
  AllShareHolderpassportCopyies articleOfAssociation;
  AllShareHolderpassportCopyies commercialCertificate;
  AllShareHolderpassportCopyies ibanLetter;
  AllShareHolderpassportCopyies authorisedsignateryPassportCopy;
  AllShareHolderpassportCopyies authorisedsignateryEmiratesCopy;
  AllShareHolderpassportCopyies allShareHolderpassportCopyies;

  OtherDetails({
    required this.supplierCode,
    required this.supplierName,
    required this.commercialLicence,
    required this.articleOfAssociation,
    required this.commercialCertificate,
    required this.ibanLetter,
    required this.authorisedsignateryPassportCopy,
    required this.authorisedsignateryEmiratesCopy,
    required this.allShareHolderpassportCopyies,
  });

  factory OtherDetails.fromJson(Map<String, dynamic> json) => OtherDetails(
    supplierCode: json["supplierCode"],
    supplierName: json["supplierName"],
    commercialLicence: AllShareHolderpassportCopyies.fromJson(json["commercialLicence"]),
    articleOfAssociation: AllShareHolderpassportCopyies.fromJson(json["articleOfAssociation"]),
    commercialCertificate: AllShareHolderpassportCopyies.fromJson(json["commercialCertificate"]),
    ibanLetter: AllShareHolderpassportCopyies.fromJson(json["ibanLetter"]),
    authorisedsignateryPassportCopy: AllShareHolderpassportCopyies.fromJson(json["authorisedsignateryPassportCopy"]),
    authorisedsignateryEmiratesCopy: AllShareHolderpassportCopyies.fromJson(json["authorisedsignateryEmiratesCopy"]),
    allShareHolderpassportCopyies: AllShareHolderpassportCopyies.fromJson(json["allShareHolderpassportCopyies"]),
  );

  Map<String, dynamic> toJson() => {
    "supplierCode": supplierCode,
    "supplierName": supplierName,
    "commercialLicence": commercialLicence.toJson(),
    "articleOfAssociation": articleOfAssociation.toJson(),
    "commercialCertificate": commercialCertificate.toJson(),
    "ibanLetter": ibanLetter.toJson(),
    "authorisedsignateryPassportCopy": authorisedsignateryPassportCopy.toJson(),
    "authorisedsignateryEmiratesCopy": authorisedsignateryEmiratesCopy.toJson(),
    "allShareHolderpassportCopyies": allShareHolderpassportCopyies.toJson(),
  };
}

class AllShareHolderpassportCopyies {
  String image;
  DateTime expiry;

  AllShareHolderpassportCopyies({
    required this.image,
    required this.expiry,
  });

  factory AllShareHolderpassportCopyies.fromJson(Map<String, dynamic> json) => AllShareHolderpassportCopyies(
    image: json["image"],
    expiry: DateTime.parse(json["expiry"]),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "expiry": "${expiry.year.toString().padLeft(4, '0')}-${expiry.month.toString().padLeft(2, '0')}-${expiry.day.toString().padLeft(2, '0')}",
  };
}
