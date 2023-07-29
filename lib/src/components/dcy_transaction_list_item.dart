import 'dart:async';
import 'package:flutter/material.dart';

class DcyTransactionListItem extends StatefulWidget {
  const DcyTransactionListItem({
    required this.type,
    required this.coinType,
    required this.amount,
    required this.status,
    required this.dateTime,
    this.onTap,
    this.backgroundColor,
    this.padding,
    this.action,
    super.key,
  });

  /// To show transaction type 1: sent, 0: receive
  final int type;

  /// To show coin type ex: BNB
  final String coinType;

  /// To show amount
  final double amount;

  /// To show transaction status 200: confirmed, 500: canceled
  final int status;

  /// To show transaction dateTime
  final String dateTime;

  /// Background color of user list item
  final Color? backgroundColor;

  /// Allows overriding of the standard size of the padding.
  final EdgeInsets? padding;

  /// The action to execute when tap,
  final FutureOr<void> Function()? onTap;

  /// The action widget for the user account
  final Widget? action;

  @override
  State<DcyTransactionListItem> createState() => _DcyTransactionListItemState();
}

class _DcyTransactionListItemState extends State<DcyTransactionListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: Container(
        padding: widget.padding ??
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        color: widget.backgroundColor ?? const Color(0xFF080A0C),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.dateTime,
              style: const TextStyle(
                color: Color(0xFF8FA2B7),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Icon(
                  widget.type == 1 ? Icons.send_outlined : Icons.input,
                  color: Colors.white,
                  size: 37,
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.type == 1
                                ? 'Sent ${widget.coinType}'
                                : 'Received ${widget.coinType}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${widget.amount} ${widget.coinType}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            widget.status == 200 ? 'Confirmed' : 'Canceled',
                            style: TextStyle(
                              color: widget.status == 200
                                  ? Colors.green
                                  : Colors.red,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '\$${(widget.amount * 1987).toStringAsFixed(5)}',
                            style: const TextStyle(
                              color: Color(0xFF8FA2B7),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
