import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: Lotus App(),
    debugShowCheckedModeBanner: false,
  ));
}

@override
class LotusApp extends StatefulWidget {
  @override
  State<LotusApp> createState() => _LotusAppState();
}

class _LotusAppState extends State<LotusApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                _buildHeader(),
                _buildMainContent(context),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("LOTUS SENTRY", style: TextStyle(color: Colors.grey[400])),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("CONNECT WALLET"),
                ),
                SizedBox(width: 16),
                Icon(Icons.search, color: Colors.grey[400]),
                SizedBox(width: 8),
                Icon(Icons.verified_user, color: Colors.grey[400]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    final List<String> _texts = [
      'Time is your asset',
      'Spend. Save. Succeed',
      'Access half your collateral as a loan'
    ];
    int _index = 0;
    bool _isHovered = false;

    return Flexible(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                children: [
                  Text(
                    "Real World Real Assets Real Time",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: AnimatedSwitcher(
                      duration: Duration(seconds: 1),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: Text(
                        _texts[_index],
                        key: ValueKey<int>(_index),
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _isHovered
                            ? [Colors.orange.shade200, Colors.orange.shade200]
                            : [Colors.transparent, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(
                        color: Colors.orange.shade100,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Get your first Self-Repaying Loan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Image.network("https://placehold.co/600x300", height: 300),
          _buildTextSection(),
          _buildPathSection(),
          _buildLeverageSection(),
          _buildGridSection(),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            Text(
              "By borrowing a synthetic version of the asset you deposit you'll avoid the risk of liquidation. Defi innovation on a whole new level, Alchemix is the first same-asset loan product in DeFi.",
              style: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(height: 16),
            Text(
              "Using your collateral we earn yield on your behalf to pay off your loan automagically!",
              style: TextStyle(color: Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPathSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Text(
            "Choose your path",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPathOption("Deposit", "Deposit collateral"),
              _buildPathOption("Earn", "let your deposit magically earn yield"),
              _buildPathOption("Borrow", "Borrow your future yield"),
              _buildPathOption("Spend", "Spend your earned credit"),
              _buildPathOption("Save", "Save your earned credit"),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Learn more",
              style: TextStyle(color: Colors.blue[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeverageSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        children: [
          Text(
            "Leverage your assets",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAssetOption(
                  "ETH 50% LTV", "https://placehold.co/50x50", "ETH logo"),
              _buildAssetOption("WSTETH 50% LTV", "https://placehold.co/50x50",
                  "WSTETH logo"),
              _buildAssetOption(
                  "RETH 50% LTV", "https://placehold.co/50x50", "RETH logo"),
              _buildAssetOption(
                  "DAI 50% LTV", "https://placehold.co/50x50", "DAI logo"),
              _buildAssetOption(
                  "USDC 50% LTV", "https://placehold.co/50x50", "USDC logo"),
              _buildAssetOption(
                  "USDT 50% LTV", "https://placehold.co/50x50", "USDT logo"),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Learn more",
              style: TextStyle(color: Colors.blue[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridSection() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: <Widget>[
        _buildGridItem("Leverage your wealth",
            "Keep exposure to important assets while making them work for you. Leverage more of your wealth (without risk of liquidation) by borrowing a synthetic version of your collateral."),
        _buildGridItem("Wide range of tokens",
            "Alchemix is opening doors to new collateral types. Leverage more of your wealth than ever before."),
        _buildGridItem("No liquidations",
            "No matter what happens we'll never liquidate your deposit. You can choose to self-liquidate your own loan at your own discretion."),
        _buildGridItem("Completely flexible",
            "Alchemix doesn't lock your deposit or charge you fees. Your funds are accessible 100% of the time. You can also repay your debt whenever you like."),
      ],
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("&copy; 2020 - 2023 Alchemix Labs",
              style: TextStyle(color: Colors.grey[400], fontSize: 12)),
          Text("NAVIGATION",
              style: TextStyle(color: Colors.grey[400], fontSize: 12)),
          Text("SOCIAL",
              style: TextStyle(color: Colors.grey[400], fontSize: 12)),
          Text("PROUDLY USING",
              style: TextStyle(color: Colors.grey[400], fontSize: 12)),
          Text("CARBON FOOTPRINT",
              style: TextStyle(color: Colors.grey[400], fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPathOption(String title, String description) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(description, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildAssetOption(String label, String imageUrl, String altText) {
    return Column(
      children: [
        //Image.network(imageUrl, height: 50),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildGridItem(String title, String content) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(content, style: TextStyle(color: Colors.white)),
          TextButton(
            onPressed: () {},
            child: Text(
              "Learn more",
              style: TextStyle(color: Colors.blue[600]),
            ),
          ),
        ],
      ),
    );
  }
}
