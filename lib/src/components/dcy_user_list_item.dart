import 'dart:async';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class DcyUserListItem extends StatefulWidget {
  const DcyUserListItem({
    required this.username,
    this.avatarUrl,
    this.avatarSize,
    this.balance,
    this.publicAddress,
    this.walletInfoToDispay,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.action,
    super.key,
  });

  /// Username to dispay within user list item
  final String username;

  /// User avatar url
  final String? avatarUrl;

  /// User avatar size(radius)
  final double? avatarSize;

  /// User balance
  final double? balance;

  /// User wallet public address
  final String? publicAddress;

  /// What wallet info to display on user list item
  final int? walletInfoToDispay;

  /// Background color of user list item
  final Color? backgroundColor;

  /// Allows overriding of the standard size of the padding.
  final EdgeInsets? padding;

  /// The action to execute when tap,
  final FutureOr<void> Function()? onTap;

  /// The action widget for the user account
  final Widget? action;

  @override
  State<DcyUserListItem> createState() => _DcyUserListItemState();
}

class _DcyUserListItemState extends State<DcyUserListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: Container(
        padding: widget.padding ?? const EdgeInsets.all(8),
        color: widget.backgroundColor ?? const Color(0xFF080A0C),
        child: Row(
          children: <Widget>[
            _buildUserAvatar(),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    widget.walletInfoToDispay != null
                        ? widget.walletInfoToDispay == 0
                            ? 'Balance: ${widget.balance} BNB'
                            : '${widget.publicAddress}'
                        : '',
                    style: const TextStyle(
                      color: Color(0xFF8FA2B7),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            widget.action ?? Container(),
          ],
        ),
      ),
    );
  }

  _buildUserAvatar() {
    final color =
        RandomColor().randomColor(colorBrightness: ColorBrightness.dark);

    return widget.avatarUrl != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(widget.avatarUrl!),
            radius: widget.avatarSize ?? 22,
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: widget.avatarSize ?? 22,
            child: Text(
              widget.username.substring(0, 1).toUpperCase(),
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          );
  }
}
