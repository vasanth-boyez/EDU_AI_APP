import 'package:flutter/material.dart';
import 'dart:math';

/*void main() {
  runApp(GoProgrammingApp());
}*/

class JavaProgrammingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Java Programming language',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
      ),
      home: HomeScreen(),
    );
  }
}

class Question {
  String text;
  String correctAnswer;

  Question(this.text, this.correctAnswer);
}

class Interview {
  List<Question> questions;

  Interview(this.questions);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Interview interview;
  late List<String?> userAnswers;
  TextEditingController answerController = TextEditingController();

  int _currentQuestionIndex = 0;
  int _selectedIndex = 0;

  List<ChatMessage> chatMessages = [];

  @override
  void initState() {
    super.initState();
    // Randomly select 10 questions for the interview
    List<Question> allQuestions = [
      Question('Which Set class should be most popular in a multi-threading environment, considering performance constraint?', 'ConcurrentSkipListSet'),
      Question('Which Map class should be most popular in a multi-threading environment, considering performance constraint??', 'CopyOnWriteMap'),
      Question('Which of those doesn’t have an index based structure?', 'Set'),
      Question('java.util.Collections is a:?', 'Class'),
      Question('Methods such as reverse, shuffle are offered in', 'Collections'),
      Question('Which of those allows duplicate elements?', 'List'),
      Question('Which allows the storage of a null key and null values?', 'HashMap'),
      Question('What guarantees type-safety in a collection?', 'Generics'),
      Question('HashSet internally uses?', 'Set'),
      Question('The most used interfaces from the collection framework are?', 'Map'),
      Question('The root interface of Java collection framework hierarchy is –','List/Set'),
      Question('nextIndex() and previousIndex() are methods of which interface??', 'Iterator'),
      Question('Vector extends?', 'AbstractList'),
      Question('LinkedList implements?', 'List/Deque'),
      // Add more questions as needed.
    ];

    interview = Interview(List.generate(
      min(10, allQuestions.length),
          (index) {
        int randomIndex = Random().nextInt(allQuestions.length);
        return allQuestions.removeAt(randomIndex);
      },
    ));

    userAnswers = List.filled(interview.questions.length, null);
  }

  void nextQuestion() {
    if (_currentQuestionIndex < interview.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        answerController.text = '';
      });
    } else {
      // All questions answered, show performance.
      showPerformance();
    }
  }

  void showPerformance() {
    int correctAnswers = 0;
    for (int i = 0; i < interview.questions.length; i++) {
      if (userAnswers[i]?.toLowerCase() == interview.questions[i].correctAnswer.toLowerCase()) {
        correctAnswers++;
      }
    }

    double percentage = (correctAnswers / interview.questions.length) * 100;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Interview Completed'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('You answered $correctAnswers out of ${interview.questions.length} questions correctly.'),
              SizedBox(height: 10),
              Text('Your performance: ${percentage.toStringAsFixed(2)}%'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  answerController.text = '';
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Java Programming Interview'),
      ),
      body: _selectedIndex == 0
          ? interviewScreen()
          : chatBotScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Interview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget interviewScreen() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Theme.of(context).primaryColor, Theme.of(context).colorScheme.secondary!],
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  interview.questions[_currentQuestionIndex].text,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: answerController,
                  onChanged: (answer) {
                    setState(() {
                      userAnswers[_currentQuestionIndex] = answer;
                    });
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Your answer...',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: nextQuestion,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.transparent,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget chatBotScreen() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Theme.of(context).colorScheme.secondary!, Theme.of(context).primaryColor],
            ),
          ),
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Chatbot: Ask questions here...',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: chatMessages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(chatMessages[index].text),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onSubmitted: (query) {
                    _askChatbot(query);
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Ask me anything...',
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _askChatbot(String query) {
    String response = getChatbotResponse(query);
    setState(() {
      chatMessages.add(ChatMessage(text: 'You: $query'));
      chatMessages.add(ChatMessage(text: 'Chatbot: $response'));
    });
  }

  String getChatbotResponse(String query) {
    // Add your chatbot logic here, for now, let's provide some random responses.
    List<String> responses = [
      'I am doing well, thank you!',
      'Sorry, I am just a simple chatbot and may not understand complex queries.',
      'The weather is fine today.',
      'I love chatting with you!',
      'I am constantly learning and evolving.',
    ];
    return responses[Random().nextInt(responses.length)];
  }
}

class ChatMessage {
  final String text;

  ChatMessage({required this.text});
}