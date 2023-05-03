+++
date = "2008-01-03T00:00:00+00:00"
description = "MySQL doesn't currently support altering the name of a database using SQL so here's a workaround."
tags = ["MySQL"]
title = "Changing the name of a MySQL database"
+++

## Support added then removed

Support for renaming databases in MySQL was added in version 5.1.7 and then
removed in 5.1.23 as the RENAME statement was found to result in the loss of
database contents. So what if you need to rename a database?

## MySQL Administrator to the rescue

Using MySQL administrator you can backup the database. [MySQL Administrator][1]
is a free GUI for administering MySQL databases. This gives you a SQL file with
a full backup of the database. To run the back up click backup and then select
the database you want to rename. Save the file to a location where you can edit
it.

![Backing up the database][2]

Next fire up at text editor that allows you to Find and Replace. My choice is
[TextMate][3]. Open the SQL file you have just created and invoke the find and
replace dialog. Then simply search for the old name and replace it with the new
name. Eyeball the SQL statements to check that everything has gone to plan. Save
the file again.

![Search and replace dialog][4]

Return to MySQL administrator and this time use the restore utility. Choose the
SQL file you have just saved and import it. Job done! If you now refresh the
list of databases you will see a copy of the old database with the new name.

## Don't forget privileges!

Don't forget that you will need to assign privileges to the user to access and
use the new database. Do this in the normal way by clicking Accounts and then
assigning rights to the user.

[1]: http://dev.mysql.com/downloads/gui-tools/5.0.html
[2]: /images/articles/select_backup.jpg
[3]: http://macromates.com/
[4]: /images/articles/rename_database.png
