// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FCMPayload _$$_FCMPayloadFromJson(Map json) => _$_FCMPayload(
      type: $enumDecodeNullable(_$FCMPayloadTypeEnumMap, json['type']),
      txid: json['txid'] as String?,
    );

Map<String, dynamic> _$$_FCMPayloadToJson(_$_FCMPayload instance) =>
    <String, dynamic>{
      'type': _$FCMPayloadTypeEnumMap[instance.type],
      'txid': instance.txid,
    };

const _$FCMPayloadTypeEnumMap = {
  FCMPayloadType.send: 'Send',
  FCMPayloadType.recv: 'Recv',
  FCMPayloadType.swap: 'Swap',
  FCMPayloadType.redeposit: 'Redeposit',
  FCMPayloadType.unknown: 'Unknown',
  FCMPayloadType.pegin: 'Peg-in',
  FCMPayloadType.pegout: 'Peg-out',
};

_$_FCMNotification _$$_FCMNotificationFromJson(Map json) => _$_FCMNotification(
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$_FCMNotificationToJson(_$_FCMNotification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };

_$_FCMData _$$_FCMDataFromJson(Map json) => _$_FCMData(
      details: json['details'] == null
          ? null
          : FCMDetails.fromJson(
              Map<String, dynamic>.from(json['details'] as Map)),
    );

Map<String, dynamic> _$$_FCMDataToJson(_$_FCMData instance) =>
    <String, dynamic>{
      'details': instance.details,
    };

_$_FCMDetails _$$_FCMDetailsFromJson(Map json) => _$_FCMDetails(
      tx: json['tx'] == null
          ? null
          : FCMTx.fromJson(Map<String, dynamic>.from(json['tx'] as Map)),
      pegPayout: json['peg_payout'] == null
          ? null
          : FCMPeg.fromJson(
              Map<String, dynamic>.from(json['peg_payout'] as Map)),
      pegDetected: json['peg_detected'] == null
          ? null
          : FCMPeg.fromJson(
              Map<String, dynamic>.from(json['peg_detected'] as Map)),
      orderCancelled: json['order_cancelled'] == null
          ? null
          : FCMOrderCancelled.fromJson(
              Map<String, dynamic>.from(json['order_cancelled'] as Map)),
    );

Map<String, dynamic> _$$_FCMDetailsToJson(_$_FCMDetails instance) =>
    <String, dynamic>{
      'tx': instance.tx,
      'peg_payout': instance.pegPayout,
      'peg_detected': instance.pegDetected,
      'order_cancelled': instance.orderCancelled,
    };

_$_FCMTx _$$_FCMTxFromJson(Map json) => _$_FCMTx(
      txType: $enumDecodeNullable(_$FCMTxTypeEnumMap, json['tx_type']),
      txId: json['txid'] as String?,
    );

Map<String, dynamic> _$$_FCMTxToJson(_$_FCMTx instance) => <String, dynamic>{
      'tx_type': _$FCMTxTypeEnumMap[instance.txType],
      'txid': instance.txId,
    };

const _$FCMTxTypeEnumMap = {
  FCMTxType.send: 'Send',
  FCMTxType.recv: 'Recv',
  FCMTxType.swap: 'Swap',
  FCMTxType.redeposit: 'Redeposit',
  FCMTxType.unknown: 'Unknown',
};

_$_FCMPeg _$$_FCMPegFromJson(Map json) => _$_FCMPeg(
      orderId: json['order_id'] as String?,
      pegIn: json['peg_in'] as bool?,
      txHash: json['tx_hash'] as String?,
      vout: json['vout'] as int?,
      createdAt: json['created_at'] as int?,
      payoutTxId: json['payout_txid'] as String?,
      payout: json['payout'] as int?,
    );

Map<String, dynamic> _$$_FCMPegToJson(_$_FCMPeg instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'peg_in': instance.pegIn,
      'tx_hash': instance.txHash,
      'vout': instance.vout,
      'created_at': instance.createdAt,
      'payout_txid': instance.payoutTxId,
      'payout': instance.payout,
    };

_$_FCMOrderCancelled _$$_FCMOrderCancelledFromJson(Map json) =>
    _$_FCMOrderCancelled(
      orderId: json['order_id'] as String?,
    );

Map<String, dynamic> _$$_FCMOrderCancelledToJson(
        _$_FCMOrderCancelled instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
    };

_$_FCMMessage _$$_FCMMessageFromJson(Map json) => _$_FCMMessage(
      notification: json['notification'] == null
          ? null
          : FCMNotification.fromJson(
              Map<String, dynamic>.from(json['notification'] as Map)),
      data: json['data'] == null
          ? null
          : FCMData.fromJson(Map<String, dynamic>.from(json['data'] as Map)),
    );

Map<String, dynamic> _$$_FCMMessageToJson(_$_FCMMessage instance) =>
    <String, dynamic>{
      'notification': instance.notification,
      'data': instance.data,
    };