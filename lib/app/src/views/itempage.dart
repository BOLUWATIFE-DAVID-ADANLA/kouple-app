import 'package:flutter/material.dart';
import 'package:kouple_app/app/models/pc_model.dart';
import 'package:kouple_app/app/util/app_padding.dart';
import 'package:kouple_app/app/util/app_spacing.dart';
import 'package:kouple_app/app/util/app_text.dart';
import 'package:kouple_app/app/util/sizeconfig.dart';

class Itempage extends StatelessWidget {
  final PcModel pc;

  const Itempage({super.key, required this.pc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            elevation: 0,
            centerTitle: false,
            expandedHeight: SizeConfig.fromDesignHeight(context, 300),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                pc.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: SingleChildScrollView(
              child: SymetricPadding(
                h: 10,
                v: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppSpacing(v: 10),
                    ApptexBold(data: 'Pc Part list ', fontsize: 16),
                    ...pc.parts.entries.map((entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            '${entry.key}: ${entry.value}',
                            style: const TextStyle(fontSize: 14),
                          ),
                        )),
                    ApptexBold(
                        data: 'Build Cost: \$${pc.buildCost}', fontsize: 16),
                    ApptexBold(data: 'YouTube Resource Link:', fontsize: 16),
                    GestureDetector(
                      onTap: () {
                        // You can add a URL launcher here to open the link
                      },
                      child: Text(
                        pc.youtubeUrl,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
