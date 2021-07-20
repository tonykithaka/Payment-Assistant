class PaymentMerchants {
  PaymentMerchants({
    this.paymentMerchants,
  });

  List<PaymentMerchant> paymentMerchants;

  factory PaymentMerchants.fromJson(Map<String, dynamic> json) =>
      PaymentMerchants(
        paymentMerchants: List<PaymentMerchant>.from(
            json["paymentMerchants"].map((x) => PaymentMerchant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "paymentMerchants":
            List<dynamic>.from(paymentMerchants.map((x) => x.toJson())),
      };
}

class PaymentMerchant {
  PaymentMerchant({
    this.merchantId,
    this.merchantImage,
    this.merchantName,
  });

  String merchantId;
  String merchantImage;
  String merchantName;

  factory PaymentMerchant.fromJson(Map<String, dynamic> json) =>
      PaymentMerchant(
        merchantId: json["merchantId"],
        merchantImage: json["merchantImage"],
        merchantName: json["merchantName"],
      );

  Map<String, dynamic> toJson() => {
        "merchantId": merchantId,
        "merchantImage": merchantImage,
        "merchantName": merchantName,
      };
}
