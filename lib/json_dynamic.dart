import 'dart:convert';

import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class DynamicWidgets extends StatefulWidget {
  const DynamicWidgets({super.key});

  @override
  State<DynamicWidgets> createState() => _DynamicWidgetsState();
}

class _DynamicWidgetsState extends State<DynamicWidgets> {
  Map dataWidgets = {
    "type": "scaffold",
    "args" : {
      "body": {
        "type": "center",
        "args": {
          "child": {
            "type": "text",
            "args": {
              "text": "Testing",
              "style": {
                "color": "#0000FF"
              }
            }
          }
        }
      }
    }
    
  };

  var registry = JsonWidgetRegistry.instance;

  Future<Map> readDataJson() async {
    final String autoAnimateJson =
        await rootBundle.loadString('assets/json/auto_animate.json');
    var json = jsonDecode(autoAnimateJson);
    return json;
  }

  @override
  Widget build(BuildContext context) {
    readDataJson().then((value) => dataWidgets = value);
    var widget = JsonWidgetData.fromDynamic(dataWidgets, registry: registry);
    return widget.build(context: context);
  }
}