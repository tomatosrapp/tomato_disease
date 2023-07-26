import 'package:flutter/material.dart';

class TomatoDisease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/tomato_disease.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tomato Disease',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tomatoes are vulnerable to a variety of diseases, including bacterial spot, early blight, late blight, leaf mold, septoria leaf spot, spider mites, target spot, mosaic virus, and yellow leaf curl virus. These diseases can cause defoliation, reduced fruit quality, and stunted growth, and they can be spread through contaminated tools, water, insects, and infected plants. Fortunately, many of these diseases can be managed through cultural practices such as crop rotation, pruning, and the use of disease-resistant varieties and fungicides or insecticides. It is important for tomato growers to stay vigilant and take proactive measures to maintain the health of their plants.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Diseases:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '»️ Bacterial spot: This is a bacterial disease that affects the leaves, stems, and fruits of tomato plants. It is characterized by small, dark spots on the leaves, which eventually grow and merge to form large, irregularly shaped lesions. The disease is spread through water, insects, and contaminated tools, and it can be managed through cultural practices, including crop rotation, pruning, and the use of disease-resistant varieties. \n\n'
                    '»️ Early blight: This is a fungal disease that affects the lower leaves of tomato plants. It is characterized by brown spots that appear on the leaves, which eventually grow and form concentric rings. The disease can cause defoliation and reduce fruit quality, but it can be managed through cultural practices, including crop rotation, pruning, and the use of fungicides.\n\n'
                    '»️ Healthy: This refers to tomato plants that are free of disease and in good health. Healthy tomato plants are characterized by vibrant green leaves, strong stems, and vigorous growth.\n\n'
                    '»️ Late blight: This is a fungal disease that affects the leaves, stems, and fruits of tomato plants. It is characterized by brown spots on the leaves, which eventually turn black and papery. The disease can cause defoliation and reduce fruit quality, and it is spread through wind-borne spores. It can be managed through cultural practices, including crop rotation, pruning, and the use of fungicides.\n\n'
                    '»️ Leaf mold: This is a fungal disease that affects the leaves of tomato plants. It is characterized by yellowing of the leaves, followed by the development of white, powdery patches on the undersides of the leaves. The disease is spread through water, and it can be managed through cultural practices, including the use of disease-resistant varieties and the use of fungicides.\n\n'
                    '»️ Septoria leaf spot: This is a fungal disease that affects the leaves of tomato plants. It is characterized by small, circular spots with gray centers and dark borders. The disease can cause defoliation and reduce fruit quality, and it is spread through water and contaminated tools. It can be managed through cultural practices, including crop rotation, pruning, and the use of fungicides.\n\n'
                    '»️ Spider mites: These are tiny, sap-sucking pests that can infest tomato plants. They are characterized by the presence of fine webbing on the leaves and stems, and they can cause stunted growth and reduced fruit quality. They can be managed through cultural practices, including the use of predatory mites and the use of insecticidal soaps and oils.\n\n'
                    '»️ Target spot: This is a fungal disease that affects the leaves and fruits of tomato plants. It is characterized by circular lesions with a yellow halo and a black center. The disease can cause defoliation and reduce fruit quality, and it is spread through water and contaminated tools. It can be managed through cultural practices, including crop rotation, pruning, and the use of fungicides.\n\n'
                    '»️ Mosaic virus: This is a viral disease that affects the leaves and fruits of tomato plants. It is characterized by a mottled or streaked appearance on the leaves, which can lead to stunted growth and reduced fruit quality. The disease is spread through contaminated tools and infected plants, and it can be managed through cultural practices, including the use of disease-resistant varieties.\n\n'
                    '»️ Yellow leaf curl virus: This is a viral disease that affects the leaves and fruits of tomato plants. It is characterized by yellowing and curling of the leaves, which can lead to stunted growth and reduced fruit quality. The disease is spread through whiteflies, and it can be managed through cultural practices, including the use of disease-resistant varieties and the use of insecticides.\n\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
