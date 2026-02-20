// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitBottomBarStory = Story(
  name: 'VitBottomBar',
  description: 'VitBottomBar component for responsive bottom/side navigation.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VitButton(
                  text: 'Basic Navigation Scaffold',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _BasicNavigationExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Custom Colors Navigation',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _CustomColorsExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Navigation with Badges',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _BadgesExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Custom Animation Styles',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _AnimationExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Labels Only Selected',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const _LabelsOnlySelectedExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Icons Only (No Labels)',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _IconsOnlyExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Elevated Variant',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _ElevatedVariantExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Primary Variant',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _PrimaryVariantExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Dot Variant',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _DotVariantExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'With Custom Item Builder',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _CustomItemBuilderExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'VitScaffold Integration',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const _VitScaffoldIntegrationExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'With Sidebar Header & Footer',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const _SidebarHeaderFooterExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Different Sidebar Item Styles',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _SidebarItemStylesExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Loading State',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _LoadingStateExample(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                VitButton(
                  text: 'Right Sidebar Position',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const _RightSidebarExample(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
);

class _BasicNavigationExample extends StatefulWidget {
  const _BasicNavigationExample();

  @override
  State<_BasicNavigationExample> createState() =>
      _BasicNavigationExampleState();
}

class _BasicNavigationExampleState extends State<_BasicNavigationExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Basic Navigation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      items: const [
        VitBottomBarItem(
          icon: Icons.dashboard_outlined,
          selectedIcon: Icons.dashboard,
          label: 'Home',
        ),
        VitBottomBarItem(
          icon: Icons.wallet_outlined,
          selectedIcon: Icons.wallet,
          label: 'Stake',
        ),
        VitBottomBarItem(
          icon: Icons.bar_chart_outlined,
          selectedIcon: Icons.bar_chart,
          label: 'Bond',
        ),
        VitBottomBarItem(
          icon: Icons.calculate_outlined,
          selectedIcon: Icons.calculate,
          label: 'Calculator',
        ),
        VitBottomBarItem(
          icon: Icons.settings_outlined,
          selectedIcon: Icons.settings,
          label: 'Settings',
        ),
      ],
      pages: [
        _buildPage('Dashboard', Icons.dashboard, Colors.blue),
        _buildPage('Stake', Icons.wallet, Colors.green),
        _buildPage('Bond', Icons.bar_chart, Colors.orange),
        _buildPage('Calculator', Icons.calculate, Colors.purple),
        _buildPage('Settings', Icons.settings, Colors.grey),
      ],
      initialIndex: _currentIndex,
      onIndexChanged: (index) => setState(() => _currentIndex = index),
    );
  }

  Widget _buildPage(String title, IconData icon, Color color) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: color),
          const SizedBox(height: 16),
          VitTitle(title),
          const SizedBox(height: 8),
          VitText('This is the $title page'),
        ],
      ),
    );
  }
}

class _CustomColorsExample extends StatelessWidget {
  const _CustomColorsExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Custom Colors'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      selectedColor: Colors.deepPurple,
      unselectedColor: Colors.grey.shade400,
      backgroundColor: Colors.grey.shade100,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.favorite, label: 'Favorites'),
        VitBottomBarItem(icon: Icons.person, label: 'Profile'),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Favorites Page')),
        Center(child: VitText('Profile Page')),
      ],
    );
  }
}

class _BadgesExample extends StatelessWidget {
  const _BadgesExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Navigation with Badges'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      items: const [
        VitBottomBarItem(
          icon: Icons.home,
          label: 'Home',
        ),
        VitBottomBarItem(
          icon: Icons.notifications,
          label: 'Notifications',
          badge: '12',
        ),
        VitBottomBarItem(
          icon: Icons.mail,
          label: 'Messages',
          badge: '3',
          badgeColor: Colors.green,
        ),
        VitBottomBarItem(
          icon: Icons.shopping_cart,
          label: 'Cart',
          badge: '5',
          badgeColor: Colors.orange,
        ),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Notifications Page')),
        Center(child: VitText('Messages Page')),
        Center(child: VitText('Cart Page')),
      ],
    );
  }
}

class _AnimationExample extends StatefulWidget {
  const _AnimationExample();

