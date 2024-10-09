//
//  ContentView.swift
//  Code Relay
//
//  Created by Adam Rush on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAlert = false
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            
            Tab("Favourites", systemImage: "star") {
                // TODO: Add Favourites View 🍤
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
            
            Tab("Lucky wheel", systemImage: "arcade.stick") {
                NavigationView {
                    SpinWheelView()
                }
            }
        }.tint(.red)
        .onReceive(NotificationCenter.default.publisher(for: .shake)) { _ in
                isShowingAlert = true
            }
            .alert("Here is an Adam joke", isPresented: $isShowingAlert) {
            } message: {
                Text(randomAdamJoke)
            }
    }

     var randomAdamJoke: String {
        return [
            "My boss said “dress for the job you want, not for the job you have.” So I went in as Batman.",
            "I went to the aquarium this weekend, but I didn’t stay long. There’s something fishy about that place.",
            "What do you call a sheep who can sing and dance? Lady Ba Ba.",
            "What do you call a French man wearing sandals? Philipe Fallop.",
            "Why can't dinosaurs clap their hands? Because they're extinct.",
            "I gave my handyman a to-do list, but he only did jobs 1, 3, and 5. Turns out he only does odd jobs.",
            "Why should you never take sides in an argument at the dinner table? Trick question. It's the perfect time to take sides because no one's paying attention. Bring Tupperware.",
            "Who won the neck decorating contest? It was a tie.",
            "Where do rainbows go when they've been bad? To prism, so they have time to reflect on what they've done.",
            "Dogs can't operate MRI machines. But catscan.",
            "What do mermaids use to wash their fins? Tide.",
            "What did the skillet eat on its birthday? Pan-cakes.",
            "Why couldn't the produce manager make it to work? He could drive, but he didn't avocado.",
            "I went to a silent auction. I won a dog whistle and two mimes.",
            "How is my wallet like an onion? Every time I open it, I cry.",
            "What do you call a dog who meditates? Aware wolf.",
            "What kind of fish do penguins catch at night? Star fish.",
            "Which vegetable has the best kung fu? Broc-lee.",
            "Can a frog jump higher than a house? Of course, a house can't jump.",
            "I was going to try an all almond diet, but that's just nuts.",
            "I once submitted 10 puns to a joke competition. I really thought with that many, one was sure to be a winner. Sadly, no pun in ten did.",
            "Why did the old man fall down the well? He couldn’t see that well.",
            "I tried to make up a joke about ghost but I couldn't. It had plenty of spirit but no body.",
            "Dad: What is the difference between a piano, a tuna, and a pot of glue? Me: I don't know. Dad: You can tuna piano but you can't piano a tuna. Me: What about the pot of glue? Dad: I knew you'd get stuck on that.",
            "Two windmills were sitting on a hill. One asks the other, \"Do you have a favorite song?\" The other replies, \"Well... all my life I have been a heavy metal fan.\"",
            "Today at the bank, an old lady asked me to check her balance... So I pushed her over.",
            "I got an A on my origami assignment when I turned my paper into my teacher.",
            "How many storm troopers does it take to change a lightbulb? None, because they are all on the dark side.",
            "If your house is cold, just stand in the corner. It’s always 90 degrees there.",
            "Hi, I’m Cliff. Drop over sometime.",
            "Did you hear about the guy who went to the doctor for a headache? The doctor examined his ear and found money. The doctor kept pulling and pulling it out until he had $1,999. Then the doctor said, \"No wonder you're not feeling two grand!\"",
            "Dad, when he puts the car in reverse: \"Ah, this takes me back.\"",
            "What do you call the security guards for Samsung? Guardians of the galaxy.",
            "I was making a joke about retirement. It did not work.",
            "The other day I bought a thesaurus, but when I got home and opened it, all the pages were blank. I have no word to describe how angry I am.",
            "The owner of the tuxedo store kept hovering over me when I was browsing, so I asked him to leave me alone. He said, “Fine, suit yourself.”",
            "Why did the egg have a day off? Because it was Fryday.",
            "Have you ever heard about the kidnapping at school? It's okay, he woke up.",
            "I found a book called How to Solve 50% of Your Problems. So I bought 2.",
            "Why did the coffee taste like dirt? Because it was ground just a few minutes ago.",
            "Why did the Rolling Stones stop making music? Because they got to bottom of the hill.",
            "What is the best present? Broken drums! You can't beat them.",
            "I made song about tortilla once, now it's more like a wrap.",
            "Did you know courdury pillows are in style? They're making headlines.",
            "What does a nosey pepper do? It gets jalapeño business.",
            "Did you hear about the fragile myth? It was busted.",
            "What word can you make shorter by adding two letters? Short.",
            "What do call a criminal landing an airplane? Condescending.",
            "I stayed up all night wondering where the sun went, and then it dawned on me.",
            "Why do people who live in Greece hate waking up at dawn? Because Dawn is tough on Greece."
        ]
        .randomElement() ?? "Adam is out of jokes!"
    }
}

#Preview {
    ContentView()
}
