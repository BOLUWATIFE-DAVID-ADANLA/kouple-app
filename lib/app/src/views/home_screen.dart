import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kouple_app/app/models/pc_model.dart';
import 'package:kouple_app/app/providers/auth_providers.dart';
import 'package:kouple_app/app/repo/pc_fetch_repo.dart';
import 'package:kouple_app/app/routes/app_routes_constants.dart';
import 'package:kouple_app/app/util/app_padding.dart';
import 'package:kouple_app/app/util/app_spacing.dart';
import 'package:kouple_app/app/util/app_text.dart';
import 'package:kouple_app/app/util/sizeconfig.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pcUnfilteredList = ref.watch(pcProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      body: SafeArea(
        child: SymetricPadding(
          h: 16,
          v: 0,
          child: Column(
            children: [
              const AppSpacing(v: 10),
              const Appheader(),
              const AppSpacing(v: 20),
              RegularTextField(
                hintText: 'Search',
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
              ),
              const AppSpacing(v: 20),
              Expanded(
                child: pcUnfilteredList.when(
                  data: (pcModels) {
                    final filteredModels = searchQuery.isEmpty
                        ? pcModels
                        : pcModels.where((PcModel model) {
                            final query = searchQuery.toLowerCase();
                            return model.name.toLowerCase().contains(query);
                          }).toList();

                    return ListView.builder(
                      itemCount: filteredModels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard(
                          pcModel: filteredModels[index],
                        );
                      },
                    );
                  },
                  error: (error, stack) => Center(child: Text('Error: $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCard extends ConsumerWidget {
  const ItemCard({
    super.key,
    required this.pcModel,
  });

  final PcModel pcModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutesConstants.itemPage,
          extra: pcModel, // Pass the selected PcModel instance
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: SizeConfig.fromDesignHeight(context, 20),
        ),
        height: SizeConfig.fromDesignHeight(context, 300),
        width: SizeConfig.fromDesignWidth(context, 320),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          pcModel.imageUrl,
                        )),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ApptexBold(data: pcModel.name, fontsize: 16),
                    ApptexBold(data: 'USD ${pcModel.buildCost}', fontsize: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Appheader extends ConsumerWidget {
  const Appheader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ApptexBold(
                  fontsize: 16,
                  data: '$greeting ',
                ),
                AppTextMedium(
                  fontsize: 12,
                  data: 'What Pc Are you looking to build Today?',
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).signOut();
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Colors.red,
                    )),
                AppTextMedium(
                  data: 'logout',
                  fontsize: 12,
                  color: Colors.red,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class RegularTextField extends StatelessWidget {
  const RegularTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.keyboardtype,
      this.onChanged});
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardtype;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search),
        constraints: BoxConstraints(
            maxHeight: SizeConfig.fromDesignHeight(context, 70),
            minHeight: SizeConfig.fromDesignHeight(context, 42)),
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.fromDesignHeight(context, 2),
            horizontal: SizeConfig.fromDesignWidth(context, 15)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

final greetingProvider = Provider((ref) {
  final now = DateTime.now();
  final hour = now.hour;

  if (hour >= 0 && hour < 12) {
    return 'Good morning';
  } else if (hour >= 12 && hour < 18) {
    return 'Good afternoon';
  } else {
    return 'Good evening';
  }
});
