import 'package:dart_basic/231205/abstract_interface/interface/thing.dart';

import 'asset.dart';
import '../patent.dart';

abstract class TangibleAsset extends Asset implements Thing {
  Patent patent;

  TangibleAsset(
    this.patent,
    String name,
  ) : super(name);
}
