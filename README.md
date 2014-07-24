Status
=======
Waiting for the new model from Guenter :-) Thanks a lot for the great work!

Always check out: FeatureMatrix.ods

Purpose
========
This git repo is set up with the goal of providing an more easy solution for GERMAN speaking people to control their PC, house or whatever with their voice.
Till now this is not really easy, mostly because the German language model does not support the right words for controlling applications and devices. But also because their are no use cases scenarios written for Simon and scripts to implement things in an easy way.

Inspiration
============
This project is heavily inspired by the Iron Man movies and the speaking JARVIS computer. Also some inspiration is drawn from the J.A.R.V.I.S project for Microsoft Windows. (Who uses a non open source speech model to do his stuff)

Goal
====
- Add missing words to the German open source language model.
- Write the scripts for the backend.
- Write Scenarios for Simon to use the backend-scripts and the model.
- Raise awareness of free, open source GERMAN speech recognition.

- Further down the line, write a conkyrc script to implement "Rainmeter" like functionality for the Linux deskop.
  - A graphics designer would be needed here for the background image
- Get all of this stuff onto the Raspberry PI or a similar micro computer (ARM)

Structure / Used technologies
=============================

- How does all this work ?
- Base: language model
- Backend: Bash-Scripts who do various things
- Frontend: Simon and MarryTTS

How does all this work ?
-------------------------
When you speak in your microphone, simon is comparing your speech with the data in the language model, if he finds the word in the model, he can understand you. Then he will launch some scripts according to what you say eg. check the weather for you.

BASE: language model
---------------------
For a PC to understand humans he needs to know how they sound and what words they use. He does that with a language model. 
There are two types of models that describe language - grammars and statistical language models. Grammars describe very simple types of languages for command and control, and they are usually written by hand or generated automatically with plain code. 

However, for now not even all command and control words are in the GERMAN language model.

I use the German language model from Voxforge: http://voxforge.org/

More specificly the on from Guenter: http://goofy.zamia.org/voxforge/

I relay on Guenter to publish new language models (as they wont compile on my machine for some miraculous reason).
I work actively with him to add new words into the model who can than be understood by Simon and used by the scripts.

If you want to know more about the whole model compilation business check out his awesome tools: https://github.com/gooofy/voxforge/

BACKEND: bash scripts to do stuff
----------------------------------
Here is most of the work done. Get the local weather data and play it back to you, get some jokes from the new etc.
It is all done here. I use bash scripts for this because they are easy to understand and to modify if the web page does change their information layout etc. 

FRONTEND: Simon
-----------------

Another great program, it is very powerful and the dev is really helpful and nice guy! I use Simon to do various things from me:

- Break down the functionality of the scripts into modules (called Scenarios), so someone can only use the "Search" module and don't has to install all the other modules like Translation etc.
- It is possible to train the speech model with it to your voice so it understands you better (very important)
- It handles all the basics like mic calibration, understanding what you are saying, launching commands etc
- Provides and easy method to change the activation sentences to your likening
- Can do many more things :-D Just check it out.

Check out Simon here: http://grasch.net/blog and here https://simon.kde.org/

MarryTTS is used to generate spoken responses and output of the Data. -> https://github.com/marytts/marytts

Want to help ?
==============

Just get in touch! Help is always needed and there is plenty to do!

Read the Structure.md and Todo.md



