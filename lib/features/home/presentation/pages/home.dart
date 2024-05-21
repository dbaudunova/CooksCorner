import 'package:cooks_corner/core/constants/colors.dart';
import 'package:cooks_corner/core/constants/dimens.dart';
import 'package:cooks_corner/core/constants/strings.dart';
import 'package:cooks_corner/core/constants/styles.dart';
import 'package:cooks_corner/core/routes/app_routes.dart';
import 'package:cooks_corner/features/home/presentation/widgets/dish_card.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/orange_text_style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> _tabList = [
    AppStrings.breakfast,
    AppStrings.lunch,
    AppStrings.dinner,
  ].map((title) => Tab(text: title)).toList();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrangeBoxStyle(
            height: MediaQuery.of(context).size.height / 5,
            thinText: 'Hi',
            boldText: 'Ui designer & Cook',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.d20)
                .copyWith(top: Dimens.d20),
            child: Text(
              AppStrings.category,
              style: Styles.s18w500.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: Dimens.d20),
          _buildTabBar(),
          const SizedBox(height: Dimens.d14),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGridView(),
                _buildGridView(),
                _buildGridView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      dividerColor: Colors.transparent,
      controller: _tabController,
      indicatorColor: AppColors.text,
      indicatorWeight: 0.5,
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: const EdgeInsets.symmetric(horizontal: Dimens.d24),
      isScrollable: true,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      labelStyle: Styles.s14w400.copyWith(
        color: AppColors.text,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: Styles.s14w400.copyWith(
        fontWeight: FontWeight.bold,
      ),
      tabs: _tabList,
    );
  }

  Padding _buildGridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.d20),
      child: GridView.builder(
        itemCount: 12,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.85,
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return DishCard(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.description);
            },
          );
        },
      ),
    );
  }
}
