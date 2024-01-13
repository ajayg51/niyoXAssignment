import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/models/niyo_data.dart';
import 'package:test/screens/home_screen_controller.dart';
import 'package:test/utils/assets.dart';
import 'package:test/utils/common_background_gradient.dart';
import 'package:test/utils/extensions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Image.asset(
          Assets.niyoLogo,
          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
        ),
        title: Text(
          "NiyoX",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 36,
              ),
        ),
        flexibleSpace: const CommonBackgroundGradient(),
      ),
      body: CommonBackgroundGradient(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: buildSliverList(context: context),
            ),
            20.verticalSpace.toSliverBox,
          ],
        ),
      ),
    );
  }

  Widget buildSliverList({required BuildContext context}) {
    return Obx(() {
      final data = controller.niyoDataList.toList();
      if (controller.isLoading.value) {
        return Column(
          children: [
            300.verticalSpace,
            CircularProgressIndicator(
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ).toSliverBox;
      }
      if (data.isEmpty) {
        return Center(
          child: Text(
            "No data found",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 51,
                ),
          ),
        ).toSliverBox;
      }
      return SliverList.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          if (index % 2 == 0) {
            return 20.verticalSpace;
          }
          return buildCard(
            context: context,
            data: data[index],
          );
        },
      );
    });
  }

  Widget buildCard({
    required BuildContext context,
    required NiyoXData data,
  }) {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          12.verticalSpace,
          Text(
            "Title",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 48,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
          ),
          24.verticalSpace,
          Expanded(
            child: Text(
              data.title,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 18),
            ).padAll(value: 10),
          ),
        ],
      ),
    );
  }
}
