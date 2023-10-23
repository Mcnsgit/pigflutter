import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  final Function onApplyFilters;

  const FilterDrawer({required this.onApplyFilters, super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  double age = 18.0;
  double height = 140.0;
  String bodyType = 'Any';
  String position = 'Any';
  String lookingFor = 'Any';
  String relationshipStatus = 'Any';
  String meetAt = 'Any';
  bool acceptsNSFW = false;
  bool onlineNow = false;
  bool photosOnly = false;

  Widget _buildDropdown(
    String title,
    String value,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return DropdownButton<String>(
      value: value,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(12.0),
        children: <Widget>[
          const SizedBox(height: 8),
          const Text(
            'User Filters',
            style: TextStyle(fontSize: 18, fontWeight: 
                FontWeight.bold),
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          const Text('Age'),
          const SizedBox(height: 8),
          Slider(
            value: age,
            min: 18.0,
            max: 100.0,
            divisions: 82,
            label: age.round().toString(),
            onChanged: (double newValue) {
              setState(() {
                age = newValue;
              });
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          const Text('Height'),
          const SizedBox(height: 8),
          Slider(
            value: height,
            min: 140.0,
            max: 220.0,
            onChanged: (double newValue) {
              setState(() {
                height = newValue;
              });
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          const Text('Body Type'),
          const SizedBox(height: 8),
          _buildDropdown(
            'Body Type',
            bodyType,
            ['Any', 'Average', 'Toned', 'Large', 'Muscular', 'Slim'],
            (value) {
              if (value != null) {
                setState(() => bodyType = value);
              }
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          const Text('Position'),
          const SizedBox(height: 8),
          _buildDropdown(
            'Position',
            position,
            ['Any', 'Top', 'Top Vers', 'Vers', 'Side', 'Vers Bottom', 'Bottom'],
            (value) {
              if (value != null) {
                setState(() => position = value);
              }
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          const Text('Looking for'),
          const SizedBox(height: 8),
          _buildDropdown(
            'Looking for',
            lookingFor,
            ['Any', 'Hookups', 'Friends', 'Casual', 'Dates', 'Relationship'],
            (value) {
              if (value != null) {
                setState(() => lookingFor = value);
              }
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          const Text('Relationship Status'),
          const SizedBox(height: 8),
          _buildDropdown(
            'relationshipStatus',
            relationshipStatus,
            [
              'Any',
              'Single',
              'In a relationship',
              'Engaged',
              'Open-Relationship',
              'Married',
              'Dating'
            ],
            (value) {
              if (value != null) {
                setState(() {
                  relationshipStatus = value;
                });
              }
            },
          ),
          const Divider(color: Color.fromARGB(179, 4, 33, 180)),
          const SizedBox(height: 8),
          const Text('Meet at'),
          const SizedBox(height: 8),
          _buildDropdown(
            'Meet at',
            meetAt,
            ['Any', 'Online', 'your Place', 'My Place', 'Bar', 'Outdoors'],
            (value) {
              if (value != null) {
                setState(() => meetAt = value);
              }
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          const Text('Accepts NSFW'),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Accepts NSFW"),
            value: acceptsNSFW,
            onChanged: (bool value) {
              setState(() {
                acceptsNSFW = value;
              });
            },
            activeColor: Colors.red,
            secondary: const Icon(
              Icons.lock,
              color: Colors.red,
            ),
            activeTrackColor: Colors.red.withOpacity(0.5),
            activeThumbImage: const NetworkImage(
              'https://img.icons8.com/ios-filled/50/000000/nsfw.png',
            ),
          ),
          const Divider(color: Color.fromARGB(214, 97, 95, 95)),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Photos Only"),
            value: photosOnly,
            onChanged: (bool value) {
              setState(() {
                acceptsNSFW = value;
              });
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Online Now"),
            value: onlineNow,
            onChanged: (bool value) {
              setState(() {
                onlineNow = value;
              });
            },
          ),
          const Divider(color: Colors.white70),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
