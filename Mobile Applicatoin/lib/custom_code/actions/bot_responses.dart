// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

Future<String> botResponses(String userMessage) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Structured intents JSON
  final String jsonIntents = '''
{
  "intents": [
    {
      "tag": "greeting",
      "patterns": [
        "hi", "hello", "hey", "good morning", "good afternoon", "good evening", 
        "what's up?", "howdy", "hi there", "how are you", "is anyone there?", 
        "hola", "good day", "namaste", "yo", "whats up", "wazzup", "sup", 
        "how you doing", "how are you doing"
      ],
      "responses": [
        "Hello! How can I assist you today?", 
        "Hi there! What can I help you with?", 
        "Hey! How can I support you?", 
        "Greetings! What information do you need?"
      ]
    },
    {
      "tag": "goodbye",
      "patterns": [
        "bye", "see you later", "goodbye", "take care", "until next time", 
        "get lost", "till next time", "bbye", "cya", "see you", "bye bye", 
        "i am leaving", "have a good day", "talk to you later", "gtg"
      ],
      "responses": [
        "Goodbye! Have a great day.", 
        "Take care! Feel free to ask anytime.", 
        "See you soon! Let me know if you need more help.", 
        "Talk to you later"
      ]
    },
    {
      "tag": "thanks",
      "patterns": [
        "thanks", "thank you", "i appreciate it", "you're the best", 
        "that's helpful", "awesome, thanks", "thanks for helping me"
      ],
      "responses": [
        "You're welcome! Happy to assist!", 
        "My pleasure! Let me know if you need anything else.", 
        "Anytime! Glad I could help.", 
        "Happy to help!"
      ]
    },
    {
      "tag": "haha",
      "patterns": [
        "haha", "lol", "rofl", "lmao", "thats funny"
      ],
      "responses": [
        "Glad I could make you laugh!"
      ]
    },
    {
      "tag": "identity",
      "patterns": [
        "who are you", "what are you", "what are you made of"
      ],
      "responses": [
        "I am an Assistance Chatbot not AI"
      ]
    },
    {
      "tag": "creator",
      "patterns": [
        "who created you", "who made you", "your developers", "who designed you"
      ],
      "responses": [
        "I was made by Teckaa Resources Ltd."
      ]
    },
    {
      "tag": "ai",
      "patterns": [
        "what is ai?", "do you know ai?", "can you explain ai?"
      ],
      "responses": [
        "Artificial intelligence (AI) refers to the simulation of human intelligence.",
        "AI is machines that are programmed to think like humans and mimic their actions."
      ]
    },
    {
      "tag": "date_time",
      "patterns": [
        "what time is it?", "what is the date?", "tell me the date", 
        "what day is it?", "what time do you have?"
      ],
      "responses": [
        "The current date and time is...", 
        "Right now, it's..."
      ]
    },
    {
      "tag": "activity",
      "patterns": [
        "what are you doing", "what are you up to"
      ],
      "responses": [
        "Talking to you, of course!"
      ]
    },
    {
      "tag": "unknown",
      "patterns": [
        "i don't understand", "can you repeat that?", "what do you mean?", 
        "help me with something else"
      ],
      "responses": [
        "I'm sorry, I didn't understand that. Could you please provide more details?", 
        "Could you clarify what you mean? I'm here to help!"
      ]
    }
  ]
}
  ''';

  // Parse the intents JSON
  final Map<String, dynamic> intentsData = json.decode(jsonIntents);

  // Ensure userMessage is not empty
  if (userMessage == null || userMessage.isEmpty) {
    return (intentsData["intents"]
                .firstWhere((intent) => intent['tag'] == "unknown")['responses']
            as List<dynamic>)
        .first;
  }

  // Convert the user message to lowercase for comparison
  final String lastUserMessage = userMessage.toLowerCase();

  // Default response for unknown message
  String selectedResponse = (intentsData["intents"]
              .firstWhere((intent) => intent['tag'] == "unknown")['responses']
          as List<dynamic>)
      .first;

  // Match intents and choose the appropriate response using regular expressions
  for (var intent in intentsData["intents"]) {
    for (String pattern in intent['patterns']) {
      // Use RegExp for better pattern matching
      final regExpPattern = RegExp(r'\b' + pattern.toLowerCase() + r'\b');
      if (regExpPattern.hasMatch(lastUserMessage)) {
        final List<dynamic> categoryResponses =
            intent['responses'] as List<dynamic>;
        selectedResponse =
            categoryResponses[math.Random().nextInt(categoryResponses.length)];
        break; // Exit the loop once a match is found
      }
    }
    // Exit the outer loop if a match was found
    if (selectedResponse !=
        (intentsData["intents"].firstWhere(
                    (intent) => intent['tag'] == "unknown")['responses']
                as List<dynamic>)
            .first) {
      break;
    }
  }

  return selectedResponse;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
