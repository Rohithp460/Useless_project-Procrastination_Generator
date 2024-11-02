import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF2E073F),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFF7A1CAC),
          tertiary: Color(0xFFAD49E1),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _tasks = [
    "Read a random Wikipedia article",
    "Organize your desktop icons",
    "Watch a funny cat video",
    "Write a haiku about procrastination",
    "Rearrange your bookshelf alphabetically",
    "Count the number of pencils you own",
    "Learn to say 'Hello' in three new languages",
    "Invent a new dance move",
    "Organize your closet by color",
    "Google a fun fact about sloths",
    "Read for 15 minutes",
    "Take a short walk",
    "Write in a journal",
    "Organize your workspace",
    "Drink a glass of water",
    "Meditate for 5 minutes",
    "Do a quick workout",
    "Plan your next day",
    "Learn a new word",
    "Draw something",
    "Listen to your favorite song",
    "Do some stretches",
    "Write down three things you're grateful for",
    "Review your goals",
    "Declutter your desktop",
    "Catch up on the news",
    "Do a breathing exercise",
    "Organize your emails",
    "Set a timer and work for 10 minutes",
    "Clean up your room",
    "Count the number of ceiling tiles in your room.",
    "Learn how to juggle with three oranges.",
    "Google the longest word in the English language and try to pronounce it.",
    "Draw a detailed map of your dream island.",
    "Make up a random song and sing it to yourself.",
    "Imagine what your life would be like if you were a pirate.",
    "Try to lick your elbow (it's impossible, but worth trying!).",
    "Find out how many steps it takes to walk across your room.",
    "Think about what you’d do if you were invisible for a day.",
    "Write a short story about a talking toaster.",
    "Count how many blue things are in your room.",
    "Plan a trip to Mars. What will you pack?",
    "Calculate the time it would take to read all the books in your bookshelf.",
    "List all the countries you know in alphabetical order.",
    "Create an elaborate hand signal for 'I need more coffee.'",
    "Imagine you’re an astronaut lost in space. What do you do next?",
    "Invent a new color and try to describe it.",
    "Find an object nearby and create a backstory for it.",
    "Try to remember the names of all the teachers you’ve had.",
    "Plan a heist to 'borrow' your neighbor’s Wi-Fi.",
    "Pretend you're giving a TED talk on procrastination.",
    "If you could have any superpower, which would you choose and why?",
    "Plan a fancy dinner party for all the characters in your favorite book.",
  ];

  final List<String> lightRewards = [
    "5-Minute Stretch Break",
    "Enjoy a Small Snack",
    "Listen to Your Favorite Song",
    "Quick Chat with a Friend",
    "Take a Short Walk",
    "Watch a Motivational Video",
    "Play a Quick Online Game",
    "Meditate for 5 Minutes",
    "Do a Mini-Doodle",
    "Reward Yourself with a Treat",
    "Compliment Yourself in the Mirror",
    "Give Yourself a Virtual High-Five",
    "Listen to a Favorite Song",
    "Take a Short Walk",
    "Meditate for 3 Minutes",
    "Have a Quick Chat with a Friend",
    "Watch a Funny Video",
    "Look at Cute Animal Photos",
    "Spend 5 Minutes on a Hobby",
    "Do a Little Dance",
    "Read a Few Pages of a Book",
    "Brew Your Favorite Drink",
    "Plan Your Next Meal",
    "Have a Moment of Silence",
    "Light a Candle and Relax",
    "Do a Quick Stretch",
    "Step Outside for Fresh Air",
    "Reward Yourself with a Break"
  ];

  int _taskCounter = 0;
  final Random random = Random();

  void _generateTask(BuildContext context) {
    final task = _tasks[random.nextInt(_tasks.length)];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskScreen(
          task: task,
          rewards: lightRewards,
          onComplete: _incrementTaskCounter,
          onGenerateNewTask: _generateNewTask,
        ),
      ),
    );
  }

  void _incrementTaskCounter() {
    setState(() {
      _taskCounter++;
    });
  }

  void _generateNewTask(BuildContext context) {
    final task = _tasks[random.nextInt(_tasks.length)];
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TaskScreen(
          task: task,
          rewards: lightRewards,
          onComplete: _incrementTaskCounter,
          onGenerateNewTask: _generateNewTask,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows the body to extend under the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Remove shadow
        actions: [
          IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF2E073F)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E073F), Color(0xFF7A1CAC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Feeling Productive? Get Distracted!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEBD3F8),
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 10,
                    backgroundColor: Color(0xFFAD49E1),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  onPressed: () => _generateTask(context),
                  child: Text(
                    'Generate a Random Task',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Tasks Completed: $_taskCounter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'John Doe';
  String email = 'john.doe@example.com';
  String bio = 'Enthusiastic procrastinator and task generator enthusiast.';

  List<String> achievements = [
    "Completed 10 Tasks!",
    "Procrastination Pro",
    "Master of Distractions",
    "Achievement Unlocked: First Task!",
  ];

  List<String> badges = [
    "Novice Procrastinator",
    "Intermediate Delayer",
    "Master of Procrastination",
    "Ultimate Distractor",
  ];

  void _navigateToEditProfile() async {
    final updatedProfile = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          name: name,
          email: email,
          bio: bio,
        ),
      ),
    );

    if (updatedProfile != null) {
      setState(() {
        name = updatedProfile['name'];
        email = updatedProfile['email'];
        bio = updatedProfile['bio'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Color(0xFFEBD3F8))),
        backgroundColor: Color(0xFF2E073F),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _navigateToEditProfile,
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF2E073F),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, size: 50, color: Color(0xFF7A1CAC)),
                      ),
                      SizedBox(height: 16),
                      Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                      SizedBox(height: 8),
                      Text(email, style: TextStyle(fontSize: 16, color: Colors.white70)),
                      SizedBox(height: 16),
                      Text(bio, style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                      SizedBox(height: 30),
                      Text("Achievements", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFEBD3F8))),
                      SizedBox(height: 10),
                      Container(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: achievements.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Chip(
                                label: Text(achievements[index], style: TextStyle(color: Colors.white)),
                                backgroundColor: Color(0xFF7A1CAC),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Text("Badges", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFFEBD3F8))),
                      SizedBox(height: 10),
                      Container(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: badges.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Chip(
                                label: Text(badges[index], style: TextStyle(color: Colors.white)),
                                backgroundColor: Color(0xFFAD49E1),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 50,height: 500,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskScreen extends StatelessWidget {
  final String task;
  final List<String> rewards;
  final VoidCallback onComplete;
  final Function(BuildContext) onGenerateNewTask;

  TaskScreen({
    required this.task,
    required this.rewards,
    required this.onComplete,
    required this.onGenerateNewTask,
  });

  void _showRewardDialog(BuildContext context) {
    final randomReward = rewards[Random().nextInt(rewards.length)];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF2E073F),
          title: Text(
            'Congratulations!',
            style: TextStyle(color: Color(0xFFEBD3F8)),
          ),
          content: Text(
            'Reward: $randomReward',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Close TaskScreen
              },
              child: Text(
                'OK',
                style: TextStyle(color: Color(0xFF7A1CAC)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E073F),
        title: Text(
          'Your Task',
          style: TextStyle(color: Color(0xFFEBD3F8)),
        ),
      ),
      body: Container(
        color: Color(0xFF2E073F),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  task,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    onComplete();
                    _showRewardDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7A1CAC),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Complete Task',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => onGenerateNewTask(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7A1CAC),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Generate Another Task',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  final String bio;

  EditProfileScreen({required this.name, required this.email, required this.bio});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _bioController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
    _bioController = TextEditingController(text: widget.bio);
  }

  void _saveProfile() {
    Navigator.pop(context, {
      'name': _nameController.text,
      'email': _emailController.text,
      'bio': _bioController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF2E073F),
      ),
      body: Container(
        color: Color(0xFF2E073F),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name', labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: _bioController,
              decoration: InputDecoration(labelText: 'Bio', labelStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF7A1CAC),
              ),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
