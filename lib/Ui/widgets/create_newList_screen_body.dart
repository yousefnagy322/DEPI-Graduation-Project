import 'package:collaborativeshoppinglistapp/Ui/widgets/custom_button.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/items_section.dart';
import 'package:collaborativeshoppinglistapp/Ui/widgets/list_name_section.dart';
import 'package:flutter/material.dart';

class CreateNewlistScreenBody extends StatelessWidget {
  const CreateNewlistScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListNameSection(),
                        SizedBox(height: 23),
                        ItemsSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(buttonName: "Save List", onTap: () {}),
              ),
              SizedBox(height: 16),
              Expanded(child: Container(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
