import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:endsars/model/Data.dart';
import 'package:endsars/styles/AppColor.dart';
import 'package:endsars/styles/AppFontSizes.dart';
import 'package:endsars/styles/AppTextStyle.dart';

class CategoryWidgets extends StatefulWidget {
  final AnimationController mainScreenAnimationController;
  final Animation mainScreenAnimation;

  const CategoryWidgets(
      {Key key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  @override
  _CategoryWidgetsState createState() => _CategoryWidgetsState();
}

class _CategoryWidgetsState extends State<CategoryWidgets>
    with TickerProviderStateMixin {
  AnimationController animationController;

  
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: getCategoryList().length,
                padding:
                    const EdgeInsets.only(top: 0, bottom: 0, right: 3, left: 3),
                itemBuilder: (context, index) {
                  var count = getCategoryList().length;
                  var animation = Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                          parent: animationController,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn)));
                  animationController.forward();
                  return CategoryView(
                    id: index,
                    name: getCategoryList()[index].name,
                    icon: getCategoryList()[index].icon,
                    animation: animation,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class CategoryView extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;
  final bool changeColor;
  final String iconLink, name, url, image;
  final int id;
  final Color color, iconColor;
  final IconData icon;
  final bool isImage;

  const CategoryView({
    Key key,
    this.animationController,
    this.iconLink,
    this.name,
    this.image,
    this.url,
    this.color,
    this.iconColor,
    this.icon,
    this.id,
    this.isImage,
    this.animation,
    this.changeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: GestureDetector(
              child: Padding(
  padding: const EdgeInsets.all(8.0),
  child:  Column(
    children: [
       ClayContainer(
  
                        height: 80,
                            width: 80,
  
                          borderRadius: 20,
  
                          color: Color(0xFFEBDDFF),
  
                         // depth: value.toInt(),
  
                          curveType: CurveType.convex,
  
                           child: Center(
                            child: Icon(icon, size: 40,)
                          ),
                        ),
                        SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
                    Text(name ,
                        style: AppTextStyle.header1(
      color: AppColor.black,context: context,
      fontWeight: FontWeight.bold,
      size: AppFontSizes.large
    ))
    ],
  )
),
              onTap: () {
              //whenIndexClicked(context);
              },
            ),
          ),
        );
      },
    );
  }

 

}
