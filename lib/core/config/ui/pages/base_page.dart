import 'package:flutter/material.dart';
import 'package:valoratapp/core/utils/responsive.dart';
import 'package:valoratapp/core/widgets/widgets.dart';
import 'package:valoratapp/features/agents/presentation/pages/agents.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: const SizedBox.shrink(),
        actions: [
          SizedBox(
            width: Responsive.of(context).widthResponsive(14),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AgentsPage(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AgentsPage(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: AgentsPage(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onChange: _onTabTapped,
        ),
      ),
    );
  }
}
