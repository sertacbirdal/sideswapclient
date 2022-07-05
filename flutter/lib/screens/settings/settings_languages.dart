import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sideswap/common/screen_utils.dart';
import 'package:sideswap/common/widgets/custom_app_bar.dart';
import 'package:sideswap/common/widgets/side_swap_scaffold.dart';
import 'package:sideswap/desktop/common/button/d_custom_text_big_button.dart';
import 'package:sideswap/models/locales_provider.dart';

class Languages extends ConsumerWidget {
  const Languages({
    super.key,
  });

  VoidCallback close(BuildContext context) {
    return () {
      Navigator.of(context).pop();
    };
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = supportedLanguages();
    final selectedLang = ref.watch(localesProvider).selectedLang(context);
    return SideSwapScaffold(
      onWillPop: () async {
        return true;
      },
      appBar: CustomAppBar(
        title: 'Languages'.tr(),
        onPressed: close(context),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Language'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 118),
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = lang == selectedLang;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.w),
                          ),
                          color: isSelected ? const Color(0xFF135579) : null,
                          border: isSelected
                              ? null
                              : Border.all(
                                  color: const Color(0xFF327FA9), width: 1),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.w),
                            ),
                            onTap: () {
                              ref
                                  .read(localesProvider)
                                  .setSelectedLang(context, lang);
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    localeIconFile(lang),
                                    const SizedBox(width: 8),
                                    Text(
                                      localeName(lang),
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
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: const Color(0xFF135579),
              padding:
                  const EdgeInsets.symmetric(vertical: 40, horizontal: 160),
              child: DCustomTextBigButton(
                onPressed: close(context),
                child: Text(
                  'BACK'.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}