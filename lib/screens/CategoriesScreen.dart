import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utill/color_resources.dart';
import '../utill/images.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool _isGridView = true;

  List<Category> categoryDetails = [
    Category(heading: 'MONEY', subCategories: [
      CategoryDetails(
        icon: Image.asset(Images.Mint, width: 110, height: 110),
        heading: 'mint',
        subheading: 'grow your savings. 3x faster.',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Bank_Accounts, width: 110, height: 110),
        heading: 'bank accounts',
        subheading: 'check your bank balance',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Scan_Pay, width: 110, height: 110),
        heading: 'Scan & Pay',
        subheading: 'ability to scan & pay on UPI QRs',
      ),
    ]),
    Category(heading: 'BENEFITS', subCategories: [
      CategoryDetails(
        icon: Image.asset(Images.Rewards, width: 110, height: 110),
        heading: 'rewards',
        subheading: 'redeem coins for cashbacks, discounts and more',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Refer_Earn, width: 110, height: 110),
        heading: 'refer & earn',
        subheading: 'assured cashback for bringing friends to CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Coins, width: 110, height: 110),
        heading: 'coins',
        subheading: 'use coins to claim rewards and other perks',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Vouchers, width: 110, height: 110),
        heading: 'vouchers',
        subheading: 'exclusive rewards when you redeem your vouchers on CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Brand_Offer, width: 110, height: 110),
        heading: 'brand offers',
        subheading: 'Enjoy rewards with every brand offer on CRED',
      ),
    ]),
    Category(heading: 'BILLS', subCategories: [
      CategoryDetails(
        icon: Image.asset(Images.Utility_bill, width: 110, height: 110),
        heading: 'utility & all bills',
        subheading: 'Earn rewards for paying utility and all bills through CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Credit_Cards_Bills, width: 110, height: 110),
        heading: 'credit cards bills',
        subheading: 'Get exclusive cashback for paying your credit card bills with CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.House_Rent, width: 110, height: 110),
        heading: 'house rent',
        subheading: 'assured cashback and earn rewards for paying your house rent through CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Education_Fees_Test, width: 110, height: 110),
        heading: 'education fees test',
        subheading: 'education fee without any additional charges',
      ),
    ]),
  ];

  void _toggleView() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  void _onCategoryTap(Category category) {
    Navigator.pop(context, category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.PRIMARYCOLORDARK,
      appBar: AppBar(
        backgroundColor: ColorResources.PRIMARYCOLORDARK,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp, color: ColorResources.TEXTOFFWHITE),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
            left: 25,
            child: Text(
              "explore",
              style: TextStyle(
                fontSize: 21,
                color: ColorResources.TEXTOFFWHITE,
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 25,
            right: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CRED',
                  style: GoogleFonts.openSans(
                    fontSize: 27,
                    color: ColorResources.TEXTCOLORLIGTH,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 95),
                GestureDetector(
                  onTap: _toggleView,
                  child: Container(
                    width: 52,
                    height: 26,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: ColorResources.OFFWHITENEW,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 2),
                        Icon(
                          Icons.grid_view_sharp,
                          size: 20,
                          color: _isGridView
                              ? ColorResources.OFFWHITENEW
                              : Colors.transparent,
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.view_list,
                          size: 20,
                          color: !_isGridView
                              ? ColorResources.TEXTCOLORLIGTH
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                  },
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: ColorResources.TEXTOFFWHITE,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: ColorResources.OFFWHITENEW,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            top: 130,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: _isGridView ? _buildGridView() : _buildListView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return ListView.builder(
      shrinkWrap: true,
      key: const ValueKey('grid'),
      itemCount: categoryDetails.length,
      itemBuilder: (context, index) {
        final category = categoryDetails[index];
        final List<CategoryDetails> subCategories = category.subCategories;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  category.heading,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorResources.TEXTOFFWHITE,
                  ),
                ),
              ),
              const SizedBox(height: 21),
              _buildSubCategoryRows(subCategories, category),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubCategoryRows(List<CategoryDetails> subCategories, Category category) {
    List<Widget> rows = [];

    for (int i = 0; i < subCategories.length; i += 4) {
      List<Widget> rowChildren = [];

      for (int j = i; j < i + 4 && j < subCategories.length; j++) {
        final subCategory = subCategories[j];
        rowChildren.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: GestureDetector(
              onTap: () => _onCategoryTap(category),
              child: Card(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 72,
                      height: 60,
                      child: subCategory.icon,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 60, // Adjust this width as needed
                      child: Text(
                        subCategory.heading,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ColorResources.OFFWHITENEW,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }

      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: rowChildren,
      ));
    }

    return Column(children: rows);
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      key: const ValueKey('list'),
      itemCount: categoryDetails.length,
      itemBuilder: (context, index) {
        final category = categoryDetails[index];
        final List<CategoryDetails> subCategories = category.subCategories;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  category.heading,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorResources.TEXTOFFWHITE,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ...subCategories.map((subCategory) => ListTile(
                onTap: () => _onCategoryTap(category),
                contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                leading: SizedBox(
                  width: 70,
                  height: 60,
                  child: subCategory.icon,
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    subCategory.heading,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorResources.TEXTCOLORLIGTH,
                    ),
                  ),
                ),

                subtitle: Text(
                  subCategory.subheading,
                  style: const TextStyle(
                    fontSize: 13,
                    color: ColorResources.TEXTOFFWHITE,
                  ),
                ),
              )),
           const SizedBox(height: 30,) ],
          ),
        );
      },
    );
  }
}

class Category {
  final String heading;
  final List<CategoryDetails> subCategories;

  Category({
    required this.heading,
    required this.subCategories,
  });
}

class CategoryDetails {
  final Widget icon;
  final String heading;
  final String subheading;

  CategoryDetails({
    required this.icon,
    required this.heading,
    required this.subheading,
  });
}
