import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_flutter/shared/theme/colors.dart';

class NavigatorBarWidget extends ConsumerStatefulWidget {
  const NavigatorBarWidget({super.key});

  @override
  ConsumerState<NavigatorBarWidget> createState() => _NavigatorBarWidgetState();
}

class _NavigatorBarWidgetState extends ConsumerState<NavigatorBarWidget> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> _navItems = [
    {'icon': 'assets/img/flight-rounded.svg', 'label': tr('navigation.flight')},
    {
      'icon': 'assets/img/currency-dollar.svg',
      'label': tr('navigation.currency'),
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedIndex(GoRouterState.of(context).name);
    });
  }

  void _updateSelectedIndex(String? location) {
    if (mounted) {
      setState(() {
        switch (location) {
          case 'flight':
            _selectedIndex = 0;
            break;
          case 'currency':
            _selectedIndex = 1;
            break;
        }
      });
    }
  }

  Widget _buildNavItem(Map<String, dynamic> item, int index) {
    final isSelected = _selectedIndex == index;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });

            if (index == 0) {
              context.goNamed('flight');
            } else if (index == 1) {
              context.goNamed('currency');
            }
          },
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (isSelected)
                  Positioned(
                    bottom: -10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primary100Color.withAlpha(((0.2) * 255).round()),
                        gradient: RadialGradient(
                          colors: [
                            primary100Color.withAlpha(((0.4) * 255).round()),
                            primary100Color.withAlpha(((0.2) * 255).round()),
                          ],
                          stops: const [0.1, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primary100Color.withAlpha(
                              ((0.3) * 255).round(),
                            ),
                            blurRadius: 15,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: SvgPicture.asset(
                        item['icon'],
                        width: 28,
                        height: 28,
                        colorFilter: const ColorFilter.mode(
                          neutral900Color,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Text(
                      item['label'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: neutral900Color,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: width,
          height: 83,
          decoration: BoxDecoration(
            color: backgroundGrayColor.withAlpha(((0.37) * 255).round()),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withAlpha(((0.1) * 255).round()),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildNavItem(_navItems[0], 0),
                _buildNavItem(_navItems[1], 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
