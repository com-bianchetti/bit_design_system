// ignore_for_file: non_constant_identifier_names

import 'package:vit_design_system/vit_design_system.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

final VitListCardStory = Story(
  name: 'VitListCard',
  description: 'VitListCard component to display flexible list-style cards',
  wrapperBuilder: (context, child) => VitApp(
    debugShowCheckedModeBanner: false,
    theme: VitTheme(),
    home: child,
  ),
  builder: (context) => _VitListCardStoryWidget(),
);

class _VitListCardStoryWidget extends StatefulWidget {
  @override
  State<_VitListCardStoryWidget> createState() =>
      _VitListCardStoryWidgetState();
}

class _VitListCardStoryWidgetState extends State<_VitListCardStoryWidget> {
  bool isLoading = false;
  int selectedCard = -1;
  List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Basic List Card',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              title: VitText('Simple Title'),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Card with Subtitle',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              title: VitText('Title'),
              subtitle: VitText('Subtitle text goes here'),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Card with Leading Icon',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              leading: Icon(Icons.folder, color: Colors.blue),
              title: VitText('Documents'),
              subtitle: VitText('23 files'),
              trailing: Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Card with Avatar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                VitListCard(
                  leading: VitAvatar(
                    text: 'JD',
                    radius: 20,
                  ),
                  title: VitText('John Doe'),
                  subtitle: VitText('Software Engineer'),
                  trailing: Icon(Icons.message),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('John Doe tapped')),
                    );
                  },
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: VitAvatar(
                    text: 'AS',
                    radius: 20,
                  ),
                  title: VitText('Alice Smith'),
                  subtitle: VitText('Product Manager'),
                  trailing: Icon(Icons.message),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Alice Smith tapped')),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Visual Density Variants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.inbox),
              title: VitText('Compact'),
              subtitle: VitText('Smaller padding'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              visualDensity: VisualDensity.standard,
              leading: Icon(Icons.inbox),
              title: VitText('Standard'),
              subtitle: VitText('Normal padding'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              visualDensity: VisualDensity.comfortable,
              leading: Icon(Icons.inbox),
              title: VitText('Comfortable'),
              subtitle: VitText('Larger padding'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Elevated List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              elevation: 2,
              leading: Icon(Icons.star, color: Colors.amber),
              title: VitText('Elevation 2'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              elevation: 4,
              leading: Icon(Icons.star, color: Colors.amber),
              title: VitText('Elevation 4'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              elevation: 8,
              leading: Icon(Icons.star, color: Colors.amber),
              title: VitText('Elevation 8'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Card Variants',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              variant: VitCardVariant.standard,
              leading: Icon(Icons.palette),
              title: VitText('Standard Variant'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              variant: VitCardVariant.elevated,
              leading: Icon(Icons.palette),
              title: VitText('Elevated Variant'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              variant: VitCardVariant.variant,
              leading: Icon(Icons.palette),
              title: VitText('Variant'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              variant: VitCardVariant.elevatedVariant,
              leading: Icon(Icons.palette),
              title: VitText('Elevated Variant'),
            ),
            const SizedBox(height: 32),
            const Text(
              'List Cards with Borders',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              showBorder: true,
              leading: Icon(Icons.notifications),
              title: VitText('With Border'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              showBorder: true,
              borderColor: Colors.blue,
              borderWidth: 2,
              leading: Icon(Icons.notifications, color: Colors.blue),
              title: VitText('Custom Border'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Interactive / Selectable List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                3,
                (index) => VitListCard(
                  selected: selectedItems.contains(index),
                  selectedTileColor: Colors.blue.shade50,
                  leading: Icon(
                    selectedItems.contains(index)
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: selectedItems.contains(index)
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  title: VitText('Option ${index + 1}'),
                  subtitle: VitText('Tap to select'),
                  onTap: () {
                    setState(() {
                      if (selectedItems.contains(index)) {
                        selectedItems.remove(index);
                      } else {
                        selectedItems.add(index);
                      }
                    });
                  },
                  margin: EdgeInsets.only(bottom: 8),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Settings List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              leading: Icon(Icons.person, color: Colors.blue),
              title: VitText('Account'),
              subtitle: VitText('Manage your account'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              leading: Icon(Icons.notifications, color: Colors.orange),
              title: VitText('Notifications'),
              subtitle: VitText('Configure notifications'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              leading: Icon(Icons.security, color: Colors.green),
              title: VitText('Privacy & Security'),
              subtitle: VitText('Control your privacy'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              leading: Icon(Icons.help, color: Colors.purple),
              title: VitText('Help & Support'),
              subtitle: VitText('Get help with the app'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            const SizedBox(height: 32),
            const Text(
              'Contact List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                VitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: VitText('Alice Johnson'),
                  subtitle: VitText('alice@example.com'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.message, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: VitText('Bob Smith'),
                  subtitle: VitText('bob@example.com'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.message, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: VitText('Charlie Brown'),
                  subtitle: VitText('charlie@example.com'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.phone, size: 20),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.message, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Dense List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                5,
                (index) => VitListCard(
                  dense: true,
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: VitText('Task ${index + 1}'),
                  trailing: VitText('Done'),
                  margin: EdgeInsets.only(bottom: 4),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Three Line List Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              isThreeLine: true,
              leading: Icon(Icons.email, color: Colors.blue),
              title: VitText('Email Subject'),
              subtitle: Text(
                'This is a longer description that spans multiple lines to show how the three-line property works.',
                maxLines: 2,
              ),
              trailing: VitText('2m ago'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              isThreeLine: true,
              leading: Icon(Icons.email, color: Colors.blue),
              title: VitText('Another Email'),
              subtitle: Text(
                'Another example of a three-line list tile with more content that needs extra space.',
                maxLines: 2,
              ),
              trailing: VitText('5m ago'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Border Radius',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              borderRadius: BorderRadius.circular(4),
              leading: Icon(Icons.square),
              title: VitText('Small Radius'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              borderRadius: BorderRadius.circular(16),
              leading: Icon(Icons.square_rounded),
              title: VitText('Large Radius'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              borderRadius: BorderRadius.circular(32),
              leading: Icon(Icons.circle),
              title: VitText('Extra Large Radius'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Status Cards with Colors',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              backgroundColor: Colors.green.shade50,
              showBorder: true,
              borderColor: Colors.green,
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: VitText('Success', style: TextStyle(color: Colors.green)),
              subtitle: VitText('Operation completed'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              backgroundColor: Colors.red.shade50,
              showBorder: true,
              borderColor: Colors.red,
              leading: Icon(Icons.error, color: Colors.red),
              title: VitText('Error', style: TextStyle(color: Colors.red)),
              subtitle: VitText('Something went wrong'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              backgroundColor: Colors.orange.shade50,
              showBorder: true,
              borderColor: Colors.orange,
              leading: Icon(Icons.warning, color: Colors.orange),
              title: VitText('Warning', style: TextStyle(color: Colors.orange)),
              subtitle: VitText('Please review'),
              margin: EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              backgroundColor: Colors.blue.shade50,
              showBorder: true,
              borderColor: Colors.blue,
              leading: Icon(Icons.info, color: Colors.blue),
              title: VitText('Info', style: TextStyle(color: Colors.blue)),
              subtitle: VitText('Additional information'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Custom Text Styles',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              leading: Icon(Icons.text_fields),
              title: VitText('Custom Title Style'),
              subtitle: VitText('Custom subtitle style'),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              subtitleTextStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Loading State',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: VitButton(
                    text: isLoading ? 'Stop Loading' : 'Start Loading',
                    onPressed: () {
                      setState(() {
                        isLoading = !isLoading;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            VitLoadingScope(
              loading: isLoading,
              child: Column(
                children: [
                  VitListCard(
                    leading: Icon(Icons.person),
                    title: VitText('John Doe'),
                    subtitle: VitText('Software Engineer'),
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  VitListCard(
                    leading: Icon(Icons.email),
                    title: VitText('Email Subject'),
                    subtitle: VitText('Email content preview'),
                    trailing: Icon(Icons.chevron_right),
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  VitListCard(
                    leading: Icon(Icons.folder),
                    title: VitText('Documents'),
                    subtitle: VitText('23 files'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'File Manager List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                VitListCard(
                  leading: Icon(Icons.folder, color: Colors.blue, size: 32),
                  title: VitText('Photos'),
                  subtitle: VitText('256 items • 1.2 GB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: Icon(Icons.folder, color: Colors.green, size: 32),
                  title: VitText('Documents'),
                  subtitle: VitText('89 items • 456 MB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: Icon(
                    Icons.description,
                    color: Colors.orange,
                    size: 32,
                  ),
                  title: VitText('Report.pdf'),
                  subtitle: VitText('Modified today • 2.3 MB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: Icon(Icons.image, color: Colors.purple, size: 32),
                  title: VitText('Vacation.jpg'),
                  subtitle: VitText('Modified yesterday • 4.1 MB'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Music Player List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                VitListCard(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.album, color: Colors.white),
                  ),
                  title: VitText('Song Title 1'),
                  subtitle: VitText('Artist Name • Album Name'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VitText('3:45'),
                      SizedBox(width: 8),
                      Icon(Icons.play_arrow),
                    ],
                  ),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.album, color: Colors.white),
                  ),
                  title: VitText('Song Title 2'),
                  subtitle: VitText('Artist Name • Album Name'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VitText('4:12'),
                      SizedBox(width: 8),
                      Icon(Icons.play_arrow),
                    ],
                  ),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.album, color: Colors.white),
                  ),
                  title: VitText('Song Title 3'),
                  subtitle: VitText('Artist Name • Album Name'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VitText('2:58'),
                      SizedBox(width: 8),
                      Icon(Icons.play_arrow),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Notification List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: [
                VitListCard(
                  backgroundColor: Colors.blue.shade50,
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.message, color: Colors.white, size: 20),
                  ),
                  title: VitText('New message from John'),
                  subtitle: VitText('Hey, how are you doing?'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VitText('2m', style: TextStyle(fontSize: 12)),
                      SizedBox(height: 4),
                      VitBadge(count: 1),
                    ],
                  ),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.thumb_up, color: Colors.white, size: 20),
                  ),
                  title: VitText('Alice liked your post'),
                  subtitle: VitText('Great work on the project!'),
                  trailing: VitText('5m', style: TextStyle(fontSize: 12)),
                  onTap: () {},
                  margin: EdgeInsets.only(bottom: 8),
                ),
                VitListCard(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.group, color: Colors.white, size: 20),
                  ),
                  title: VitText('New team member'),
                  subtitle: VitText('Bob Smith joined your team'),
                  trailing: VitText('1h', style: TextStyle(fontSize: 12)),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Card with Bottom Widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            VitListCard(
              leading: const Icon(Icons.event, color: Colors.purple),
              title: VitText('Team Meeting'),
              subtitle: VitText('10:00 AM - 11:30 AM'),
              trailing: const Icon(Icons.chevron_right),
              bottomWidget: Padding(
                padding: const EdgeInsets.only(left: 72, right: 16, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.purple.shade50,
                          foregroundColor: Colors.purple,
                        ),
                        onPressed: () {},
                        child: const Text('Join'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Decline'),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {},
              margin: const EdgeInsets.only(bottom: 8),
            ),
            VitListCard(
              leading: const Icon(Icons.cloud, color: Colors.blue),
              title: VitText('Storage Limit'),
              subtitle: VitText('You have used 80% of your space.'),
              bottomWidget: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  top: 8,
                ),
                child: LinearProgressIndicator(
                  value: 0.8,
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                  backgroundColor: Colors.grey.shade200,
                  color: Colors.blue,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
