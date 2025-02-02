import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sideswap/common/sideswap_colors.dart';

import 'package:sideswap/common/widgets/custom_app_bar.dart';
import 'package:sideswap/common/widgets/side_swap_scaffold.dart';
import 'package:sideswap/providers/wallet.dart';
import 'package:sideswap/providers/wallet_page_status_provider.dart';
import 'package:sideswap/screens/receive/widgets/asset_receive_widget.dart';

class PegInAddress extends HookConsumerWidget {
  const PegInAddress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SideSwapScaffold(
      appBar: CustomAppBar(
        onPressed: () {
          ref
              .read(pageStatusStateProvider.notifier)
              .setStatus(Status.registered);
        },
      ),
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (!didPop) {
          ref.read(walletProvider).goBack();
        }
      },
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 8 + MediaQuery.of(context).padding.top),
            child: const Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 215,
                height: 40,
                child: Text(
                  'Please send BTC to the following address:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: SideSwapColors.brightTurquoise,
                  ),
                ),
              ),
            ),
          ),
          const SafeArea(
            child: AssetReceiveWidget(
              isPegIn: true,
            ),
          ),
        ],
      ),
    );
  }
}
