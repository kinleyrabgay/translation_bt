import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translation_bt/core/constants/features.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home-view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: 'Dzongkha NLP'.text.make()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 500,
            childAspectRatio: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
          ),
          itemBuilder: (context, index) {
            Feature feature = features[index];
            return FadeTransition(
              opacity: _opacityAnimation,
              child: SlideTransition(
                position: _offsetAnimation,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return modelInfo(context, feature);
                      },
                    );
                  },
                  child: featureCard(context, feature),
                ),
              ),
            );
          },
          itemCount: features.length, // Total number of features
        ),
      ),
    );
  }

  Container modelInfo(BuildContext context, Feature feature) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 1.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    CupertinoIcons.delete,
                  ),
                )
              ],
            ),
            Text('Source: ${feature.src}'),
            Text('Destination: ${feature.dest}'),
            Text('Description: ${feature.desc}'),
            Image.asset(
              feature.imgUrl,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Container featureCard(BuildContext context, Feature feature) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.grey[300]!,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text('Source: ${feature.src}'),
            Text('Destination: ${feature.dest}'),
            Text('Description: ${feature.desc}'),
            Text('ImgUrl: ${feature.imgUrl}'),
            Image.asset(
              feature.imgUrl,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
