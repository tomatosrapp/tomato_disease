import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Detection extends StatefulWidget {
  @override
  _DetectionState createState() => _DetectionState();
}

class _DetectionState extends State<Detection> {
  File? _image;
  String _diseaseName = '';
  String _percentageProbability = '';
  double? area_planted;
  double? area_harvested;
  double? production_kg;
  double? _survivalRate;
  bool _isLoading = false;

  Future getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        // Check if the selected file has a valid extension (JPEG, JPG, PNG)
        final isValidImage = ['.jpg', '.jpeg', '.png']
            .any((ext) => pickedImage.path.toLowerCase().endsWith(ext));
        if (isValidImage) {
          _image = File(pickedImage.path);
          _diseaseName = '';
          _percentageProbability = '';
        } else {
          // Show an alert if the selected file is not a valid image format
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Invalid Image Format'),
                content: Text(
                    'Please upload an image in JPEG, JPG, or PNG format only.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> predictImage(File image) async {
    setState(() {
      _isLoading = true; // Set loading state to true
      _diseaseName = '';
      _percentageProbability = '';
    });

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://tomatosrapp.pythonanywhere.com/detect'),
    );
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      var prediction = jsonDecode(jsonResponse);
      setState(() {
        _diseaseName = prediction[0]['name'];
        _percentageProbability =
            prediction[0]['percentage_probability'].toStringAsFixed(2);
      });
      print('Prediction: $_diseaseName');
      print('Probability: $_percentageProbability');
    } else {
      print('Error: ${response.reasonPhrase}');
    }

    setState(() {
      _isLoading = false; // Set loading state to false after prediction
    });
  }

  Future<void> predictSurvivalRate() async {
    var url = Uri.parse('http://tomatosrapp.pythonanywhere.com/survival_rate');
    var params = {
      'area_planted': area_planted.toString(),
      'area_harvested': area_harvested.toString(),
      'production_kg': production_kg.toString(),
    };

    url = Uri.parse(url.toString() + '?' + Uri(queryParameters: params).query);

    var response = await http.get(url, headers: {});

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        _survivalRate = jsonResponse['survival_rate'];
      });
      print('Survival Rate: $_survivalRate');
    } else {
      print('Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tomatect',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF6BD99E),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select an image for tomato plant disease detection:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150.0,
                    height: 35.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF6BD99E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: getImage,
                      child: Text('Upload Image'),
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 35.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF6BD99E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {
                        if (_image != null) {
                          predictImage(_image!);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('No image found'),
                                content: Text('Please upload an image.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: _isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              ),
                            )
                          : Text('Predict'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              _image != null ? Image.file(_image!) : Text('No image selected.'),
              SizedBox(height: 20.0),
              _diseaseName.isNotEmpty && _percentageProbability.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: $_diseaseName',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Percentage Probability: $_percentageProbability%',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(height: 20.0),
              Visibility(
                visible: _image != null,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kindly fill out all the input fields below to see the survival rate of the tomato plant',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText:
                                    'Enter the value of area planted (sqm)',
                                border: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 5),
                                ),
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    area_planted = double.tryParse(value);
                                  });
                                }
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText:
                                    'Enter the value of area harvested (sqm)',
                                border: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 5),
                                ),
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    area_harvested = double.tryParse(value);
                                  });
                                }
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Enter the value of production (kg)',
                                border: OutlineInputBorder(),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 5),
                                ),
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    production_kg = double.tryParse(value);
                                  });
                                }
                              },
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).nextFocus();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Center(
                        child: Container(
                          width: 200.0,
                          height: 35.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF6BD99E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onPressed: () {
                              if (area_planted == null ||
                                  area_harvested == null ||
                                  production_kg == null) {
                                Alert(
                                  context: context,
                                  title: 'All fields are required!',
                                  buttons: [],
                                  style: AlertStyle(
                                    backgroundColor: Colors.white,
                                  ),
                                ).show();
                              } else {
                                predictSurvivalRate();
                              }
                            },
                            child: Text('Survival Rate Prediction'),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      _survivalRate != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Survival Rate: $_survivalRate',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
