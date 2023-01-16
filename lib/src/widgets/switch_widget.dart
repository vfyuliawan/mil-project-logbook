part of 'widgets.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  List<bool> _values = [false, true, true, false];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: "Wifi".text.make(),
            ),
            Switch(
              value: _values[0],
              activeColor: Colors.blue,
              onChanged: (bool value) {
                setState(() {
                  _values[0] = value;
                });
              },
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: "Bluethoot".text.make(),
            ),
            Switch(
              value: false,
              activeColor: Colors.blue,
              onChanged: (value) {},
            )
          ],
        ),
      ],
    );
  }
}
