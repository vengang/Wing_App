import 'package:flutter/material.dart';

Widget wingIcon() => SizedBox(
  width: 28,
  height: 28,
  child: Image.asset('lib/images/wing_icon.png', fit: BoxFit.contain),
);

class TransferOption {
  final String label;
  final Widget fromIcon;
  final Widget toIcon;
  final bool isBidirectional;

  const TransferOption({
    required this.label,
    required this.fromIcon,
    required this.toIcon,
    this.isBidirectional = false,
  });
}

List<TransferOption> transferOptions = [
  TransferOption(
    label: 'Transfer to Own Account',
    fromIcon: const Icon(Icons.person, color: Color(0xFF1A6FD4), size: 28),
    toIcon: const Icon(Icons.person, color: Color(0xFF1A6FD4), size: 28),
  ),
  TransferOption(
    label: 'Wing Bank to Wing Bank',
    fromIcon: wingIcon(),
    toIcon: wingIcon(),
  ),
  TransferOption(
    label: 'Wing Bank to Other Bank',
    fromIcon: wingIcon(),
    toIcon: const Icon(
      Icons.account_balance,
      color: Color(0xFF1A6FD4),
      size: 28,
    ),
  ),
  TransferOption(
    label: 'Wing Wei Luy',
    fromIcon: wingIcon(),
    toIcon: const Icon(Icons.smartphone, color: Color(0xFF1A6FD4), size: 28),
  ),
  TransferOption(
    label: 'Trading Account',
    fromIcon: wingIcon(),
    toIcon: const Icon(
      Icons.candlestick_chart,
      color: Color(0xFF1A6FD4),
      size: 28,
    ),
    isBidirectional: true,
  ),
];

class LocTransfer extends StatefulWidget {
  const LocTransfer({super.key});

  @override
  State<LocTransfer> createState() => _LocTransferState();
}

class _LocTransferState extends State<LocTransfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFa9cb39),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        title: const Text('Local Transfer'),
      ),
      body: Stack(children: [_buildheader(), _buildBody()]),
    );
  }

  Widget _buildheader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(
            color: Color(0xFFD1DDAD),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: Image.asset('lib/images/locTransferimg.png'),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Positioned(
      top: 180,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          itemCount: transferOptions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _TransferTile(option: transferOptions[index]);
          },
        ),
      ),
    );
  }
}

class _TransferTile extends StatefulWidget {
  final TransferOption option;
  const _TransferTile({required this.option});

  @override
  State<_TransferTile> createState() => _TransferTileState();
}

class _TransferTileState extends State<_TransferTile> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: _pressed ? const Color(0xFFEAF4FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_pressed ? 0.04 : 0.07),
              blurRadius: _pressed ? 4 : 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            widget.option.fromIcon,
            const SizedBox(width: 8),
            Icon(
              widget.option.isBidirectional
                  ? Icons.swap_horiz
                  : Icons.arrow_forward,
              color: const Color(0xFF1A6FD4),
              size: 20,
            ),
            const SizedBox(width: 8),
            widget.option.toIcon,
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                widget.option.label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFFBBBBBB), size: 22),
          ],
        ),
      ),
    );
  }
}
