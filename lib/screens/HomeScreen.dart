import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utill/color_resources.dart';
import '../utill/images.dart';
import '../widget/custom_button.dart';
import 'CategoriesScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor: ColorResources.PRIMARYCOLORDARK,

        body:


        Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 40),
                child: Align(alignment: Alignment.bottomLeft,
                    child: Image.asset(Images.Cash,width: 110,height: 110,)),
              ),
              const SizedBox(height: 5),


              const Align(alignment: Alignment.bottomLeft,

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: Text(
                    'CRED mint',
                    style: TextStyle(
                    fontStyle: FontStyle.normal,
                      fontSize: 20.0,
                      color: ColorResources.TEXTCOLORLIGTH,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),
              ),
               Align(alignment: Alignment.bottomLeft,
                child: Padding(
                padding:   const EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                  child: Text(
                                      "grow your saving.\n3x faster",
                                      style: GoogleFonts.lora(
                                        fontSize: 20,
                                         color: ColorResources.TEXTCOLORLIGTH,
                                         fontWeight: FontWeight.w500),),)),
               const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical:25),
                child: CustomButton(
                  width: 360,
                  height: 60,
                  borderRadius: 4,
                  padding: const EdgeInsets.all(8.0),
                  fontSize: 16,
                  textColor: ColorResources.TEXTCOLORDARK,
                  color: ColorResources.PRIMARYCOLORLIGHT,
                  text: 'Go to category',
                  icon: Icons.arrow_right_alt_sharp,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>  CategoriesScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.linearToEaseOut;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );

                  },
                ),
              )

            ]


        )




    );
  }
}
