# SAS4-Ticket-Reset-Batch-Script
Windows cmd script to help reset nightmare tickets on SAS4 Steam for Windows. It handles all version changes, date changes, and game opening/closing.

I recommend watching this video to see what is happening under the hood for this script. A proper understanding of what files you need and where to store them is very helpful.
  https://youtu.be/r8ep9r_LSB8

To set up the script:
1. The user must first download the game manifest for version 1.10.2, which can be done by following this video:
  https://youtu.be/foUFfT7jzXo
  
2. Then the user must change the filepath for the 1.10.2 game manifest (line 20) to match where you decide to store the 1.10.2 game files

3. You must also do the same for except for the current version game files (line 51) you should have stored somewhere besides the \steamapps game directory

Once the setup is done, you must run this script (downgrade.bat) as administrator in order to change the date through cmd, everything else will work fine through normal cmd. You will need to manually change the date yourself if you choose to run through regular cmd.

Once you run the script, it will tell you where to go in order to properly reset your tickets
1. Click "Play" on the opening menu
2. Select the character you wish to reset tickets on
3. Go to "Multiplayer"
4. Press any key for the batch script to advance the date 1 day forward
  4b. Some days windows does not accept as a valid date and you will have to manually input tomorrow's date at this stage
5. Go back to the main menu and click on "Settings" in the lower right corner
6. Select "Force Backup" and press "Okay" once prompted
7. Go back to the cmd window and press any key to revert the date and versions back to the present. Your tickets have now been reset.
