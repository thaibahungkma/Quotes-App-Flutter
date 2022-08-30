import 'package:count/value/app_assets.dart';
import 'package:count/value/app_colors.dart';
import 'package:count/value/app_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        title: Text(
          'English today',
          style: AppStyles.h4.copyWith(color: Colors.black, fontSize: 36),
        ),
        elevation: 0,
        backgroundColor: AppColors.secondColor,
        leading: InkWell(
          onTap: () {},
          child: Image.asset(AppAssets.menu),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: size.height * 1 / 10,
              padding: EdgeInsets.all(25),
              alignment: Alignment.centerLeft,
              child: Text(
                '"It is amazing how to complete is the delusion that beauty is goodness"',
                style: AppStyles.h6.copyWith(fontSize: 13, color: Colors.black),
              ),
            ),
            Container(
                padding: EdgeInsets.all(5),
                height: size.height * 2 / 3,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(3,6),
                            blurRadius: 6,
                          )
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(AppAssets.heart),
                              alignment: Alignment.centerRight,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: RichText(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: 'B',
                                    style: AppStyles.h2.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 89,
                                        shadows: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(2, 4),
                                              blurRadius: 6)
                                        ]),
                                    children: [
                                      TextSpan(
                                          text: 'eautiful',
                                          style: AppStyles.h2.copyWith(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 60))
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 40, left: 10),
                              child: Container(
                                child: Text(
                                  '"Think of all the beautiful still left around you and be happy"',
                                  style: AppStyles.h4.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              margin: EdgeInsets.only(top: 140),
                              child: Text(
                                '-Anne Frank',
                                style:
                                    AppStyles.h4.copyWith(color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
            Container(
              height: 8,
              margin: EdgeInsets.only(left: 15,top:10),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return buildIndicator(index == _currentIndex, size);
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          print('exchange');
        },
        child: Image.asset(AppAssets.exchange),
        focusColor: AppColors.primaryColor,
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return Container(
      height: 15,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: isActive ? size.width * 1 / 4 : 24,
      decoration: BoxDecoration(
          color: isActive ? AppColors.lighBlue : AppColors.blackGrey,
          borderRadius: BorderRadius.all(Radius.circular(3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2, 3),
              blurRadius: 3,
            )
          ]),
    );
  }
}
