import 'package:root/src/services/productivity_service.dart';

class ProductivityProjectRepository {
  // ignore: unused_field
  final ProductivityService _productivityService;

  ProductivityProjectRepository({
    ProductivityService? productivityProjectService,
  }) : _productivityService =
           productivityProjectService ?? ProductivityService();
}