  @override
  State<_AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<_AnimationExample> {
  VitBottomBarAnimation _animation = VitBottomBarAnimation.fadeScale;

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Animation Styles'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton<VitBottomBarAnimation>(
            onSelected: (value) => setState(() => _animation = value),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: VitBottomBarAnimation.none,
                child: Text('None'),
              ),
              const PopupMenuItem(
                value: VitBottomBarAnimation.fade,
                child: Text('Fade'),
              ),
              const PopupMenuItem(
                value: VitBottomBarAnimation.scale,
                child: Text('Scale'),
              ),
              const PopupMenuItem(
                value: VitBottomBarAnimation.slide,
                child: Text('Slide'),
              ),
              const PopupMenuItem(
                value: VitBottomBarAnimation.fadeScale,
                child: Text('Fade + Scale'),
              ),
            ],
          ),
        ],
      ),
      animation: _animation,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.search, label: 'Search'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Animation: ${_animation.name}'),
              const SizedBox(height: 8),
              const VitText('Use the menu to change animation style'),
            ],
          ),
        ),
        const Center(child: VitText('Search Page')),
        const Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _LabelsOnlySelectedExample extends StatelessWidget {
  const _LabelsOnlySelectedExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Labels Only Selected'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      labelBehavior: VitBottomBarLabelBehavior.showOnlySelected,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.explore, label: 'Explore'),
        VitBottomBarItem(icon: Icons.bookmark, label: 'Saved'),
        VitBottomBarItem(icon: Icons.person, label: 'Profile'),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Explore Page')),
        Center(child: VitText('Saved Page')),
        Center(child: VitText('Profile Page')),
      ],
    );
  }
}

class _IconsOnlyExample extends StatelessWidget {
  const _IconsOnlyExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Icons Only'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      labelBehavior: VitBottomBarLabelBehavior.neverShow,
      items: const [
        VitBottomBarItem(
          icon: Icons.home_outlined,
          selectedIcon: Icons.home,
          label: 'Home',
          tooltip: 'Home',
        ),
        VitBottomBarItem(
          icon: Icons.search_outlined,
          selectedIcon: Icons.search,
          label: 'Search',
          tooltip: 'Search',
        ),
        VitBottomBarItem(
          icon: Icons.add_circle_outline,
          selectedIcon: Icons.add_circle,
          label: 'Create',
          tooltip: 'Create',
        ),
        VitBottomBarItem(
          icon: Icons.favorite_outline,
          selectedIcon: Icons.favorite,
          label: 'Favorites',
          tooltip: 'Favorites',
        ),
        VitBottomBarItem(
          icon: Icons.person_outline,
          selectedIcon: Icons.person,
          label: 'Profile',
          tooltip: 'Profile',
        ),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Create Page')),
        Center(child: VitText('Favorites Page')),
        Center(child: VitText('Profile Page')),
      ],
    );
  }
}

