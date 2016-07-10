{
  "title": "Setting up a backup strategy with Amazon S3",
  "date": "2009-02-27T00:00:00+00:00",
  "description": "I've recently put a fairly rigorous backup procedure in place for local, staging and production servers. Partly so I don't forget I've written up the process. ",
  "tags": [
    "Linux"
  ]
}

<h3>The setup</h3>

<p>I have a local development server (my mac), a staging server (a Mac Mini running CentOS 5.2) and a production server (a MediaTemple dv running Centos 5.2).</p>

<p>I will be using the Mac Mini to double up as the backup server and as a further measure I will be using Amazon S3 as an additional backup from the Mac Mini.</p> 

<h3>Local backups</h3>

<p>The live server is basically just a web server. It runs around 20 sites and MySQL databases. Not a massive amount but these sites are business critical and if they go down the phone will start ringing with angry customers who pay me for a service. So for this server I have always played it safe. I opted for Centos 5 as it is stable and slightly more conservative on the package versions included. </p> 

<p>First of all I perform some local backups on this server. Using the excellent <a href="http://sourceforge.net/projects/automysqlbackup/">AutoMySQLBackup</a> script I back up the MySQL databases using a cron job at 0500 every day to /var/backups/mysql/. This gives me daily, weekly and monthly backups for each database and rotates each day. </p>

<p>I also back up the virtual hosts to /var/backups/vhosts/ using a cron job:</p>

    #!/bin/bash
    rsync -a /var/www/vhosts/ /var/backups/vhosts/

<p>So I have a local copy of everything. Eventually I'd like to rotate the vhosts backup but that is a to do. </p>

<h3>Backing up remotely</h3>

<p>Next I send a backup to my remote backup server. This means I have a remote copy in the cloud so if the server blows up I can recover everything. I set up <a href="https://shapeshed.com/journal/using_shared_keys_with_ssh_on_centos_5/">shared keys</a> between the production server and the backup machine. This means I don't need passwords so I can also create a cron job and forget about it. First of all I copied the vhosts and mysql folders as .tar.bz2 files to the backup server. For daily backup I'm using <a href="http://samba.anu.edu.au/rsync/">Rsync</a> to push changes to the backup server, again in a cron job:</p>

    #!/bin/bash
    rsync -a --exclude-from="/home/george/exclude.txt" --del -e ssh /var/www/vhosts/  george@1.234.56.789:/mnt/dionysus/backups/shapeshed.com/var/www/vhosts/
    rsync -a --del -e ssh /var/backups/mysql/  george@1.234.56.789:/mnt/dionysus/backups/shapeshed.com/var/backups/mysql/

<p>Note the --exlude-from option. This references a text file that excludes certain files and folder that don't need to be backed up (e.g cache folders).</p>

<p>So now I have a local backup on the Production Server and a further remote backup on the Backup Server. But I'm not done yet!</p>

<h3>Backing up to Amazon S3</h3>

<p>I then push the backup from the remote backup server to <a href="http://aws.amazon.com/s3/">Amazon S3</a> daily. I worked out the total cost of backups would be around $20 a year. Cheap peace of mind. To do this I'm using <a href="http://s3tools.org/s3cmd">s3cmd</a>, an open source command line tool for uploading, retrieving and managing data in Amazon S3. They even have a yum repo so it is very straightforward to install. </p>

<p>From the backup box I send the backups to Amazon S3 daily using the following script in again in cron job:</p>

    #!/bin/bash
    s3cmd sync -r --delete-removed /mnt/dionysus/backups/shapeshed.com/var/backups/mysql/ s3://shapeshed.com/var/backups/mysql/
    s3cmd sync -r --delete-removed /mnt/dionysus/backups/shapeshed.com/var/www/vhosts/ s3://shapeshed.com/var/www/vhosts/

<p>So now I have three backups - a local one, a remote one and a backup on Amazon S3</p>

<h3>Staging and development servers</h3>

<p>For the staging server I back up locally (it is also the backup server) and then send this backup to Amazon S3. I suppose I could also send a backup to the live server too - another to do at the moment. </p>

<p>For the development server I send a backup to backup server which in turn pushes a backup to S3.</p>

<h3>To be done..</h3>

<p>I'm pretty happy with this approach from an absolute disaster perspective. I'd be able to recover from any other three machines melting or being subject to a security breach.</p>

<p>There are two things that need improving. Firstly everything other than the MySQL backup is not rotated. Secondly there is no logging in the shell scripts so if anything goes wrong I probably won't know about it. But clients are calling so I need get on...</p>

<p>If you have any advice on this approach then please leave a comment, if not I hope this article has been useful for you!</p> 
