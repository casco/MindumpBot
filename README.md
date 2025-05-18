# MindumpBot
A simple telegram bot to help you dump your thoughts to text for blogs and social media

```Smalltalk
Metacello new
	baseline: 'MindumpBot';
	repository: 'github://casco/MindumpBot';
	onConflictUseLoaded;
	onWarningLog;
	load.
```

To install the app:

```Smalltalk
bot := MindumpBot token:'your-telegram-token'.
bot startBotPolling:1 . "Polling updates every second."
bot stopBot. "To stop the bot and the polling process".

app := WAAdmin register: MDBLoginComponent asApplicationAt: 'mdb'.
app sessionClass: MDBSession .
app
	addLibrary: JQDeploymentLibrary;
	addLibrary: JQUiDeploymentLibrary;
	addLibrary: SBSDeploymentLibrary .
```
