import 'package:flutter/material.dart';
import './story_brain.dart';
import './buildMaterialColor.dart';

void main() => runApp(const AdventureGame());

class AdventureGame extends StatelessWidget {
  const AdventureGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: buildMaterialColor(Color.fromARGB(255, 58, 40, 129)),
        ).copyWith(
          secondary: buildMaterialColor(Color.fromARGB(255, 104, 87, 159)),
        ),
        fontFamily: 'Ubuntu',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(
                fontSize: 18,
                fontFamily: 'Ubuntu',
                color: Colors.white,
              ),
              titleLarge: const TextStyle(
                fontSize: 25,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.bold,
              ),
            ),
      ), // we are using the dark theme

      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  // object of StoryBrain
  var storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // image background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/123.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    // Choice 1 made by user
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Theme.of(context).colorScheme.primary),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => const BeveledRectangleBorder()),
                  ),
                  child: Text(
                    storyBrain.getChoice1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      // Choice 2 made by user
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Theme.of(context).colorScheme.secondary),
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                      shape: MaterialStateProperty.resolveWith(
                          (states) => const BeveledRectangleBorder()),
                    ),
                    child: Text(
                      storyBrain.getChoice2,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
