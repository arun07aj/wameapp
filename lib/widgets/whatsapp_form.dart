import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/CountryData.dart';
import '../models/country.dart';

class WhatsAppForm extends StatefulWidget {
  const WhatsAppForm({super.key});

  @override
  _WhatsAppFormState createState() => _WhatsAppFormState();
}

class _WhatsAppFormState extends State<WhatsAppForm> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _errorMessage = '';
  Country? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = CountryData.countries[0]; // Set the default country
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String phoneNumber = _phoneNumberController.text.trim();
    RegExp numericRegex = RegExp(r'^[0-9]+$');

    if (phoneNumber.isNotEmpty) {
      if (numericRegex.hasMatch(phoneNumber)) {
        if (phoneNumber.length == 10) {
          _launchWhatsApp(_selectedCountry!.code + phoneNumber);
        } else {
          setState(() {
            _errorMessage = 'Phone number must contain ten digits';
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Phone number must contain only numeric characters';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Phone number cannot be empty';
      });
    }
  }


  Future<void> _launchWhatsApp(String phoneNumber) async {
    Uri url = Uri.parse('https://wa.me/${Uri.encodeFull(phoneNumber)}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      setState(() {
        _errorMessage = 'Could not launch $url';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Chat Creator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  DropdownButton<Country>(
                    value: _selectedCountry,
                    onChanged: (Country? newValue) {
                      setState(() {
                        _selectedCountry = newValue;
                      });
                    },
                    items: CountryData.countries.map<DropdownMenuItem<Country>>((Country country) {
                      return DropdownMenuItem<Country>(
                        value: country,
                        child: Row(
                          children: [
                            Text(country.flag),
                            const SizedBox(width: 1),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Enter Phone Number',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text(
                  'Open WhatsApp Chat',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
