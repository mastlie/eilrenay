import 'package:flutter/material.dart';
import '../config/app_theme.dart';

/*
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A Flutter Demo',
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
*/
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _isAgree = false;
  bool _isNotificationOn = true;
  String? _selectedGender;
  String? _selectedFruit;

  final List<String> _fruits = ['Apple', 'Banana', 'Orange'];
  void _navigateBottombar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          title: Text('ERP'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.brightness_3)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(AppTheme.spacing),
          child: ListView(
            children: [
              Card(
                child: Container(
                  padding: EdgeInsets.all(AppTheme.spacing),
                  child: Text('Hello'),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(AppTheme.spacing),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Text Button"),
                            ),
                          ),
                          SizedBox(width: AppTheme.spacing),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Elevated Button"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppTheme.spacing),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.account_balance_wallet_sharp),
                                  SizedBox(width: AppTheme.spacing),
                                  Text("Wallet"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: AppTheme.spacing),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showAboutDialog(
                                  context: context,
                                  applicationName: "ERP",
                                  applicationVersion: "0.0.1",
                                );
                              },
                              child: Text("Dialog About"),
                            ),
                          ),
                          SizedBox(width: AppTheme.spacing),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(DateTime.now().year + 1),
                                  initialEntryMode:
                                      DatePickerEntryMode.calendarOnly,
                                  builder: (context, child) {
                                    return child!;
                                  },
                                );
                              },
                              child: Text("Date Picker"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(style: AppTheme.textFieldStyle),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              style: AppTheme.textFieldStyle,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'Enter your name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppTheme.spacing),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style: AppTheme.textFieldStyle,
                              enabled: false,
                              initialValue: 'Disabled',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              style: AppTheme.textFieldStyle,
                              decoration: InputDecoration(
                                labelText: 'Name',
                                hintText: 'Enter your name',
                              ),
                              initialValue: 'ReadOnly',
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Container(
                      //width: 200,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text("Widget 1"),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text("Widget 2"),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.green),
                      child: Text("Widget 3"),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.orange),
                      child: Text("Widget 4"),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.purple),
                      child: Text("Widget 5"),
                    ),
                    Container(
                      width: 200,
                      height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.yellow),
                      child: Text("Widget 6"),
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: 'Item 1',
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Item 1',
                                  child: Text('Item 1'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Item 2',
                                  child: Text('Item 2'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Item 3',
                                  child: Text('Item 3'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Item 4',
                                  child: Text('Item 4'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Item 5',
                                  child: Text('Item 5'),
                                ),
                              ],
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Disabled',
                                  child: Text('Disabled'),
                                ),
                              ],
                              value: 'Disabled',
                              onChanged: null,
                              style: AppTheme.textFieldStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(AppTheme.spacing),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (bool? value) {
                                      setState(() {});
                                    },
                                  ),
                                  Text('Yes'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(AppTheme.spacing),
                              child: Row(
                                children: [
                                  Checkbox(value: false, onChanged: null),
                                  Text('Disabled'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CheckboxListTile(
                            title: Text('Apple'),
                            value: true,
                            onChanged: (value) {
                              //setState(() => _isApple = value ?? false);
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Banana'),
                            value: false,
                            onChanged: (value) {
                              //setState(() => _isBanana = value ?? false);
                            },
                          ),
                          CheckboxListTile(
                            title: Text('Orange'),
                            value: true,
                            enabled: false,
                            onChanged: (value) {
                              //setState(() => _isOrange = value ?? false);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: Text('Credit Card'),
                        subtitle: Text('Pay with credit card'),
                        value: 'credit',
                        //groupValue: _selectedPayment,
                        onChanged: (String? value) {
                          setState(() {
                            //_selectedPayment = value;
                          });
                        },
                        secondary: Icon(Icons.credit_card),
                      ),
                      RadioListTile<String>(
                        title: Text('Bank Transfer'),
                        subtitle: Text('Pay via bank transfer'),
                        value: 'bank',
                        //groupValue: _selectedPayment,
                        onChanged: (String? value) {
                          setState(() {
                            //_selectedPayment = value;
                          });
                        },
                        secondary: Icon(Icons.account_balance),
                      ),
                      RadioListTile<String>(
                        title: Text('E-Wallet'),
                        subtitle: Text('Pay with GoPay, OVO, etc'),
                        value: 'ewallet',
                        //groupValue: _selectedPayment,
                        onChanged: (String? value) {
                          setState(() {
                            //_selectedPayment = value;
                          });
                        },
                        secondary: Icon(Icons.wallet),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Form Example',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Checkbox
                      CheckboxListTile(
                        title: Text('I agree to terms'),
                        value: _isAgree,
                        onChanged: (value) {
                          setState(() => _isAgree = value ?? false);
                        },
                      ),

                      // Switch
                      SwitchListTile(
                        title: Text('Notifications'),
                        subtitle: Text('Receive notifications'),
                        value: _isNotificationOn,
                        onChanged: (value) {
                          setState(() => _isNotificationOn = value);
                        },
                      ),

                      // Radio (Gender)
                      Text(
                        'Gender',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      RadioListTile<String>(
                        title: Text('Male'),
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() => _selectedGender = value);
                        },
                      ),
                      RadioListTile<String>(
                        title: Text('Female'),
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() => _selectedGender = value);
                        },
                      ),

                      // Dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedFruit,
                        decoration: InputDecoration(
                          labelText: 'Favorite Fruit',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        items: _fruits.map((fruit) {
                          return DropdownMenuItem<String>(
                            value: fruit,
                            child: Text(fruit),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() => _selectedFruit = value);
                        },
                      ),

                      SizedBox(height: AppTheme.spacing),

                      // Display result
                      if (_isAgree ||
                          _isNotificationOn ||
                          _selectedGender != null ||
                          _selectedFruit != null)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selected Values:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (_isAgree) Text('✓ Agreed to terms'),
                              if (_isNotificationOn)
                                Text('✓ Notifications enabled'),
                              if (_selectedGender != null)
                                Text('✓ Gender: $_selectedGender'),
                              if (_selectedFruit != null)
                                Text('✓ Fruit: $_selectedFruit'),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottombar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
