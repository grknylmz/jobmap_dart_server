import '../jobmap.dart';
import '../model/countries.dart';

class CountryController extends ResourceController {
  CountryController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getCountries() async {
    return Response.ok(countries);
  }
}
