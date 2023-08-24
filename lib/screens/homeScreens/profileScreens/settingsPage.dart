import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSettingsOption(
            context,
            'Change Email',
            Icons.email,
            () {
              // Navigate to change email screen
            },
          ),
          _buildSettingsOption(
            context,
            'Change Password',
            Icons.lock,
            () {
              // Navigate to change password screen
            },
          ),
          _buildSettingsOption(
            context,
            'Deactivate Account',
            Icons.delete_outline,
            () {
              // Deactivate account
            },
          ),
          _buildSettingsOption(
            context,
            'Delete Account',
            Icons.delete_forever,
            () {
              // Delete account
            },
          ),
          _buildSettingsOption(
            context,
            'Two-factor Authentication',
            Icons.verified_user,
            () {
              // Navigate to two-factor authentication screen
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Notification Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSettingsOption(
            context,
            'Customize Notifications',
            Icons.notifications,
            () {
              // Navigate to customize notifications screen
            },
          ),
          _buildSettingsOption(
            context,
            'Delivery Method',
            Icons.sms,
            () {
              // Navigate to delivery method screen
            },
          ),
          _buildSettingsOption(
            context,
            'Do Not Disturb',
            Icons.do_not_disturb,
            () {
              // Navigate to do not disturb screen
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Integration Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSettingsOption(
            context,
            'Import/Export Data',
            Icons.import_export,
            () {
              // Navigate to import/export data screen
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Language and Region',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSettingsOption(
            context,
            'Preferred Language',
            Icons.language,
            () {
              // Navigate to preferred language screen
            },
          ),
          _buildSettingsOption(
            context,
            'Time Zone and Regional Settings',
            Icons.public,
            () {
              // Navigate to time zone and regional settings screen
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Accessibility',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSettingsOption(
            context,
            'Enable Accessibility Features',
            Icons.accessibility,
            () {
              // Navigate to enable accessibility features screen
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Subscription and Billing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSettingsOption(
            context,
            'View Subscription Plan',
            Icons.subscriptions,
            () {
              // Navigate to view subscription plan screen
            },
          ),
          _buildSettingsOption(
            context,
            'Upgrade/Downgrade Subscription',
            Icons.arrow_upward,
            () {
              // Navigate to upgrade/downgrade subscription screen
            },
          ),
          _buildSettingsOption(
            context,
            'Billing History',
            Icons.history,
            () {
              // Navigate to billing history screen
            },
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Theme and Appearance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildSettingsOption(
            context,
            'Choose Theme/Layout',
            Icons.color_lens,
            () {
              // Navigate to choose theme/layout screen
            },
          ),
          _buildSettingsOption(
            context,
            'Adjust Font Preferences',
            Icons.text_fields,
            () {
              // Navigate to adjust font preferences screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
