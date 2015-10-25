How this project is organized
==============================

Work flow:
----------

1. Words are in the language model
2. Write the bash scripts and check if they do what you want.
3. Write the Grammar for Simon and create the scenario in Simon with the grammar from the ods file.
4. Test the scenario 
5. Test again
6. Write me so i can put them on here or open an Issue on github. 


If the words for a particular purpose are in the language model, work can start on the backend scripts. If not, open an ISSUE with the Words in it and I see what I can do on adding them in the next update :-D

For this just think what sould be done. For exampple: When i say 'Computer Wetterbericht' he should speak to me the local weather. 

So my bash script must be able to download a local weather forecast and extract some data like temperature and give them to MarryTTS for speaking. After this is done you can start on your activation sentences like: "Computer wie wird das Wetter heute" if you put them into the .ods sheet make sure not to double use some variables for different words.
Then generate the Simon scenario and test your work. Be aware that you need to add the "shadow dict" for that to work. 

The shadow dictionary is in SPHINX format and can be found in your local .linjark install folder. It needs to be added or looked into so you know what words you can use. You also need it to create the scenario.

NOTE: When you make a Simon Scenario be sure to include a "Training" Section so the user can train the used sentences!
Also note the naming sheme: [DE/VF/SPHINX] NAME

If the script needs user interaction you should supply a Readme file with the script and explain what needs to be done for ex. placing a local Weather URL code in the script.

Important stuff you need to know:
---------------------------------

All the programs needed for the end user should be stored in: /home/$USER/.linjark

Scripts go into .linjark/scripts

Scripts for a module like "Weather" go into a subfolder: .linjark/scripts/weather

A symbolic link from the script goes to .linjark/bin

ALL script links in .linjark/bin are named: linjark_NAME (eg_ linjark_weather)

The local MarryTTS gets extracted into .linjark so it becomes .linjark/marytts-5.1

This is important as you need to refer these paths in the bash scripts to make marry speak with the user.

__IMPORTANT:__ as Simon can not refer to paths like "~" all scripts need to be adressd in the scenario commands with the name who is in .linjark/bin

The __Path__ var of the user will be modiefied to search in .linjark/bin for the script names!!!

__Distribution of modules__

A module package is a NAME.tar.gz package who consists of the following files:

scenarioNAME.scenario (Your generated Scenario for Simon to import, gets extracted into the HOME dir)
.linjark/scripts/FOLDERNAME (Your scriptsfolder, extracts to the .linjark/scripts/ folder)

Note: Your FOLDERNAME folder can hold any files necessary for the scenario to function, like pictures etc. 

A README_linjark_NAME file with further inscructions, if the user needs to modify something in the script direclty.

A COMMANDS_linjark_NAME file with the speakable commands sould be supplied.

Readme's in another language the enduser have different sufixes like. README_linjark_NAME.de, README_linjark_NAME.en

What's with the J_w# grammar??
---------------------------

This is needed to get better recognition results in Simon. Simon uses Grammar to make sense of words.
If we would use normal Grammar like adjectives and noun it would ne computed like this:

All Adjectives would be computed with all possible combinations even if only one was correct for this scenario. This can lead to many false positives.

Lets look at this example to make it clear:
(Note that B1 etc is only used to illustrate that they are not the same words(1) but the same grammar structure (B))

Desired Sentence structure: A B1 C1 

Desired Sentence structure: A B2 B3 C2

Now simon would compute solutions like this:

```
A B1 B3 C1
A B2 B1 C1
A B2 B3 C1
A B3 B2 C1
A B3 B1 C1

A B1 B3 C2
A B2 B1 C2
A B2 B3 C2
A B3 B2 C2
A B3 B1 C2

A B1 C1 
A B3 C1
A B2 C1

A B1 C2 
A B3 C2
A B2 C2
```

But only A B1 C1 and A B2 B3 C2 are valid and would trigger the start of a script.

Only because they all in the same grammar group. To avoid this every used word gets its own grammar "tag"!

To check what grammar tags are already reserved check out the linjark_Grammar.ods if you want to add sentences just do it and make sure to use the tags if a word is already used. Also make sure not to overwrite tags!



