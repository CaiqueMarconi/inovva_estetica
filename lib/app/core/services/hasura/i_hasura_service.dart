abstract class IHasuraService {
  Future<dynamic> mutation({required String docQuery, Map<String, dynamic>? variables});
  Future<dynamic> query({required String docQuery, Map<String, dynamic>? variables});
}
