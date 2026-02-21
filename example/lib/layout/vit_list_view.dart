// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitListViewStory = Story(
  name: 'VitListView',
  description: 'VitListView component for customizable scrollable content.',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              VitButton(
                text: 'Basic List',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _BasicListExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'List with Header & Footer',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _HeaderFooterListExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Separated List',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _SeparatedListExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Grid Layout',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _GridLayoutExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Responsive Grid',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _ResponsiveGridExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Custom Slivers',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _CustomSliversExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Sliver App Bar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _SliverAppBarExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Pinned Header',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _PinnedHeaderExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Horizontal List',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _HorizontalListExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Children List',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _ChildrenListExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Grid with Custom Aspect Ratio',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _CustomAspectRatioExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              VitButton(
                text: 'Combined Example',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _CombinedExample(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    ),
  ),
);

class _BasicListExample extends StatelessWidget {
  const _BasicListExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Basic List',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: VitListView(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text('Item ${index + 1}'),
          subtitle: Text('Subtitle for item ${index + 1}'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class _HeaderFooterListExample extends StatelessWidget {
  const _HeaderFooterListExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Header & Footer',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: VitListView(
        header: Container(
          height: 150,
          width: double.infinity,
          color: context.theme.primaryColor.withValues(alpha: 0.1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.list_alt,
                  size: 48,
                  color: context.theme.primaryColor,
                ),
                const SizedBox(height: 8),
                VitTitle('List Header'),
                const SizedBox(height: 4),
                VitText('This header scrolls with the content'),
              ],
            ),
          ),
        ),
        footer: Container(
          height: 100,
          width: double.infinity,
          color: context.theme.successColor.withValues(alpha: 0.1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 32,
                  color: context.theme.successColor,
                ),
                const SizedBox(height: 8),
                VitText('End of List'),
              ],
            ),
          ),
        ),
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item ${index + 1}'),
          subtitle: Text('Description for item ${index + 1}'),
        ),
      ),
    );
  }
}

class _SeparatedListExample extends StatelessWidget {
  const _SeparatedListExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Separated List',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: VitListView.separated(
        header: Padding(
          padding: const EdgeInsets.all(16),
          child: VitTitle('Contact List'),
        ),
        itemCount: 25,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: context.theme.primaryColor,
            child: Text(
              String.fromCharCode(65 + (index % 26)),
              style: TextStyle(color: context.theme.onPrimaryColor),
            ),
          ),
          title: Text('Contact ${index + 1}'),
          subtitle: Text('contact${index + 1}@example.com'),
          trailing: IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {},
          ),
        ),
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }
}

class _GridLayoutExample extends StatelessWidget {
  const _GridLayoutExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Grid Layout',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: VitListView.grid(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        contentPadding: const EdgeInsets.all(16),
        itemCount: 20,
        itemBuilder: (context, index) => Card(
          child: InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped item ${index + 1}')),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.folder,
                  size: 48,
                  color: context.theme.primaryColor,
                ),
                const SizedBox(height: 8),
                Text('Folder ${index + 1}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResponsiveGridExample extends StatelessWidget {
  const _ResponsiveGridExample();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isTablet = screenWidth >= 600;

    return Scaffold(
      appBar: VitAppBar(
        title: 'Responsive Grid',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: context.theme.primaryColor.withValues(alpha: 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isTablet ? Icons.tablet : Icons.phone_android,
                  color: context.theme.primaryColor,
                ),
                const SizedBox(width: 8),
                VitText(
                  'Screen: ${screenWidth.toInt()}px - ${isTablet ? 'Tablet (3 columns)' : 'Phone (2 columns)'}',
                ),
              ],
            ),
          ),
          Expanded(
            child: VitListView.grid(
              crossAxisCount: 1,
              tabletCrossAxisCount: 3,
              tabletBreakpoint: 600,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              contentPadding: const EdgeInsets.all(16),
              itemCount: 30,
              itemBuilder: (context, index) => Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Item ${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Tap to select',
                      style: TextStyle(
                        fontSize: 12,
                        color: context.theme.onBackgroundVariantColor,
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

class _CustomSliversExample extends StatelessWidget {
  const _CustomSliversExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Custom Slivers',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: VitListView.custom(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VitTitle('Featured'),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                        width: 200,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color:
                              Colors.primaries[index % Colors.primaries.length],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Featured ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: VitTitle('Recent Items'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text('Recent Item ${index + 1}'),
                subtitle: const Text('Recently added'),
              ),
              childCount: 5,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: VitTitle('All Items'),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Card(
                child: Center(
                  child: Text('${index + 1}'),
                ),
              ),
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarExample extends StatelessWidget {
  const _SliverAppBarExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VitListView(
        headerSliver: SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: context.theme.primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: context.theme.onPrimaryColor),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Sliver App Bar',
              style: TextStyle(color: context.theme.onPrimaryColor),
            ),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    context.theme.primaryColor,
                    context.theme.primaryColor.withValues(alpha: 0.7),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.landscape,
                  size: 80,
                  color: context.theme.onPrimaryColor.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ),
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.star, color: context.theme.primaryColor),
          title: Text('Item ${index + 1}'),
          subtitle: Text('Scroll up to see the collapsing app bar'),
        ),
      ),
    );
  }
}

