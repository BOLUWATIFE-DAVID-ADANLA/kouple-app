import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kouple_app/app/models/pc_model.dart';

class Pcfetchrepo {
  Future<List<PcModel>> fetchPcs() async {
    await Future.delayed(const Duration(seconds: 10));
    return pcModels;
  }
}

final FutureProvider pcProvider = FutureProvider<List<PcModel>>((ref) {
  final repo = Pcfetchrepo();
  return repo.fetchPcs();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredPcProvider = Provider<List<PcModel>>((ref) {
  final allPcs = ref.watch(pcProvider).asData?.value ?? [];
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

  // Filter based on the search query
  return allPcs
      .where((pc) => pc.name.toLowerCase().contains(searchQuery))
      .toList();
});
