#About

This application helps users practice common methods to refactor ruby code.

![Homepage](https://files.slack.com/files-pri/T04481E0F-F04BJK23X/screen_shot_2015-04-09_at_5.40.30_pm.png)

##How to get it running locally:

1. Register a new Google application that has access to contacts and the google + API (or get in touch with @mmlkrx for the credentials ;).

2. Run `rake db:drop && rake db:create && rake db:migrate && rake db:seed`.

3. start your local server and log into the app with your Google account.

4. Run `rake user:add_exercises` to connect your account to some of the seed data.
