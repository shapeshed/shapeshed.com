{
  "title": "Setting up Git for multiple developers",
  "date": "2010-03-31T00:00:00+01:00",
  "description": "How to set up git for multiple developers with granular access permissions",
  "tags": [
    "git"
  ]
}

## The problem

You have a git repository that you want to allow other developers to access and may wish to specify read or read/write access. 

## Solution 1

You could choose to use Unix user accounts to allow access to the git repository. I tried this route and found it didn't work very well. You need to move all users to have the same primary group and change the default umask on the server to allow everyone in that group to read and write. If you are interested in this technique there is a pretty good write up [on Serverfault][1].

In my usage of this I encountered problems where the git cache wasn't respecting the default umask so users were then unable to write to the repository. It meant that whenever anyone wanted to push I would have to reset the permissions on the repository. Not ideal. 

The other thing I don't like about this technique is that users need to have an account, which seems a bit like overkill for accessing a repository.

## Solution 2

The solution I tried next and which has been working really well for around two weeks now is [gitosis][2]. Gitosis has been around for a while but if you are a [Github][3] user you'll be familiar with the approach. Instead of creating a user for each developer you want to access the repository there is a single git user. Access is then assigned on the basis of shared keys. So you don't need to create accounts and all you need to give a developer access is a shared key. 

## Installation

This walkthrough is for Ubuntu and the usual stuff applies. You travel at your own risk, take backups etc..

Install gitosis as detailed [here][2]. You need to create a git user (the command is on the link). 

If you've got this far you should have installed gitosis ok and have set up the git user.

Gitosis allows access using public keys so (assuming you are on OSX or Linux) you need to generate one if you don't have one

    ssh-keygen -t rsa

This generates a public key on your local machine that you'll find in ./.ssh/id_rsa.pub

Then you need to copy this file to the remote server (where you installed gitosis). The gitosis documentation recommends copying it to the /tmp folder so lets do that. Replace 'myuser@7123.456.789.0' with your server details. 

    scp ~/.ssh/id_rsa.pub myuser@7123.456.789.0:~/tmp

Once copied over on the remote machine import the key for the git user 

    sudo -H -u git gitosis-init < /tmp/id_rsa.pub

Finally the documentation advises use to make sure the post-update hook is executable

    sudo chmod 755 /home/git/repositories/gitosis-admin.git/hooks/post-update

## Administration

So far we've set up gitosis, added a git user and added our public key to the git user. So now on our local machine we can clone the repository that defines access to other git repositories.

    git clone git@YOUR_SERVER_HOSTNAME:gitosis-admin.git

If everything has gone to plan this will pull down a git repository. 

Look inside this and you'll see the a gitosis.conf file and a 'keydir' folder. The 'keydir' folder houses the public keys that give access to repositories and the gitosis.conf file defines what users can do. Simple. 

Your gitosis.conf file might look something like this

    [gitosis]

    [group gitosis-admin]
    writable = gitosis-admin
    members = george_ornbo an_other_developer

    [group myproject]
    writable = myproject
    members = george_ornbo an_other_developer third_developer 

The first group defines who can edit the gitosis-admin repository. This means anyone in this group can grant access to repositories. The second group 'myproject' defines who can acess the myproject repository. The members refers to the names of keys in the the 'keydir' directory. So 'george\_ornbo.pub' becomes 'george\_ornbo'. Repositories need to sit inside /home/git/repositories. You can change the home directory of the git user if you wish to something like /var/git/. This would mean repositories would sit in /var/git/repositories. 

So now if a new developer comes on board we can just add the key to the 'keydir' directory, update the group members, push the git repository and it is done.

In the above example the 'myproject' repo would be available at git@YOUR\_SERVER\_HOSTNAME:myproject.git

## Limited documentation

I found that documentation was a little patchy - the best place for documentation is [here][2].

## A great solution

Gitosis is so much better than using Unix accounts to provide access to a repository. With a shared key a developer can easily be given access to one or more repositories, be locked to just read access or given full permissions. It is working really well for me. Highly recommended!

## Solution 3

Edit .git/config and add:

sharedRepository = group

  or

sharedRepository = 0660

to [core]

as mentioned in https://www.kernel.org/pub/software/scm/git/docs/git-config.html


## Related links

* [How do I share a Git repository with multiple users on a machine?][1] - Serverfault question on sharing git repositories
* [Gitosis][2] - Hosting Git repositories, The Easy (and Secure) Way
* [Github][3] - Github
* [Using Shared Keys with SSH on Centos 5][4] - Introduction to shared keys

[1]: http://serverfault.com/questions/26954/how-do-i-share-a-git-repository-with-multiple-users-on-a-machine
[2]: http://scie.nti.st/2007/11/14/hosting-git-repositories-the-easy-and-secure-way/
[3]: http://github.com/
[4]: http://shapeshed.com//using_shared_keys_with_ssh_on_centos_5/