class _ElevatedVariantExample extends StatelessWidget {
  const _ElevatedVariantExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Elevated Variant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      variant: VitBottomBarVariant.elevated,
      elevation: 8,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.search, label: 'Search'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _PrimaryVariantExample extends StatelessWidget {
  const _PrimaryVariantExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Primary Variant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      variant: VitBottomBarVariant.primary,
      selectedColor: Colors.white,
      unselectedColor: Colors.white54,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.search, label: 'Search'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _DotVariantExample extends StatelessWidget {
  const _DotVariantExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Dot Variant'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      variant: VitBottomBarVariant.dot,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.search, label: 'Search'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _CustomItemBuilderExample extends StatelessWidget {
  const _CustomItemBuilderExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Custom Item Builder'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomBarItemBuilder: (context, item, index, isSelected, onTap) {
        return Expanded(
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).primaryColor.withValues(alpha: 0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      isSelected ? item.selectedIcon ?? item.icon : item.icon,
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).hintColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      items: const [
        VitBottomBarItem(
          icon: Icons.home_outlined,
          selectedIcon: Icons.home,
          label: 'Home',
        ),
        VitBottomBarItem(
          icon: Icons.search_outlined,
          selectedIcon: Icons.search,
          label: 'Search',
        ),
        VitBottomBarItem(
          icon: Icons.settings_outlined,
          selectedIcon: Icons.settings,
          label: 'Settings',
        ),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _VitScaffoldIntegrationExample extends StatefulWidget {
  const _VitScaffoldIntegrationExample();

  @override
  State<_VitScaffoldIntegrationExample> createState() =>
      _VitScaffoldIntegrationExampleState();
}

class _VitScaffoldIntegrationExampleState
    extends State<_VitScaffoldIntegrationExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return VitScaffold(
      title: 'VitScaffold Integration',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      navigationItems: const [
        VitBottomBarItem(
          icon: Icons.dashboard_outlined,
          selectedIcon: Icons.dashboard,
          label: 'Dashboard',
        ),
        VitBottomBarItem(
          icon: Icons.analytics_outlined,
          selectedIcon: Icons.analytics,
          label: 'Analytics',
        ),
        VitBottomBarItem(
          icon: Icons.account_balance_wallet_outlined,
          selectedIcon: Icons.account_balance_wallet,
          label: 'Wallet',
        ),
        VitBottomBarItem(
          icon: Icons.settings_outlined,
          selectedIcon: Icons.settings,
          label: 'Settings',
        ),
      ],
      navigationPages: [
        _buildDashboardPage(),
        _buildAnalyticsPage(),
        _buildWalletPage(),
        _buildSettingsPage(),
      ],
      navigationIndex: _currentIndex,
      onNavigationIndexChanged: (index) =>
          setState(() => _currentIndex = index),
      navigationVariant: VitBottomBarVariant.standard,
      sideBarExpandable: true,
      sideBarInitiallyExpanded: true,
    );
  }

  Widget _buildDashboardPage() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VitTitle('Dashboard'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: VitCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VitText('Total Balance', style: context.theme.bodySmall),
                      const SizedBox(height: 4),
                      VitTitle('\$12,345.67'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: VitCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VitText('APY', style: context.theme.bodySmall),
                      const SizedBox(height: 4),
                      VitTitle('257,900%'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsPage() {
    return const Center(
      child: VitInputCount(
        label: 'Analytics',
        value: 0,
      ),
    );
  }

  Widget _buildWalletPage() {
    return const Center(
      child: VitText('Wallet Page'),
    );
  }

  Widget _buildSettingsPage() {
    return const Center(
      child: VitText('Settings Page'),
    );
  }
}

class _SidebarHeaderFooterExample extends StatelessWidget {
  const _SidebarHeaderFooterExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Sidebar Header & Footer'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      sideBarHeaderBuilder: (context, isExpanded) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                child: Icon(Icons.person),
              ),
              if (isExpanded) ...[
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VitText(
                        'John Doe',
                        style: context.theme.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      VitText(
                        'john@example.com',
                        style: context.theme.labelBig,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
      sideBarFooterBuilder: (context, isExpanded) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                size: 20,
                color: context.theme.errorColor,
              ),
              if (isExpanded) ...[
                const SizedBox(width: 8),
                VitText(
                  'Logout',
                  style: context.theme.body.copyWith(
                    color: context.theme.errorColor,
                  ),
                ),
              ],
            ],
          ),
        );
      },
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.search, label: 'Search'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _SidebarItemStylesExample extends StatefulWidget {
  const _SidebarItemStylesExample();

  @override
  State<_SidebarItemStylesExample> createState() =>
      _SidebarItemStylesExampleState();
}

class _SidebarItemStylesExampleState extends State<_SidebarItemStylesExample> {
  VitSideBarItemStyle _style = VitSideBarItemStyle.rounded;

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Sidebar Item Styles'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          PopupMenuButton<VitSideBarItemStyle>(
            onSelected: (value) => setState(() => _style = value),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: VitSideBarItemStyle.standard,
                child: Text('Standard'),
              ),
              PopupMenuItem(
                value: VitSideBarItemStyle.rounded,
                child: Text('Rounded'),
              ),
              PopupMenuItem(
                value: VitSideBarItemStyle.indicator,
                child: Text('Indicator'),
              ),
            ],
          ),
        ],
      ),
      sideBarItemStyle: _style,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.explore, label: 'Explore'),
        VitBottomBarItem(icon: Icons.bookmark, label: 'Saved'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VitTitle('Style: ${_style.name}'),
              const SizedBox(height: 8),
              const VitText('Use the menu to change sidebar item style'),
              const SizedBox(height: 16),
              const VitText('(Best viewed on tablet/larger screens)'),
            ],
          ),
        ),
        const Center(child: VitText('Explore Page')),
        const Center(child: VitText('Saved Page')),
        const Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _LoadingStateExample extends StatefulWidget {
  const _LoadingStateExample();

  @override
  State<_LoadingStateExample> createState() => _LoadingStateExampleState();
}

class _LoadingStateExampleState extends State<_LoadingStateExample> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Loading State'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Switch(
            value: _isLoading,
            onChanged: (value) => setState(() => _isLoading = value),
          ),
        ],
      ),
      isLoading: _isLoading,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.search, label: 'Search'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: const [
        Center(child: VitText('Home Page')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Settings Page')),
      ],
    );
  }
}

class _RightSidebarExample extends StatelessWidget {
  const _RightSidebarExample();

  @override
  Widget build(BuildContext context) {
    return VitNavigationScaffold(
      appBar: AppBar(
        title: const Text('Right Sidebar'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      sideBarPosition: VitSideBarPosition.right,
      items: const [
        VitBottomBarItem(icon: Icons.home, label: 'Home'),
        VitBottomBarItem(icon: Icons.search, label: 'Search'),
        VitBottomBarItem(icon: Icons.settings, label: 'Settings'),
      ],
      pages: const [
        Center(child: VitText('Home Page (Right Sidebar on Tablets)')),
        Center(child: VitText('Search Page')),
        Center(child: VitText('Settings Page')),
      ],
    );
  }
}
