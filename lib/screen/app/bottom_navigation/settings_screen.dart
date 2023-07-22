import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qatar_ui_app/models/address.dart';
import 'package:qatar_ui_app/models/country.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notification = false;
  String? _gender;
  int? _selectedCountryId;
  late TextEditingController _experienceTextController;

  List<Address> _addresses = <Address>[
    Address(name: 'Khan Younes'),
    Address(name: 'Rafah'),
    Address(name: 'Gaza'),
    Address(name: 'alwustaa'),
    Address(name: 'Gaza'),
    Address(name: 'Beit Lahiya'),
    Address(name: 'northern Gaza'),
  ];

  final List<Country> _countries = <Country>[
    const Country(id: 1, name: 'Palestine'),
    const Country(id: 2, name: 'Eygpt'),
    const Country(id: 3, name: 'Algeria'),
    const Country(id: 4, name: 'suodia'),
    const Country(id: 5, name: 'jorden'),
  ];

  List<String> _experiences = <String>[];

  @override
  void initState() {
    super.initState();
    _experienceTextController = TextEditingController();
  }

  @override
  void dispose() {
    _experienceTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      children: [
        SwitchListTile(
          title: Text('Notifications'),
          subtitle: Text('Enable/Disable Norification'),
          value: _notification,
          onChanged: (bool value) {
            setState(() => _notification = value);
          },
        ),
        SizedBox(height: 10),
        Text(
          'Gender',
          style: GoogleFonts.nunito(
            fontSize: 23,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                  title: Text('Male'),
                  value: 'M',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() => _gender = value);
                    }
                  }),
            ),
            Expanded(
              child: RadioListTile(
                  title: Text('Female'),
                  value: 'F',
                  groupValue: _gender,
                  onChanged: (String? value) {
                    if (value != null) {
                      setState(() => _gender = value);
                    }
                  }),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Addres',
          style: GoogleFonts.nunito(
            fontSize: 23,
          ),
        ),
        for (Address address in _addresses)
          CheckboxListTile(
            title: Text(address.name),
            value: address.selected,
            onChanged: (bool? value) {
              if (value != null) {
                setState(() {
                  address.selected = value;
                });
              }
            },
          ),
        SizedBox(height: 10),
        Text(
          'Country',
          style: GoogleFonts.nunito(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<int>(
          isExpanded: true,
          onChanged: (int? value) {
            setState(() => _selectedCountryId = value);
          },
          value: _selectedCountryId,
          itemHeight: 48,
          hint: const Text('Selected country'),
          dropdownColor: Colors.lime.shade200,
          borderRadius: BorderRadius.circular(10),
          onTap: () => print('Tapped'),
          elevation: 4,
          // menuMaxHeight: 80,

          items: _countries.map((Country country) {
            return DropdownMenuItem<int>(
              value: country.id,
              child: Text(country.name),
              // enabled: false ,
              onTap: () {},
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Text(
          'Experiences',
          style: GoogleFonts.nunito(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: _experienceTextController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.send,
          style: GoogleFonts.nunito(),
          maxLength: 30,
          enabled: true,
          onSubmitted: (String value) => _performSave(),
          decoration: InputDecoration(
            hintText: 'Enter Experince',
            hintStyle: GoogleFonts.nunito(),
            counterText: '',
            suffixIcon: IconButton(
              onPressed: () => _performSave(),
              icon: Icon(Icons.add),
            ),
          ),
        ),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: _experiences.map((String experience) {
            return Chip(
              elevation: 3,
              avatar: Icon(
                Icons.category,
                size: 14,
                color: Colors.white,
              ),
              side: BorderSide(
                color: Color(0xFFF0EBE3),
              ),
              deleteIcon: Icon(Icons.close, size: 14),
              deleteIconColor: Color(0xFFE4DCCF),
              deleteButtonTooltipMessage: 'DELETE',
              onDeleted: () {
              _delete(experience: experience);
              },
              label: Text(
                experience,
                style: GoogleFonts.nunito(
                  color: Color(0xFFF0EBE3),
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Color(0xFF7D9D9C),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _performSave() {
    if (_checkDate()) {
      _save();
    }
  }

  bool _checkDate() {
    if (_experienceTextController.text.isNotEmpty) {
      return true;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Enter required data '),
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }

  void _save() {
    setState(() => _experiences.add(_experienceTextController.text));
    _experienceTextController.clear();
  }

   void _delete({required String experience}){
    setState(() => _experiences.remove(experience));

   }
}