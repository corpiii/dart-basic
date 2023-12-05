import 'asset.dart';
import '../patent.dart';

abstract class TangibleAsset extends Asset {
  Patent patent;

  TangibleAsset(
    this.patent,
    String name,
  ) : super(name);
}
