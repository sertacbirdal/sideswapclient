import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sideswap/common/helpers.dart';
import 'package:sideswap/common/screen_utils.dart';
import 'package:sideswap/protobuf/sideswap.pb.dart';
import 'package:sideswap/screens/tx/widgets/tx_circle_image.dart';

class TxItemPeg extends StatelessWidget {
  TxItemPeg({Key key, this.transItem, this.ticker}) : super(key: key);

  final TransItem transItem;
  final String ticker;

  static final double itemHeight = 46.h;

  @override
  Widget build(BuildContext context) {
    final _status = txItemToStatus(transItem);
    final payout = amountStrNamed(transItem.peg.amountRecv.toInt(), ticker);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: itemHeight,
          child: Row(
            children: [
              TxCircleImage(
                txCircleImageType: transItem.peg.isPegIn
                    ? TxCircleImageType.pegIn
                    : TxCircleImageType.pegOut,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  transItem.peg.isPegIn ? 'Peg-In'.tr() : 'Peg-Out'.tr(),
                  style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$payout',
                    style: GoogleFonts.roboto(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFB3FF85),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      _status,
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF709EBA),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}