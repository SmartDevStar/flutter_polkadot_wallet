import 'package:flutter/material.dart';
import 'package:polkadot_flutter/components.dart';

class WalletMainPage extends StatefulWidget {
  const WalletMainPage({Key? key}) : super(key: key);

  @override
  State<WalletMainPage> createState() => _WalletMainPageState();
}

class _WalletMainPageState extends State<WalletMainPage> {
  int _currentBottomSheetPageIdx = 0;
  late final TextEditingController _searchAddressController;
  late final TextEditingController _sendAmountController;
  final PageController _sendBottomSheetPageController = PageController();
  late List<BottomNavigationBarItem> navBarItems;
  final ValueNotifier<int> _targetMyAccIdx = ValueNotifier<int>(0);
  final ValueNotifier<int?> _targetUserIdx = ValueNotifier<int?>(null);
  final ValueNotifier<double?> _sendAmount = ValueNotifier<double?>(null);

  List<Map<String, dynamic>> users = [
    {
      'username': 'Beexay',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
    {
      'username': 'Dasun Bussi',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
    {
      'username': 'Smart Gaven',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
  ];

  List<Map<String, dynamic>> myAccounts = [
    {
      'username': 'Account1',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
    {
      'username': 'Account2',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
    {
      'username': 'Account3',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
    {
      'username': 'Account4',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
    {
      'username': 'Account5',
      'avatarUrl': '',
      'balance': 19.3452,
      'publicAddress': '0x3dc67a3e9d7c928b1f3423',
    },
  ];

  List<Map<String, dynamic>> transactions = [
    {
      'type': 1,
      'coinType': 'BNB',
      'amount': 0.3452,
      'status': 200,
      'from': '0x3d87f7a1439b47ce3223d',
      'to': '0x1e87f7a1439b47564342f',
      'nonce': '#0',
      'dateTime': 'Mar 3 at 10:04am',
    },
    {
      'type': 0,
      'coinType': 'BNB',
      'amount': 0.3452,
      'status': 200,
      'from': '0x3d87f7a1439b47ce3223d',
      'to': '0x1e87f7a1439b47564342f',
      'nonce': '#0',
      'dateTime': 'Mar 3 at 10:04am',
    },
    {
      'type': 1,
      'coinType': 'BNB',
      'amount': 0.3452,
      'status': 500,
      'from': '0x3d87f7a1439b47ce3223d',
      'to': '0x1e87f7a1439b47564342f',
      'nonce': '#0',
      'dateTime': 'Mar 3 at 10:04am',
    },
    {
      'type': 0,
      'coinType': 'BNB',
      'amount': 0.3452,
      'status': 200,
      'from': '0x3d87f7a1439b47ce3223d',
      'to': '0x1e87f7a1439b47564342f',
      'nonce': '#0',
      'dateTime': 'Mar 3 at 10:04am',
    },
    {
      'type': 1,
      'coinType': 'BNB',
      'amount': 0.3452,
      'status': 200,
      'from': '0x3d87f7a1439b47ce3223d',
      'to': '0x1e87f7a1439b47564342f',
      'nonce': '#0',
      'dateTime': 'Mar 3 at 10:04am',
    },
  ];

  @override
  void initState() {
    super.initState();

    navBarItems = [
      BottomNavigationBarItem(
        activeIcon: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFF8AD4EC),
                Color(0xFFEF96FF),
                Color(0xFFFF56A9),
                Color(0xFFFFAA6C),
              ],
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.wallet_outlined,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.wallet_outlined,
          color: Color(0xFF8FA2B7),
        ),
        label: 'Wallet',
      ),
      BottomNavigationBarItem(
        activeIcon: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFF8AD4EC),
                Color(0xFFEF96FF),
                Color(0xFFFF56A9),
                Color(0xFFFFAA6C),
              ],
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.swap_vert_circle_outlined,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.swap_vert_circle_outlined,
          color: Color(0xFF8FA2B7),
        ),
        label: 'Swap',
      ),
      BottomNavigationBarItem(
        activeIcon: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Color(0xFF8AD4EC),
                Color(0xFFEF96FF),
                Color(0xFFFF56A9),
                Color(0xFFFFAA6C),
              ],
            ).createShader(bounds);
          },
          child: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.settings,
          color: Color(0xFF8FA2B7),
        ),
        label: 'Settings',
      ),
    ];
    _searchAddressController = TextEditingController();
    _sendAmountController = TextEditingController(text: '0.0');
    _targetUserIdx.value = null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(137, 30, 47, 0.988),
              Color.fromRGBO(26, 10, 10, 0.322),
              Color.fromRGBO(48, 17, 17, 0.322),
              Color.fromRGBO(6, 2, 2, 0.324),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'BNB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: _buildBody(),
          bottomNavigationBar: buildBottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 15.0),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            child: const Text(
              '19.2371 BNB',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          const Text(
            '\$4,360.8582',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    builder: (context) {
                      return Container(
                        color: const Color(0xFF080A0C),
                        padding: const EdgeInsets.all(16),
                        height: MediaQuery.of(context).size.height * 0.95,
                        child: _buildSendBottomSheet(),
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 100,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF202832),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Send',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useRootNavigator: true,
                    builder: (context) => const Text(''),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(5),
                  width: 120,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF202832),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_available_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0, height: 0.0),
                      Text(
                        'Receive',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ...List.generate(
                    transactions.length,
                    (index) => DcyTransactionListItem(
                      type: transactions[index]['type'],
                      status: transactions[index]['status'],
                      coinType: transactions[index]['coinType'],
                      amount: transactions[index]['amount'],
                      dateTime: transactions[index]['dateTime'],
                      onTap: () async {
                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useRootNavigator: true,
                          builder: (context) {
                            return Container(
                              color: const Color(0xFF080A0C),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: _buildTransactionDetailBottomSheet(
                                  transactions[index]['type'],
                                  transactions[index]['status']),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      onTap: (value) {},
      currentIndex: 0,
      items: navBarItems,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      unselectedItemColor: const Color(0xFF8FA2B7),
    );
  }

  Widget _buildSendBottomSheet() {
    return PageView(
      controller: _sendBottomSheetPageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildSendToBottomSheetPage(),
        _buildSendAmountBottomSheetPage(),
        _buildSendConfirmBottomSheetPage(),
        Container(),
      ],
    );
  }

  Widget _buildSendToBottomSheetPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Send To',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: DcyIconButton(
                padding: EdgeInsets.zero,
                icon: Icons.close,
                tooltip: 'close',
                enabledColor: Colors.white,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            ValueListenableBuilder<int?>(
                valueListenable: _targetUserIdx,
                builder: (context, value, _) {
                  return value != null
                      ? Container(
                          alignment: Alignment.centerLeft,
                          child: DcyIconButton(
                            padding: EdgeInsets.zero,
                            icon: Icons.chevron_left,
                            tooltip: 'Prev',
                            enabledColor: Colors.white,
                            onTap: () {
                              _targetUserIdx.value = null;
                            },
                          ),
                        )
                      : Container();
                }),
          ],
        ),
        const SizedBox(height: 30.0),
        const Text(
          'From',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 10.0),
        ValueListenableBuilder<int>(
            valueListenable: _targetMyAccIdx,
            builder: (context, value, _) {
              return DcyUserListItem(
                username: myAccounts[value]['username'],
                balance: myAccounts[value]['balance'],
                publicAddress: myAccounts[value]['publicKeyAddress'],
                walletInfoToDispay: 0,
                action: DcyIconButton(
                  icon: Icons.chevron_right,
                  tooltip: 'action',
                  enabledColor: Colors.white,
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useRootNavigator: true,
                      builder: (context) {
                        return Container(
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 30.0),
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: _buildUserAccountsBottomSheet(),
                        );
                      },
                    );
                  },
                ),
              );
            }),
        const SizedBox(height: 30.0),
        const Text(
          'To',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 10.0),
        ValueListenableBuilder<int?>(
            valueListenable: _targetUserIdx,
            builder: (context, value, _) {
              if (value == null) {
                return TextField(
                  controller: _searchAddressController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF181E25)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xFF181E25))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color:
                                Color(0xFF181E25)), // Set focused border color
                        borderRadius: BorderRadius.circular(15)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Search, public address (0x), or ENS',
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Color(0xFF6A84A0)),
                    suffixIcon: DcyIconButton(
                      size: 25,
                      tooltip: 'Show',
                      onTap: () async {},
                      icon: Icons.qr_code_scanner_outlined,
                      enabledColor: Colors.white,
                    ),
                  ),
                );
              } else {
                return DcyUserListItem(
                  username: users[value]['username'],
                  balance: users[value]['balance'],
                  publicAddress: users[value]['publicAddress'],
                  walletInfoToDispay: 1,
                  action: DcyIconButton(
                    icon: Icons.close,
                    tooltip: 'remove',
                    enabledColor: Colors.white,
                    onTap: () {
                      _targetUserIdx.value = null;
                    },
                  ),
                );
              }
            }),
        const SizedBox(height: 40.0),
        ValueListenableBuilder<int?>(
            valueListenable: _targetUserIdx,
            builder: (context, value, _) {
              return value == null
                  ? Container()
                  : Expanded(
                      child: Container(),
                    );
            }),
        ValueListenableBuilder<int?>(
            valueListenable: _targetUserIdx,
            builder: (context, value, _) {
              if (value == null) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: const TextSpan(
                          text: 'Transfer Between My Accounts',
                          style: TextStyle(
                            color: Color(0xFF5F97FF),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      const Text(
                        'Recent',
                        style:
                            TextStyle(color: Color(0xFF8FA2B7), fontSize: 16),
                      ),
                      const SizedBox(height: 20.0),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                ...List.generate(
                                  users.length,
                                  (index) => Column(
                                    children: <Widget>[
                                      DcyUserListItem(
                                        username: users[index]['username'],
                                        balance: users[index]['balance'],
                                        publicAddress: users[index]
                                            ['publicAddress'],
                                        walletInfoToDispay: 1,
                                        onTap: () {
                                          _targetUserIdx.value = index;
                                        },
                                      ),
                                      const SizedBox(height: 20.0),
                                    ],
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
              } else {
                return TextButton(
                  onPressed: () {
                    goToNextPage();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF8AD4EC),
                          Color(0xFFEF96FF),
                          Color(0xFFFF56A9),
                          Color(0xFFFFAA6C),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                );
              }
            }),
      ],
    );
  }

  Widget _buildSendAmountBottomSheetPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Amount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: DcyIconButton(
                padding: EdgeInsets.zero,
                icon: Icons.close,
                tooltip: 'close',
                enabledColor: Colors.white,
                onTap: () {
                  _currentBottomSheetPageIdx = 0;
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: DcyIconButton(
                padding: EdgeInsets.zero,
                icon: Icons.chevron_left,
                tooltip: 'Prev',
                enabledColor: Colors.white,
                onTap: () {
                  goToPrevPage();
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 30.0),
        Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButton<String>(
                    value: 'BNB',
                    style: const TextStyle(color: Colors.white),
                    isExpanded: true,
                    dropdownColor: Colors.black,
                    onChanged: (newValue) {},
                    underline: Container(),
                    items: <String>['BNB']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.only(top: 18.0),
              child: const Text(
                'Use Max',
                style: TextStyle(
                  color: Color(0xFF5F97FF),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        TextField(
          controller: _sendAmountController,
          style: TextStyle(
            fontSize: 40,
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
          textAlign: TextAlign.center,
          keyboardType: const TextInputType.numberWithOptions(
            signed: true,
          ),
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            if (double.tryParse(value) != null) {
              _sendAmount.value = double.tryParse(value);
            } else {
              _sendAmount.value = null;
            }
          },
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 140,
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xff202832),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '\$55.99312',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(width: 5.0),
              Icon(
                Icons.swap_vert,
                color: Colors.white,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0),
        const Expanded(
          child: Text(
            'Balance: 19.2371 BNB',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        ValueListenableBuilder<double?>(
            valueListenable: _sendAmount,
            builder: (context, value, _) {
              if (value != null) {
                return TextButton(
                  onPressed: () {
                    goToNextPage();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF8AD4EC),
                          Color(0xFFEF96FF),
                          Color(0xFFFF56A9),
                          Color(0xFFFFAA6C),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                );
              } else {
                return TextButton(
                  onPressed: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xff202832),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                );
              }
            }),
      ],
    );
  }

  Widget _buildSendConfirmBottomSheetPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: DcyIconButton(
                padding: EdgeInsets.zero,
                icon: Icons.close,
                tooltip: 'close',
                enabledColor: Colors.white,
                onTap: () {
                  _currentBottomSheetPageIdx = 0;
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: DcyIconButton(
                padding: EdgeInsets.zero,
                icon: Icons.chevron_left,
                tooltip: 'Prev',
                enabledColor: Colors.white,
                onTap: () {
                  goToPrevPage();
                },
              ),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Amount',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          alignment: Alignment.center,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                colors: [Color(0xFF70A2FF), Color(0xFF54F0D1)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds);
            },
            child: const Text(
              '0.2371 BNB',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        const Text(
          'From',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 15.0),
        ValueListenableBuilder<int>(
            valueListenable: _targetMyAccIdx,
            builder: (context, value, _) {
              return DcyUserListItem(
                username: myAccounts[value]['username'],
                balance: myAccounts[value]['balance'],
                publicAddress: myAccounts[value]['publicKeyAddress'],
                walletInfoToDispay: 0,
              );
            }),
        const SizedBox(height: 25.0),
        const Text(
          'To',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 15.0),
        ValueListenableBuilder<int?>(
            valueListenable: _targetUserIdx,
            builder: (context, value, _) {
              return DcyUserListItem(
                username: users[value ?? 0]['username'],
                balance: users[value ?? 0]['balance'],
                publicAddress: users[value ?? 0]['publicAddress'],
                walletInfoToDispay: 1,
              );
            }),
        const SizedBox(height: 40.0),
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              border: Border.all(
                color: Colors.white10,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              )),
          child: Column(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '0.2436 BNB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: const TextSpan(
                        text: 'Network fee ',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        children: [
                          TextSpan(
                            text: ' Edit',
                            style: TextStyle(
                                color: Color(0xFF5F97FF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                  const Text(
                    '0.12 BNB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              border: Border.all(
                color: Colors.white10,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              )),
          child: Column(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '0.3636 BNB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  '\$84.65',
                  style: TextStyle(
                    color: Color(0xFF8FA2B7),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: Container()),
        TextButton(
          onPressed: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF8AD4EC),
                  Color(0xFFEF96FF),
                  Color(0xFFFF56A9),
                  Color(0xFFFFAA6C),
                ],
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            child: const Text(
              'Send',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserAccountsBottomSheet() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Accounts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ...List.generate(
                  myAccounts.length,
                  (index) => Column(
                    children: <Widget>[
                      ValueListenableBuilder<int?>(
                          valueListenable: _targetMyAccIdx,
                          builder: (context, value, _) {
                            return DcyUserListItem(
                              username: myAccounts[index]['username'],
                              balance: myAccounts[index]['balance'],
                              publicAddress: myAccounts[index]['publicAddress'],
                              walletInfoToDispay: 1,
                              action: DcyIconButton(
                                icon: Icons.check_circle_outline,
                                tooltip: 'action',
                                enabledColor: value != null && value == index
                                    ? Colors.greenAccent
                                    : Colors.transparent,
                                onTap: () async {},
                              ),
                              onTap: () {
                                _targetMyAccIdx.value = index;
                                Navigator.pop(context);
                              },
                            );
                          }),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionDetailBottomSheet(int type, int status) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            type == 1 ? 'Sent BNB' : 'Received BNB',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(height: 50.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Status',
              style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
            ),
            Text(
              'Date',
              style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              status == 200 ? 'Confirmed' : 'Canceled',
              style: TextStyle(
                  color: status == 200 ? Colors.greenAccent : Colors.red,
                  fontSize: 14),
            ),
            const Text(
              'Mar 3 at 10:04am',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 40.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'From',
              style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
            ),
            Text(
              'To',
              style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              getReducedString('0x3d87f7a1439b47ce3223d'),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              getReducedString('0x3d87f7a1439b47ce3223d'),
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 40.0),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            'Nonce',
            style: TextStyle(color: Color(0xFF8FA2B7), fontSize: 14),
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          child: const Text(
            '#0',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        const SizedBox(height: 40.0),
        if (type == 1)
          Container(
            width: double.maxFinite,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                border: Border.all(
                  color: Colors.white10,
                  width: 0.5,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                )),
            child: Column(
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '0.2436 BNB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: const TextSpan(
                          text: 'Network fee ',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          children: [
                            TextSpan(
                              text: ' Edit',
                              style: TextStyle(
                                  color: Color(0xFF5F97FF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                    const Text(
                      '0.12 BNB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.white10,
              width: 0.5,
            ),
            borderRadius: type == 1
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )
                : const BorderRadius.all(Radius.circular(15.0)),
          ),
          child: Column(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '0.3636 BNB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  '\$84.65',
                  style: TextStyle(
                    color: Color(0xFF8FA2B7),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30.0),
        if (type == 0)
          const Text(
            'View on Mainnet',
            style: TextStyle(color: Color(0xFF5F97FF), fontSize: 16),
          ),
      ],
    );
  }

  void goToNextPage() {
    _currentBottomSheetPageIdx++;
    if (_currentBottomSheetPageIdx > 2) {
      _currentBottomSheetPageIdx = 2;
      return;
    }
    _sendBottomSheetPageController.animateToPage(
      _currentBottomSheetPageIdx,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void goToPrevPage() {
    _currentBottomSheetPageIdx -= 1;
    if (_currentBottomSheetPageIdx < 0) {
      Navigator.pop(context);
    } else {
      _sendBottomSheetPageController.animateToPage(
        _currentBottomSheetPageIdx,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  String getReducedString(String originalString) {
    String reducedString =
        '${originalString.substring(0, 6)}...${originalString.substring(originalString.length - 4)}';
    return reducedString;
  }
}
