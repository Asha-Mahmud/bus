import 'package:flutter/material.dart';
import 'ticket_buying_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int passengerCount = 1; // Define passengerCount here
  // Set the default value to 'AC' or any other initial value
  String selectedFromLocation = 'Dhaka';
  String selectedToLocation = 'Uttara';
  String selectedType = 'AC';
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _ticketBuyingPage() {
    // Navigate to the registration page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TicketBuyingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      // Handle menu button press
                    },
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                ],
              ),
            ),
            Container(
              width: 600,
              margin: EdgeInsets.only(left: 20),

              child: const Text(
                "Hey, Asha!",
                style: TextStyle(
                  fontSize: 26,
                  // fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 600,
              margin: EdgeInsets.only(left: 20),
              child: const Text(
                "Bus",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),

            // Container with two rows and two columns
            Container(
              width: 600,
              height: 200,
              // color: Colors.blue,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        // Row 1, Column 1
                        Container(
                          // padding: EdgeInsets.all(8.0),
                          // color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                // width: 10,
                                // height: 20,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                              const Text(
                                'From:',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.green),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: const Text('From Location'),
                                  value: selectedFromLocation,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedFromLocation = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Dhaka',
                                    'Uttara',
                                    'Rangpur',
                                    
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 119, 194, 255),
                                          // backgroundColor: Colors.blue
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        // Row 2, Column 1

                        Expanded(
                          child: Column(
                            children: [
                              // Row 1, Column 2
                              Container(
                                // padding: EdgeInsets.all(8.0),
                                // color: Colors.red,
                                child: const Text(
                                  'To :',
                                  style: TextStyle(color: Color.fromARGB(255, 209, 73, 73)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        // Row 2, Column 2
                        Container(
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.green),
                              const SizedBox(width: 10),
                              Expanded(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: const Text('To Location'),
                                  value: selectedToLocation,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedToLocation = newValue!;
                                    });
                                  },
                                  items: <String>[
                                    'Dhaka',
                                    'Uttara',
                                    'Rangpur',
                                    
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

// Additional Container 1
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Passenger :',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle decrease button press
                                        setState(() {
                                          if (passengerCount > 1) {
                                            passengerCount--;
                                          }
                                        });
                                      },
                                      child: const Text(
                                        '-',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '$passengerCount',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Handle increase button press
                                        setState(() {
                                          passengerCount++;
                                        });
                                      },
                                      child: const Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            const Text(
                              'Type :',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            DropdownButton<String>(
                              value: selectedType,
                              onChanged: (String? newValue) {
                                // Handle type selection
                                setState(() {
                                  selectedType = newValue!;
                                });
                              },
                              items: <String>['AC', 'Non-AC']
                                  .map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),

// Additional Container 2
            // ...

// Additional Container 2
            // Container(
            //   width: 600,
            //   height: 100,
            //   color: Colors.orange,
            //   child: Center(
            //     child: Text(
            //       'Additional Container 2',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       ),
            //     ),
            //   ),
            // ),

            const SizedBox(height: 20),

// Date Input
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
                  const Text(
                    'Depart :',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      _selectDate(context); // Call function to show date picker
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        selectedDate != null
                            ? "${selectedDate!.toLocal()}".split(' ')[0]
                            : 'Select Date',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

// Search Button
            ElevatedButton(
              onPressed: _ticketBuyingPage,
              child: const Text('search'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
