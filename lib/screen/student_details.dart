import 'package:batch_32b/model/student.dart';
import 'package:flutter/material.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final _gap = const SizedBox(height: 10);

  final _fnameController = TextEditingController(text: 'Kiran');
  final _lnameController = TextEditingController(text: 'kiran123');
  final TextEditingController _cityController = TextEditingController();

  List<DropdownMenuItem> cities = [
    const DropdownMenuItem(
      value: 'Kathmandu', // timile select garda
      child: Text('Kathmandu'), // user lai dekhaune
    ),
    const DropdownMenuItem(value: 'Bhaktapur', child: Text('Bhaktapur')),
    const DropdownMenuItem(value: 'Lalitpur', child: Text('Lalitpur')),
  ];

  final _key = GlobalKey<FormState>();

  List<Student> students = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _fnameController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter fname';
                  }
                  return null;
                },
              ),
              _gap,
              TextFormField(
                controller: _lnameController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter lname';
                  }
                  return null;
                },
              ),
              _gap,
              DropdownButtonFormField(
                items: cities,
                onChanged: (value) {
                  _cityController.text = value.toString();
                },
                decoration: const InputDecoration(
                  hintText: 'Select city',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select city';
                  }
                  return null;
                },
              ),
              _gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      final student = Student(
                        fname: _fnameController.text,
                        lname: _lnameController.text,
                        city: _cityController.text,
                      );
                      setState(() {
                        students.add(student);
                      });
                    }
                  },
                  child: const Text('Add Student'),
                ),
              ),
              _gap,
              const Text(
                'Student List',
                style: TextStyle(fontSize: 20),
              ),
              students.isEmpty
                  ? const Text('No data')
                  : Expanded(
                      child: ListView.builder(
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(students[index].fname),
                            subtitle: Text(students[index].city),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  students.removeAt(index);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
