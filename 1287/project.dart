import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRole? _selectedRole;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _adminUsername = "admin";
  final String _adminPassword = "admin123";
  final String _studentUsername = "student";
  final String _studentPassword = "student123";

  bool _validateCredentials(UserRole role) {
    if (role == UserRole.admin) {
      return _usernameController.text == _adminUsername &&
          _passwordController.text == _adminPassword;
    } else if (role == UserRole.student) {
      return _usernameController.text == _studentUsername &&
          _passwordController.text == _studentPassword;
    }
    return false;
  }

  void _navigateToSubjectScreen(UserRole role) {
    if (_validateCredentials(role)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SubjectScreen(role: role)),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Incorrect username or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedRole = UserRole.student;
                      });
                      _navigateToSubjectScreen(UserRole.student);
                    },
                    child: Text('Login as Student'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedRole = UserRole.admin;
                      });
                      _navigateToSubjectScreen(UserRole.admin);
                    },
                    child: Text('Login as Admin'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Colors.purpleAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectScreen extends StatelessWidget {
  final UserRole role;

  SubjectScreen({required this.role});

  final Map<String, List<Map<String, Object>>> _subjectQuizzes = {
    'Computer Networks': [
      {'question': "What is an OS?", 'options': ["System Software", "Application", "Hardware", "Device"], 'answer': "System Software"},
      {'question': "Which of the following is NOT a type of network topology?", 'options': ["Star","Ring","Bus","Packet"], 'answer': "Packet"},
      {'question': "What is the port number of PoP?", 'options': ["35","43","110","25"], 'answer': "110"},
      {'question': "The full form of OSI is?", 'options': ["Operating System Interface","Optical System Interconnection","Operating System Internet","Open System Interconnection"], 'answer': "Open System Interconnection"},
      {'question': "What is a HUB?", 'options': ["Software","Connecting Device","Network Device","Calculating Device"], 'answer': "Network Device"},
    ],
    'Business Economics Financial Analysis': [
      {'question': "What is BEFA?", 'options': ["Business Economics", "Basic Economics", "Business Analysis", "Finance"], 'answer': "Business Economics"},
      {'question': "Which of the following is a liquidity ratio?", 'options': ["Debt-to-equity ratio", "Current ratio", "Return on assets", "Gross margin"], 'answer': "Current ratio"},
      {'question': "The term GDP in economics stands for:", 'options': ["Gross Domestic Product", "General Domestic Pricing", "Gross Discount Pricing", "General Development Program"], 'answer': "Gross Domestic Product"},
      {'question': "Which of the following is considered a fixed cost?", 'options': ["Raw material costs", "Sales commission", "Rent", "Direct labor"], 'answer': "Rent"},
      {'question': "The process of spreading the cost of a tangible asset over its useful life is called:", 'options': ["Amortization", "Depletion", "Depreciation", "Capitalization"], 'answer': "Depreciation"},
    ],
    'Introduction to Data Science': [
      {'question': "What is an IDS?", 'options': ["Intrusion Detection System", "Information Detection Service", "Intelligent Data System", "Interactive Design Service"], 'answer': "Intrusion Detection System"},
      {'question': "Which of the following is NOT typically used in data science?", 'options': ["Python", "SQL", "HTML", "R"], 'answer': "HTML"},
      {'question': "In data science, what is a dataset?", 'options': ["A collection of related files", "A single file with data", "A structured collection of data organized for analysis", "A programming language for handling data"], 'answer': "A structured collection of data organized for analysis"},
      {'question': "Which step in the data science process involves cleaning and transforming raw data into a format suitable for analysis?", 'options': ["Data Collection", "Data Cleaning", "Data Visualization", "Model Evaluation"], 'answer': "Data Cleaning"},
      {'question': "What is the purpose of exploratory data analysis (EDA)?", 'options': ["To test machine learning models", "To make predictions on new data", "To understand the main characteristics of the data", "To clean and preprocess data"], 'answer': "To understand the main characteristics of the data"},
    ],
    'UI/UX and Flutter': [
      {'question': "What does UI stand for in UI/UX design?",
        'options': ["User Input", "User Interface", "User Integration", "User Insight"],
        'answer': "User Interface"},

      {'question': "What is the primary focus of UX design?",
        'options': ["Creating aesthetic visuals", "Developing a backend system", "Enhancing user satisfaction through usability and accessibility", "Debugging the UI"],
        'answer': "Enhancing user satisfaction through usability and accessibility"},

      {'question': "Which of these widgets is used in Flutter to create a responsive layout?",
        'options': ["Row", "Column", "Flexible", "Scaffold"],
        'answer': "Flexible"},

      {'question': "What is a Widget in Flutter?",
        'options': ["A building block of the user interface", "A backend tool for processing data", "A database management system", "A debugging tool"],
        'answer': "A building block of the user interface"},

      {'question': "Which of these is NOT a principle of UI design?",
        'options': ["Consistency", "Feedback", "Alignment", "Randomization"],
        'answer': "Randomization"},

      {'question': "What is the purpose of a Scaffold widget in Flutter?",
        'options': ["To provide a container for input fields", "To manage the app's backend services", "To implement the basic visual layout structure of an app", "To handle complex mathematical calculations"],
        'answer': "To implement the basic visual layout structure of an app"},

      {'question': "Which tool in Flutter allows developers to see real-time updates in their app during development?",
        'options': ["Hot Reload", "Cold Restart", "Live Server", "Widget Inspector"],
        'answer': "Hot Reload"},

      {'question': "What is Material Design in the context of Flutter?",
        'options': ["A design language developed by Microsoft", "A backend framework for web development", "A UI design system developed by Google", "An open-source data analytics tool"],
        'answer': "A UI design system developed by Google"},

      {'question': "Which Flutter widget is used for scrolling content?",
        'options': ["Container", "ListView", "GridView", "TextField"],
        'answer': "ListView"},

      {'question': "What does the term 'stateful widget' mean in Flutter?",
        'options': ["A widget that does not change", "A widget with mutable state that can be updated during its lifecycle", "A widget specifically for animations", "A widget only for layout"],
        'answer': "A widget with mutable state that can be updated during its lifecycle"},
    ],


    'Machine Learning': [
      {'question': "What does ML stand for?", 'options': ["Machine Learning", "Molecular Learning", "Massive Learning", "Manual Learning"], 'answer': "Machine Learning"},
      {'question': "Which algorithm is commonly used in supervised learning?", 'options': ["Linear Regression", "K-means", "PCA", "KNN"], 'answer': "Linear Regression"},
      {'question': "What is the purpose of overfitting in machine learning?", 'options': ["To generalize better", "To reduce error", "To create a model that works well on training data", "To increase model complexity"], 'answer': "To create a model that works well on training data"},
      {'question': "Which library is commonly used for machine learning in Python?", 'options': ["Pandas", "Matplotlib", "TensorFlow", "BeautifulSoup"], 'answer': "TensorFlow"},
      {'question': "What does supervised learning require?", 'options': ["Unlabeled data", "Labeled data", "Random data", "Unstructured data"], 'answer': "Labeled data"},
    ],
    'Design Analysis Algorithm': [
      {'question': "What is DAA?", 'options': ["Design and Analysis of Algorithms", "Data Analysis Application", "Digital Analysis Algorithm", "Distributed Application Architecture"], 'answer': "Design and Analysis of Algorithms"},
      {'question': "What is the primary goal of algorithm analysis?", 'options': ["To determine the best possible solution", "To optimize memory usage", "To evaluate the efficiency of algorithms", "To make algorithms easier to write"], 'answer': "To evaluate the efficiency of algorithms"},
      {'question': "Which of the following is a divide and conquer algorithm?", 'options': ["Quick Sort", "Insertion Sort", "Bubble Sort", "Selection Sort"], 'answer': "Quick Sort"},
      {'question': "Which notation is used to describe the time complexity of an algorithm?", 'options': ["Big O", "Lambda", "Pi", "Sigma"], 'answer': "Big O"},
      {'question': "What is the primary disadvantage of the brute-force approach?", 'options': ["It is too simple", "It requires too much memory", "It is computationally expensive", "It guarantees the best solution"], 'answer': "It is computationally expensive"},
    ],
  };

  static List<Map<String, String>> leaderboard = [];

  void _startQuiz(BuildContext context, String subject) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(
          subject: subject,
          questions: _subjectQuizzes[subject]!,
        ),
      ),
    );
  }

  void _viewLeaderboard(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Leaderboard'),
        content: leaderboard.isEmpty
            ? Text('NO STUDENT HAS ATTEMPTED THE QUIZ')
            : SingleChildScrollView(
          child: Column(
            children: leaderboard
                .map((entry) => ListTile(
              title: Text(entry['name']!),
              trailing: Text('Score: ${entry['score']}'),
            ))
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Subject')),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          for (var subject in _subjectQuizzes.keys)
            ListTile(
              title: Text(subject),
              onTap: () => _startQuiz(context, subject),
            ),
          if (role == UserRole.admin) ...[
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _viewLeaderboard(context),
              child: Text('View Leaderboard'),
            ),
          ],
        ],
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final String subject;
  final List<Map<String, Object>> questions;

  QuizPage({required this.subject, required this.questions});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _showScore = false;
  final TextEditingController _nameController = TextEditingController();

  void _handleAnswer(String selectedOption) {
    if (selectedOption == widget.questions[_currentQuestionIndex]['answer']) {
      setState(() {
        _score++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct Answer! 🎉')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect Answer! 😞')),
      );
    }
    _nextQuestion();
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex + 1 < widget.questions.length) {
        _currentQuestionIndex++;
      } else {
        _showScore = true;
      }
    });
  }

  void _submitQuiz() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        SubjectScreen.leaderboard.add({
          'name': _nameController.text,
          'score': _score.toString(),
        });
      });
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.subject} Quiz')),
      body: _showScore
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $_score / ${widget.questions.length}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter Your Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitQuiz,
              child: Text('Submit Quiz'),
            ),
          ],
        ),
      )
          : Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${widget.questions.length}',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 12),
            Text(
              widget.questions[_currentQuestionIndex]['question']
                  .toString(),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            ...((widget.questions[_currentQuestionIndex]['options']
            as List<String>)
                .map(
                  (option) => ElevatedButton(
                onPressed: () => _handleAnswer(option),
                child: Text(option),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

enum UserRole { admin, student }
