import 'package:collection/collection.dart';

class PricePoint{
  final double x;
  final double y;
  PricePoint({required this.x,required this.y});
}
List<PricePoint>  get pricePoints{
  final data = <double>[36,39,42,35,36,40,41,33,39,37,34,42];
  return data.mapIndexed(((index,element)=>PricePoint(x:index.toDouble(),y:element))).toList();
}