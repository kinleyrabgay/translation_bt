import 'package:flutter/material.dart';
import 'package:translation_bt/core/enum/enum.dart';

class GenericFeatureBuilder extends StatefulWidget {
  const GenericFeatureBuilder({Key? key}) : super(key: key);

  @override
  State<GenericFeatureBuilder> createState() => _GenericFeatureBuilderState();
}

class _GenericFeatureBuilderState extends State<GenericFeatureBuilder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  final TextEditingController featureController = TextEditingController();

  FeatureLabel? selectedFeature;

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
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: Colors.grey[300]!,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownMenu<FeatureLabel>(
                      initialSelection: FeatureLabel.speech,
                      controller: featureController,
                      requestFocusOnTap: true,
                      label: const Text('Type'),
                      width: MediaQuery.of(context).size.width * 0.3,

                      onSelected: (FeatureLabel? type) {
                        setState(() {
                          selectedFeature = type;
                        });
                      },
                      textStyle: TextStyle(fontSize: 12),
                      // menuStyle: MenuStyle(
                      //   backgroundColor:
                      //       MaterialStatePropertyAll<Color>(Colors.green),
                      //       fixedSize: MaterialStateProperty<Size>(Size.o)
                      // ),
                      dropdownMenuEntries: FeatureLabel.values
                          .map<DropdownMenuEntry<FeatureLabel>>(
                              (FeatureLabel type) {
                        return DropdownMenuEntry<FeatureLabel>(
                          value: type,
                          label: type.label,
                          enabled: type.label != 'Grey',
                          // style: MenuItemButton.styleFrom(
                          //   foregroundColor: color.color,
                          // ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const Text(
                'Form Field',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
