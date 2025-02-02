import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sideswap/common/helpers.dart';
import 'package:sideswap/common/utils/sideswap_logger.dart';

part 'licenses_provider.g.dart';

@riverpod
FutureOr<bool> licensesLoaderFuture(LicensesLoaderFutureRef ref) {
  logger.d('Loading licenses...');
  LicenseRegistry.addLicense(() async* {
    var license =
        await rootBundle.loadString('assets/licenses/gdk-license.txt');
    yield LicenseEntryWithLineBreaks([kPackageGdk], license);
  });
  return true;
}
