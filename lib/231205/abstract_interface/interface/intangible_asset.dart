import 'thing.dart';

import 'asset.dart';

abstract class IntangibleAsset extends Asset implements Thing {
  IntangibleAsset(super.name);
}
