import 'package:companion_app/screens/home/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:companion_app/screens/quiz/main_quiz.dart';
import 'package:webview_flutter/webview_flutter.dart' show JavascriptMode, WebView;
import 'package:companion_app/models/udata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showMainQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MainQuiz()), // Navigate to MainQuizPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 11, right: 7, top: 7, left: 7),
              height: 200,
              //color: Colors.teal,
              child: Card(
                elevation: 4.0,
                color: Colors.white60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Welcome!",
                              style: TextStyle(
                                fontFamily: 'FontMainHeavy',
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'We are glad to see you back!\nWe recommend taking a short test to assess your current mental state.',
                              style: TextStyle(
                                fontFamily: 'FontMain',
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            OutlinedButton(
                              child: Text('Take Test', style: TextStyle(fontFamily: 'FontMain'),),
                              onPressed: () {
                                _showMainQuizPage();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 180.0,
                        width: 180,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://www.iconshock.com/image/3D/Character/designer-artist-draftsman-creator-architect'),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 15),
                const Text(
                  "🌱  Recommended Activities",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                      fontFamily: 'FontMainHeavy',
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 11),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: 'https://www.youtube.com/watch?v=ZToicYcHIOU'),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 11, top: 7),
                      width: 180.0,
                      // Change the width as needed
                      height: 180.0,
                      // This makes the container square
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/meditation-woman-emoji.png'),
                                  // Replace with your image URL
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Meditation',
                                    style: TextStyle(
                                      fontFamily: 'FontMainHeavy',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Center(
                                    child: Text(
                                      'Mindfulness is a blessing.',
                                      style: TextStyle(
                                        fontFamily: 'FontMain',
                                        fontSize: 13.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //const SizedBox(width: 10.0),
                  SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: 'https://www.youtube.com/watch?v=lvgM39UgHbA'),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 11, top: 7),
                      width: 180.0,
                      // Change the width as needed
                      height: 180.0,
                      // This makes the container square
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/interact-emoji.png'),
                                  // Replace with your image URL
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Interaction',
                                    style: TextStyle(
                                      fontFamily: 'FontMainHeavy',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),

                                    Center(
                                      child: Text(
                                        'Interact with loved ones.',
                                        style: TextStyle(
                                          fontFamily: 'FontMain',
                                          fontSize: 13.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: 'https://open.spotify.com/playlist/37i9dQZF1DWU0ScTcjJBdj'),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 11, top: 7),
                      width: 180.0,
                      // Change the width as needed
                      height: 180.0,
                      // This makes the container square
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/music-emoji.png'),
                                  // Replace with your image URL
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Music',
                                    style: TextStyle(
                                      fontFamily: 'FontMainHeavy',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Center(
                                    child: Text(
                                      'Music uplifts your mood.',
                                      style: TextStyle(
                                        fontFamily: 'FontMain',
                                        fontSize: 13.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: 'https://www.youtube.com/watch?v=anWff1mZ2tY'),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 11, top: 7),
                      width: 180.0,
                      // Change the width as needed
                      height: 180.0,
                      // This makes the container square
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 17),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/walk-emoji.png'),
                                  // Replace with your image URL
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Walking',
                                    style: TextStyle(
                                      fontFamily: 'FontMainHeavy',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Center(
                                    child: Text(
                                      'A walk helps you relax.',
                                      style: TextStyle(
                                        fontFamily: 'FontMain',
                                        fontSize: 13.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 14),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(url: 'https://www.youtube.com/watch?v=MjMkBaqimFo'),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 11, top: 7),
                      width: 180.0,
                      // Change the width as needed
                      height: 180.0,
                      // This makes the container square
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/exercise-emoji.png'),
                                  // Replace with your image URL
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Exercise',
                                    style: TextStyle(
                                      fontFamily: 'FontMainHeavy',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Center(
                                    child: Text(
                                      'Go join a local gym.',
                                      style: TextStyle(
                                        fontFamily: 'FontMain',
                                        fontSize: 13.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 11),
                ],
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 15),
                const Text(
                  "⚡  Trending Articles",
                  style: TextStyle(
                    fontFamily: 'FontMainHeavy',
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox (height: 11),
            Center(
              child: Container(
                height: 260.0, // Set the height as needed
                width: 390.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: 'https://www.theguardian.com/society/2020/mar/17/dogs-have-a-magic-effect-the-power-of-pets-on-our-mental-health'),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150.0, // Set the image height as needed
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/dog-in-park.jpg'),
                            // Replace with your image URL
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '‘Dogs have a magic effect’: how pets can improve our mental health',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Canine companions trigger similar neural pathways to the parent-baby bond, and reduce loneliness and depression.',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox (height: 11),
            Center(
              child: Container(
                height: 260.0, // Set the height as needed
                width: 390.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: 'https://www.nature.com/articles/d41586-021-02690-5'),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150.0, // Set the image height as needed
                        decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/young-people-mental.webp'),
                            // Replace with your image URL
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Young people’s mental health is finally getting the attention it needs',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'The COVID-19 pandemic and a UNICEF report all highlight the need for prevention and treatment of youth anxiety.',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox (height: 11),
            Center(
              child: Container(
                height: 260.0, // Set the height as needed
                width: 390.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: 'https://www.medicalnewstoday.com/articles/321510'),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150.0, // Set the image height as needed
                        decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/panic-disorder-article.jpg'),
                            // Replace with your image URL
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'How to stop a panic attack: 13 effective methods',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Panic attacks can be sudden and overpowering. Knowing what to do when they arise can reduce the severity of panic attacks and help people calm their symptoms.',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox (height: 11),
            Center(
              child: Container(
                height: 260.0, // Set the height as needed
                width: 390.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Changes the position of the shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewScreen(url: 'https://www.mindbodygreen.com/articles/social-media-and-relationships'),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 150.0, // Set the image height as needed
                        decoration: const BoxDecoration(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10.0)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/relation-image-article.webp'),
                            // Replace with your image URL
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '12 Ways Social Media Affects Relationships, From Research & Experts',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Can looking at these seemingly perfect couples online interfere with our own romantic relationships? Here, how social media can affect your relationships and more.',
                            style: TextStyle(
                              fontFamily: 'FontMain',
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox (height: 11),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
