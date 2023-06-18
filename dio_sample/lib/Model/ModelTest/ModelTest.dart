
class TestModel {
  List<Currencies>? currencies;

  TestModel({this.currencies});

  TestModel.fromJson(Map<String, dynamic> json) {
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(new Currencies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Currencies {
  int? pkIId;
  String? sCode;
  String? sName;
  String? dValue;
  String? dTrading;
  String? sIcon;
  bool? bEnabled;
  String? dtCreatedDate;
  String? dtModifiedDate;
  Null? dtDeletedDate;

  Currencies(
      {this.pkIId,
        this.sCode,
        this.sName,
        this.dValue,
        this.dTrading,
        this.sIcon,
        this.bEnabled,
        this.dtCreatedDate,
        this.dtModifiedDate,
        this.dtDeletedDate});

  Currencies.fromJson(Map<String, dynamic> json) {
    pkIId = json['pk_i_id'];
    sCode = json['s_code'];
    sName = json['s_name'];
    dValue = json['d_value'];
    dTrading = json['d_trading'];
    sIcon = json['s_icon'];
    bEnabled = json['b_enabled'];
    dtCreatedDate = json['dt_created_date'];
    dtModifiedDate = json['dt_modified_date'];
    dtDeletedDate = json['dt_deleted_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk_i_id'] = this.pkIId;
    data['s_code'] = this.sCode;
    data['s_name'] = this.sName;
    data['d_value'] = this.dValue;
    data['d_trading'] = this.dTrading;
    data['s_icon'] = this.sIcon;
    data['b_enabled'] = this.bEnabled;
    data['dt_created_date'] = this.dtCreatedDate;
    data['dt_modified_date'] = this.dtModifiedDate;
    data['dt_deleted_date'] = this.dtDeletedDate;
    return data;
  }
}