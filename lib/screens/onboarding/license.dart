import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sideswap/common/widgets/custom_big_button.dart';
import 'package:sideswap/common/widgets/side_swap_popup.dart';
import 'package:sideswap/models/wallet.dart';
import 'package:sideswap/common/screen_utils.dart';

class LicenseTerms extends StatelessWidget {
  Future<String> loadLicense() async {
    return await rootBundle.loadString('LICENSE');
  }

  @override
  Widget build(BuildContext context) {
    return SideSwapPopup(
      useDefaultHorizontalPadding: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 38.h, left: 16.w, right: 16.w),
            child: Text(
              'Terms and conditions'.tr(),
              style: GoogleFonts.roboto(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          FutureBuilder(
            future: loadLicense(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Material(
                    elevation: 3.0,
                    color: Colors.transparent,
                    shadowColor: Color(0xFF1E6389),
                    child: Container(
                      height: 421.h,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 8.w, top: 8.w, bottom: 8.w),
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                snapshot.data as String,
                                textScaleFactor: 0.89,
                                style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }

              return Container();
            },
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: CustomBigButton(
                    width: double.infinity,
                    height: 54.h,
                    text: 'I AGREE'.tr(),
                    backgroundColor: Color(0xFF00C5FF),
                    onPressed: () async {
                      await context.read(walletProvider).setLicenseAccepted();
                      await context
                          .read(walletProvider)
                          .newWalletBiometricPrompt();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}