class _PinnedHeaderExample extends StatelessWidget {
  const _PinnedHeaderExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Pinned Header',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: VitListView(
        pinnedHeader: true,
        header: Container(
          height: 56,
          color: context.theme.backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.filter_list, color: context.theme.primaryColor),
              const SizedBox(width: 8),
              VitText('Filter: All Items'),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Clear'),
              ),
            ],
          ),
        ),
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item ${index + 1}'),
          subtitle: const Text('Scroll to see the pinned header'),
        ),
      ),
    );
  }
}

class _HorizontalListExample extends StatelessWidget {
  const _HorizontalListExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Horizontal List',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: VitTitle('Categories'),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: VitListView(
              scrollDirection: Axis.horizontal,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                width: 100,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.category, color: Colors.white, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      'Cat ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: VitTitle('Stories'),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: VitListView(
              scrollDirection: Axis.horizontal,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 15,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: context.theme.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor:
                            Colors.primaries[index % Colors.primaries.length],
                        child: Text(
                          String.fromCharCode(65 + (index % 26)),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'User ${index + 1}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: VitListView(
              contentPadding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(child: Text('${index + 1}')),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Post ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${index + 1} hours ago',
                                style: TextStyle(
                                  color: context.theme.onBackgroundVariantColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'This is a sample post content that demonstrates the horizontal list above combined with a vertical list.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChildrenListExample extends StatelessWidget {
  const _ChildrenListExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Children List',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: VitListView(
        contentPadding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VitTitle('Welcome'),
                  const SizedBox(height: 8),
                  const Text(
                    'This list uses children instead of itemBuilder. '
                    'Each child is a unique widget.',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: context.theme.primaryColor.withValues(alpha: 0.1),
            child: const ListTile(
              leading: Icon(Icons.info),
              title: Text('Information'),
              subtitle: Text('This is an info card'),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: context.theme.successColor.withValues(alpha: 0.1),
            child: const ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Success'),
              subtitle: Text('Operation completed'),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: context.theme.errorColor.withValues(alpha: 0.1),
            child: const ListTile(
              leading: Icon(Icons.warning),
              title: Text('Warning'),
              subtitle: Text('Please review your settings'),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: context.theme.errorColor.withValues(alpha: 0.1),
            child: const ListTile(
              leading: Icon(Icons.error),
              title: Text('Error'),
              subtitle: Text('Something went wrong'),
            ),
          ),
          const SizedBox(height: 16),
          VitButton(
            text: 'Action Button',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Button pressed!')),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CustomAspectRatioExample extends StatelessWidget {
  const _CustomAspectRatioExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VitAppBar(
        title: 'Custom Aspect Ratio',
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: VitText('childAspectRatio: 16/9 (landscape cards)'),
          ),
          Expanded(
            child: VitListView.grid(
              crossAxisCount: 2,
              childAspectRatio: 16 / 9,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.black54,
                        child: Text(
                          'Video ${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 48,
                        color: Colors.white,
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

class _CombinedExample extends StatelessWidget {
  const _CombinedExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VitListView(
        headerSliver: SliverAppBar(
          expandedHeight: 180,
          pinned: true,
          backgroundColor: context.theme.primaryColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: context.theme.onPrimaryColor),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: context.theme.onPrimaryColor),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: context.theme.onPrimaryColor),
              onPressed: () {},
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Combined Example',
              style: TextStyle(color: context.theme.onPrimaryColor),
            ),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    context.theme.primaryColor,
                    context.theme.primaryColor.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
          ),
        ),
        footer: Container(
          padding: const EdgeInsets.all(16),
          color: context.theme.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.copyright,
                size: 16,
                color: context.theme.onBackgroundVariantColor,
              ),
              const SizedBox(width: 4),
              Text(
                '2026 VitListView Demo',
                style: TextStyle(color: context.theme.onBackgroundVariantColor),
              ),
            ],
          ),
        ),
        crossAxisCount: 1,
        tabletCrossAxisCount: 2,
        tabletBreakpoint: 600,
        contentPadding: const EdgeInsets.all(16),
        itemCount: 20,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Card ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'This is a combined example showing header, footer, and responsive grid.',
                        style: TextStyle(
                          color: context.theme.onBackgroundVariantColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
