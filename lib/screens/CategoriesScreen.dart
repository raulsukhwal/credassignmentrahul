import 'package:flutter/cupertino.dart';
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
        icon: Image.asset(Images.Mint,width: 110,height: 110),
        heading: 'mint',
        subheading: 'grow your savings. 3x faster.',
      ),
      CategoryDetails(
        icon:Image.asset(Images.Bank_Accounts,width: 110,height: 110,),
        heading: 'bank accounts',
        subheading: 'check your bank balance',
      ),
      CategoryDetails(
        icon:Image.asset(Images.Scan_Pay,width: 110,height: 110,),
        heading: 'Scan & Pay',
        subheading: 'ability to scan & pay on UPI QRs ',
      ),

    ]),


    Category(heading: 'BENEFITS', subCategories: [
      CategoryDetails(
        icon: Image.asset(Images.Rewards,width: 110,height: 110,),
        heading: 'rewards',
        subheading: 'redeem coins for cashbacks, discounts and more',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Refer_Earn,width: 110,height: 110,),
        heading: 'refer & earn',
        subheading: 'assured cashback for bringing friends to CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Coins,width: 110,height: 110,),
        heading: 'coins',
        subheading: 'use coins to claim rewards and other perks',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Vouchers,width: 110,height: 110,),
        heading: 'vouchers',
        subheading: 'exclusive rewards when you redeem your vouchers on CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Brand_Offer,width: 110,height: 110,),
        heading: 'brand offers',
        subheading: 'Enjoy rewards with every brand offer on CRED',
      ),
    ]),


    Category(heading: 'BILLS', subCategories: [
      CategoryDetails(
        icon: Image.asset(Images.Utility_bill,width: 110,height: 110,),
        heading: 'utility & all bills',
        subheading: 'Earn rewards for paying utility and all bills through CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Credit_Cards_Bills,width: 110,height: 110,),
        heading: 'credit cards bills',
        subheading: 'Get exclusive cashback for paying your credit card bills with CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.House_Rent,width: 110,height: 110,),
        heading: 'house rent',
        subheading: 'assured cashback and earn rewards for paying your house rent through CRED',
      ),
      CategoryDetails(
        icon: Image.asset(Images.Education_Fees_Test,width: 110,height: 110,),
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
          icon: Icon(Icons.arrow_back_ios_sharp, color: ColorResources.TEXTOFFWHITE),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Stack(
        children: [
          Positioned(
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
                        SizedBox(width: 2),
                        Icon(
                          Icons.grid_view_sharp,
                          size: 20,
                          color: _isGridView
                              ? ColorResources.OFFWHITENEW
                              : Colors.transparent,
                        ),
                        SizedBox(width: 4),
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
                InkWell(onTap: (){
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
      key: ValueKey('grid'),
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorResources.TEXTOFFWHITE,
                  ),
                ),
              ),
              const SizedBox(height: 21),
              _buildSubCategoryRows(subCategories), // Build rows of subcategories
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubCategoryRows(List<CategoryDetails> subCategories) {
    List<Widget> rows = [];

    for (int i = 0; i < subCategories.length; i += 4) {
      List<Widget> rowChildren = [];

      // Add up to 3 subcategories per row
      for (int j = i; j < i + 4 && j < subCategories.length; j++) {
        final subCategory = subCategories[j];
        rowChildren.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
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
                      textAlign: TextAlign.center, // Center text under icon
                      softWrap: true, // Allow text to wrap to the next line
                      overflow: TextOverflow.visible, // Show all text, allow wrapping
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      }

      // Add each row to the main Column
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: rowChildren,
      )
      );
    }

    return Column(children: rows); // Stack the rows vertically
  }

  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
     // physics: NeverScrollableScrollPhysics(),
      key: ValueKey('list'),
      itemCount: categoryDetails.length,
      itemBuilder: (context, index) {
        final category = categoryDetails[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                category.heading,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: ColorResources.TEXTOFFWHITE,
                ),
              ),
            ),
SizedBox(height: 33,),
            ...category.subCategories.map((subCategory) {
              return GestureDetector(
                onTap: () => _onCategoryTap(category),
                child: Card(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Flexible(

                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                          child: SizedBox(width: 70,height: 70,
                              child: subCategory.icon),
                        ), // Centered icon

                      ),

                      SizedBox(width: 28),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subCategory.heading,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ColorResources.TEXTCOLORLIGTH,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              subCategory.subheading,
                              style: TextStyle(
                                fontSize: 13,
                                color: ColorResources.TEXTOFFWHITE,
                              ),
                            ),
                            SizedBox(height: 23,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 16),
          ],
        );
      },
    );
  }


}


class AnimatedGiftButton extends StatefulWidget {
  @override
  _AnimatedGiftButtonState createState() => _AnimatedGiftButtonState();
}

class _AnimatedGiftButtonState extends State<AnimatedGiftButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _showGiftAnimation() {
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showGiftAnimation,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // The button icon
            const Center(
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.cyan,
                size: 40, // Adjust size as needed
              ),
            ),
            // The gift animation
            FadeTransition(
              opacity: _opacityAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.green,
                        size: 60,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Thank You!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDetails {
  final Image icon;
  final String heading;
  final String subheading;

  CategoryDetails({
    required this.icon,
    required this.heading,
    required this.subheading,
  });
}

class Category {
  final String heading;
  final List<CategoryDetails> subCategories;

  Category({
    required this.heading,
    required this.subCategories,
  });
}

