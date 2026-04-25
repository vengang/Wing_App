import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsApp extends StatefulWidget {
  const SettingsApp({super.key});

  @override
  State<SettingsApp> createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  bool _faceIdEnabled = false;
  bool _onlinePaymentEnabled = false;
  bool _gamificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 171, 212, 47),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),

            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.translate,
                  iconColor: Colors.blueAccent,
                  title: 'Language',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xFF9CA3AF),
                        size: 18,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                _Divider(),
                _SettingsTile(
                  icon: Icons.lock_outline,
                  iconColor: Colors.blueAccent,
                  title: 'Session Timeout',
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        '60  seconds',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color(0xFF9CA3AF),
                        size: 18,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
                _Divider(),
                _SettingsTile(
                  icon: Icons.face_unlock_rounded,
                  iconColor: Colors.blueAccent,
                  title: 'Login with Face ID',
                  trailing: Switch(
                    value: _faceIdEnabled,
                    onChanged: (val) => setState(() => _faceIdEnabled = val),
                    activeTrackColor: CupertinoColors.activeGreen,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFD1D5DB),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.shield_outlined,
                  iconColor: Colors.blueAccent,
                  title: 'Generate 6-Digit Code',
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Color(0xFF9CA3AF),
                    size: 18,
                  ),
                  onTap: () {},
                ),
                _Divider(),
                _SettingsTile(
                  icon: Icons.language,
                  iconColor: Colors.blueAccent,
                  title: 'Online Payment Service',
                  trailing: Switch(
                    value: _onlinePaymentEnabled,
                    onChanged: (val) =>
                        setState(() => _onlinePaymentEnabled = val),
                    activeThumbColor: Colors.white,
                    activeTrackColor: CupertinoColors.activeGreen,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFD1D5DB),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            _SettingsCard(
              children: [
                _SettingsTile(
                  icon: Icons.sports_esports_outlined,
                  iconColor: Colors.blueAccent,
                  title: 'Gamification',
                  subtitle: 'Surprise Box, Treasure Hunts, and more await!',
                  trailing: Switch(
                    value: _gamificationEnabled,
                    onChanged: (val) =>
                        setState(() => _gamificationEnabled = val),
                    activeThumbColor: Colors.white,
                    activeTrackColor: CupertinoColors.activeGreen,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFD1D5DB),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    required this.trailing,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final Widget trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(child: Icon(icon, color: iconColor, size: 20)),
            SizedBox(width: 14),
            // Title + optional subtitle
            Expanded(
              child: subtitle != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111827),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF111827),
                      ),
                    ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.5,
      indent: 66,
      endIndent: 16,
      color: Color(0xFFE5E7EB),
    );
  }
}
