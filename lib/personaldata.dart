import 'package:flutter/material.dart';

class PersonalDataPage extends StatefulWidget {
  @override
  _PersonalDataPageState createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  String _selectedGender = 'Male'; // Default gender
  DateTime _selectedDate = DateTime.now(); // Default date
  String? _selectedIncome; // Income selection
  final List<String> incomeOptions = [
    '\$500 - \$1,000 / year',
    '\$1,000 - \$2,000 / year',
    '\$2,000 - \$3,000 / year',
    '\$3,000 - \$4,000 / year',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Data"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      8), // Rounded corners for the profile image
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/image2.jpg'), // Profile image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Your Name"),
            TextField(
              decoration: InputDecoration(
                hintText: 'William John Malik',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text("Date of Birth"),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '${_selectedDate.toLocal()}'.split(' ')[0],
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Your Job"),
            TextField(
              decoration: InputDecoration(
                hintText: 'Successor Designer',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text("Monthly Income"),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: _selectedIncome ?? 'Select Income',
                border: OutlineInputBorder(),
                suffixIcon: DropdownButton<String>(
                  icon: Icon(Icons.arrow_drop_down),
                  underline: SizedBox(),
                  items: incomeOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedIncome = newValue;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Gender"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Box for Male
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        Text('Male'),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Box for Female
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'Female',
                          groupValue: _selectedGender,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedGender = value!;
                            });
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Set background color to white
    );
  }
}
