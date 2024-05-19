import 'package:cooks_corner/config/constants/dimens.dart';
import 'package:cooks_corner/config/constants/strings.dart';
import 'package:cooks_corner/config/constants/styles.dart';
import 'package:cooks_corner/features/sign_in/presentation/widgets/orange_text_style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              children: [
                Text(
                  AppStrings.category,
                  style: Styles.s18w500,
                ),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: AppStrings.breakfast),
                    Tab(text: AppStrings.lunch),
                    Tab(text: AppStrings.dinner),
                  ],
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                   /*   _buildGridView(),
                      _buildGridView(),
                      _buildGridView(),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
      itemCount: 5,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}
