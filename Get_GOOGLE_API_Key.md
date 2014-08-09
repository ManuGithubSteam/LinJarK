What is the GOOGLE API key ?
============================

It is an unique key that allows you as user to use sepcial Google services like translation, Geolocation and many more WITHOUT the need to use a Webbrowser. This enables you to use these services in your programms and scripts.

It allows Google to monitor your usage of these services, so they can block you or charge you for using more than they allow freely.

Why do I need one ?
===================

For the use of the voicecontrol/speechrecognition you dont have to have one but without it you will not be able to use these modules. (This list will most likely grow over time as new words will enter the language model)

 - Internet search with your voice (Amazon, Google etc)
 - Translation (translate words in other languages)
 - Music (the ability to select a specific track by just saying its name) 

How to get one?
===============
The following is adapted from Google HowTos -> http://www.chromium.org/developers/how-tos/api-keys

API Keys
---------
Some features of Chromium use Google APIs, and to access those APIs, either an API Key or a set of OAuth 2.0 tokens is required. These instructions apply to Chromium version 23 and higher.

The keys you acquire are not for distribution purposes and must not be shared with other users.
Acquiring Keys

1. Make sure you are a member of chromium-dev@chromium.org (you can just subscribe to chromium-dev and choose not to receive mail). For convenience, the APIs below are only visible to people subscribed to that group.

2. Make sure you are logged in with the Google account associated with the email address that you used to subscribe to chromium-dev.

3. Go to https://cloud.google.com/console

4. Click the red "Create project..." button.

5. In the 'APIs & auth' > APIs tab, click the On/Off button to turn each of the following APIs to the On position, and read and agree to the Terms of Service that is shown: 
    
    Here search for the "Speech API" and enable it!

6. Go to the Credentials tab under the APIs & auth tab.

7. Click the red "Create New Key" button in the __Public API Access__ section and create a new Browser key.
    You want to leave the box on the "Create a browser key and configure allowed referers" empty.

8. A new box should appear titled "Key for browser applications". The next sections will refer to the value of the __“API key”__ field too.

Note that the keys you have now acquired are __not for distribution purposes and must not be shared with other users__.

Restrictions
=============

Google restricts the use of their Speech API to 50 uses per day per API-Project. 


How to use the API key with linjark ?
=====================================

Copy the API Key (and only the API KEY) and paste it into a bash terminal with this command:

```
echo PASTE_KEY_HERE > ~/.linjark/google_api
```

Thats it! The scripts who need access to the Google API will look into that file and get the key. 




