.. _tutorial-git-basics:

Tutorial - Git Basics
=====================

In many of your CS classes, you will use a system called **Git**
to manage the code you write in that class. In a nutshell,
you can think of Git as a system to conveniently store your
code in a remote server, and to keep track of changes to that
code. Git also makes it easier for an instructor (and other
course staff) to access your code.

More specifically, Git is a *version control system* that maintains files in a
*repository* that contains not just files, but also a record of all the
changes made to those files. Git tracks every version of a file or
directory using *commits*. When you have made changes to one or more
files, you can logically group those changes into a “commit” that gets
added to your repository. You can think of commits as “checkpoints” in
your work, representing the work you’ve done since the previous
checkpoint. This mechanism makes it possible to look at and even revert
to older versions of a file by going back to your code as it was when
you “checkpointed” it with a commit.

In this tutorial, we will be using `GitHub <https://github.com/>`__,
a web-based hosting service for Git repositories, to learn the basics
of Git. So, before working through the tutorial,
you will need to have a GitHub account. If you do not yet have one, you can
get an account here: https://github.com/join. Once you create your
account, you may want to get the `Student Developer
Pack <https://education.github.com/pack>`__, which will give you access
to a lot of other features (please note that having the Student
Developer Pack is not necessary for your UChicago classes; it’s just a nice benefit you
get as a student)

Where should you do this tutorial?
----------------------------------

Since you will often have to use Git on the CS department's Linux
environment, we strongly suggest you work
through this tutorial on a :ref:`UChicago CS software environment <software-environment>`
(follow the link for more details on how to access such an environment).
That said, you should also be able to work through this
tutorial in other UNIX environments, such as the MacOS terminal
or `Ubuntu WSL <https://ubuntu.com/wsl>`__ on Windows.

Please note that this tutorial assumes familiarity with using a UNIX
environment. If you are unfamiliar with how to use a UNIX environment, such
as Linux, you should work through the :ref:`Linux Tutorial <tutorial-linux>` first.

Throughout the tutorial, you will have to make some simple edits
to a few text files. If you are using SSH to connect to a CS Linux server,
we suggest you use a command-line
editor for this (like Vi, emacs, nano, etc.). If you are using a desktop
environment (such as a CSIL machine or a Virtual Desktop), then Ubuntu's built-in Text Editor
should be enough. You will not need to use a full-featured code editor
in this tutorial.


Creating a repository
---------------------

To work through this tutorial, you will need to create a repository on
GitHub. To do this, log into GitHub, and click on the "+" icon on the top-right
of the page, and then on "New Repository":

.. image:: new-repository.png
   :align: center

Then, under "Repository name" enter ``uchicago-cs-git-tutorial``. Do
not change any other setting, and click on the green "Create repository"
button.

Once you do this, you will be taken to a page where you can browse your
repository through GitHub’s web interface. However, you haven’t
initialized your repository yet, so GitHub will provide you with the
instructions to initialize your repository.

*Don't try to run these commands from the terminal just yet!* You will first
need to perform some setup steps that will allow you to access
your Git repository from the command-line.

.. note::

    Before continuing, it is important that you know how to locate
    your repository on GitHub's website. You can find a link to
    the repository in your GitHub profile::

        https://github.com/GITHUB_USERNAME

    Where ``GITHUB_USERNAME`` is your GitHub username.

    From that page, simply click on the "Repositories" tab, and you will
    find the repository you've just created.

    You can also access these pages by logging into GitHub,
    clicking on the profile icon on the top-right of the page, and
    then clicking on "Your profile" or "Your repositories".


Setting up SSH access
---------------------

We are going to start by initializing the repository
you just created. Before we can do this, we need to take a short
detour to create an SSH key and upload it to GitHub, which will
allow you to access your GitHub repository from the terminal.

While these steps may seem a bit intricate, you only need to
do them once. If you are logging into a CS Linux environment,
the SSH key you create now will be available the next time you
log in (regardless of what CS machine you're logging into).
However, if you want to access your repository from a different
computer (e.g., your personal computer), you will have to
create a new SSH key and upload it to GitHub.


Creating an SSH Key
~~~~~~~~~~~~~~~~~~~

When you log into the GitHub website, you use the username and
password associated with your GitHub account. However, when using
Git commands from the terminal, things are a bit different.
In particular, GitHub uses two mechanisms for authenticating yourself
from the terminal: Personal Access Tokens and SSH Keys. We will
be using SSH keys.

In a nutshell, an SSH key is a file that resides in your home directory,
and which you can think of as a file that stores a secure password
(SSH keys are a bit more complex than that but, for our purposes,
we can just think of them as extra-secure passwords)

To create an SSH key, run the following command from the terminal::

    $ ssh-keygen

You will see the following prompt::

    Generating public/private rsa key pair.
    Enter file in which to save the key (/home/username/.ssh/id_rsa):

Press Enter (this will select the default file path shown in the prompt: ``/home/username/.ssh/id_rsa``

.. note::

   If, after pressing Enter, you see the following message::

        /home/username/.ssh/id_rsa already exists.
        Overwrite (y/n)?

   This means there is already an SSH key in your home directory.
   You should proceed as follows:

   1. If you are already familiar with SSH keys, and know for certain
      that you'd like to use your existing SSH key, type "n" and
      skip ahead to the "Uploading your SSH key to GitHub" section below.
   2. If you do not know why you have an SSH key in your directory,
      it's possible it was created for you if you've taken another
      CS class in the past. Type "n" and then run the following commands
      to create a backup of your existing key::

            mv ~/.ssh/id_rsa ~/.ssh/id_rsa.bak
            mv ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub.bak

      Then, re-run the ``ssh-keygen`` command, press Enter when prompted
      for the file name, and follow the rest of the
      instructions in this section.

Next, you will see this prompt::

    Enter passphrase (empty for no passphrase):

Just press Enter here. You will be asked to confirm (just press Enter again)::

    Enter same passphrase again:

.. note::

    While it may seem counterintuitive, we don't want our SSH
    key to have a passphrase (this is an added layer of security which we don't
    need here; your GitHub account will still be secure even if your
    SSH key doesn't have a password)

If all goes well, you should see something like this::

    Your identification has been saved in /home/username/.ssh/id_rsa
    Your public key has been saved in /home/username/.ssh/id_rsa.pub
    The key fingerprint is:
    SHA256:cBUUs2FeMCIrBlTyv/PGpBtNz0v235zvLykpoWIOS9I username@machine
    The key's randomart image is:
    +---[RSA 3072]----+
    | .+.. . ..@+.    |
    |   +   o = *     |
    |    + o . o      |
    |   . o o         |
    |      . S        |
    |   .   +.o.      |
    |  . E ++..=. . . |
    |   o o+++o.oo oo.|
    |    .oo+. ...o.+O|
    +----[SHA256]-----+

This means your key was created correctly.

Uploading your SSH key to GitHub
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now, we need to instruct GitHub to accept our SSH key. To do this, log into https://github.com/
and go to your Settings page (by clicking on the top-right account icon, and then selecting "Settings"
in the drop-down menu. Then, click on "SSH and GPG keys".

Now, click on the green "New SSH key" button. This will take you to a page where you can upload your
SSH key. You will be asked for two values: a "Title" and the key itself. The title can be anything
you want, but we suggest something like "CS SSH Key".

The value of the key is contained in the ``.ssh/id_rsa.pub`` file in your home directory. To print
out the contents of that file, we can just use the ``cat`` command::

    $ cat ~/.ssh/id_rsa.pub

This will print a few lines of output starting with ``ssh-rsa`` and ending in something like ``username@machine``.
Copy the whole output to the clipboard; you can do this by clicking and dragging the mouse from the first
character to the last character, and then pressing Ctrl-Shift-C.

Then, paste the key into the "Key" field on the GitHub page. Then click on the green "Add SSH Key"
button.

To verify that you correctly uploaded the key, try running the following command::

    ssh -T git@github.com

You may see a message like this::

    The authenticity of host 'github.com (...)' can't be established.
    RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
    Are you sure you want to continue connecting (yes/no)?

You can safely enter "yes" here. You should then see a message like this::

    Hi username! You've successfully authenticated, but GitHub does
    not provide shell access.

This means your SSH key is properly set up (don't worry about the "does not provide shell access"; that is
normal).

If you are unable to set up your SSH key, please make sure to ask for help. You will not
be able to complete the rest of the tutorial until you've set up your SSH key.

If you would like to set up SSH access from your personal computer at a later time,
GitHub provides some pretty detailed documentation on how to do this in a number
of different operating systems: `Connecting to GitHub with SSH <https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh>`__
Please note that we may not be able to assist you with SSH issues on your own computer.


Initializing your repository
----------------------------

Ok, now we're actually ready to initialize your repository.
Do the following:

-  Create a directory in your home directory for the Git tutorial. The name
   and location of this directory is not important, so if you already
   have a preferred directory structure, you’re welcome to use it.
   Otherwise, we suggest you simply do this:

   ::

      cd
      mkdir git-tutorial
      cd git-tutorial


-  Inside that folder, create a file called ``README.md`` and add your
   full name to the file. Remember you can create an empty file by
   running the command ``touch README.md`` and then opening that file
   with your editor of choice.

-  On your repository’s GitHub page (on the GitHub website), right
   under “Quick setup — if you’ve done this kind of thing before”
   there is a URL field with two buttons: HTTPS and SSH.
   Make sure that “SSH” is selected.

Now, from inside your tutorial directory, run the commands that appear
under “…or create a new repository on the command line” *except* the
first one (the one that starts with ``echo``).

Don’t worry about what each individual command does; we will be seeing
what most of these commands do in this tutorial.

You can verify that your repository was correctly set up by going back
to your repository’s page on GitHub, you should now see it contains a
``README.md`` file. If you click on it, you can see its contents.

Creating a commit
-----------------

If you make changes to your repository, the way to store those changes
(and the updated versions of the modified files) is by creating a
*commit*. So, let’s start by making some changes:

-  Edit ``README.md`` to also include your CNetID on the same line as your name
-  Create a new file called ``test.txt`` that contains a single line with the text ``Hello, world!``

Creating a commit is a two-step process. First, you have to indicate
what files you want to include in your commit. Let’s say we want to
create a commit that only includes the updated ``README.md`` file. We
can specify this operation explicitly using the ``git add`` command from
the terminal:

::

   git add README.md

This command will not print any output if it is successful.

To create the commit, use the ``git commit`` command. This command will
take all the files you added with ``git add`` and will bundle them into
a commit:

::

   git commit -m "Updated README.md"

The text after the ``-m`` is a short message that describes the changes
you have made since your last commit. Common examples of commit messages
might be “Finished homework 1” or “Implemented insert function for data
struct”.

.. warning::

   If you forget the ``-m`` parameter, Git will think that
   you forgot to specify a commit message. It will graciously open up a
   default editor so that you can enter such a message. This can be useful
   if you want to enter a longer commit message (including multi-line
   messages). We will experiment with this later.

Once you run the above command, you will see something like the
following output:

::

   [main 3e39c15] Updated README.md
    1 file changed, 1 insertion(+), 1 deletion(-)

You’ve created a commit, but you’re not done yet: you haven’t uploaded
it to GitHub yet. Forgetting this step is actually a very common
pitfall, so don’t forget to upload your changes. You must use the
``git push`` command for your changes to be uploaded to the Git
server. Simply run the following command from the Linux command-line:

::

   git push

This should output something like this:

::

    Enumerating objects: 5, done.
    Counting objects: 100% (5/5), done.
    Writing objects: 100% (3/3), 279 bytes | 279.00 KiB/s, done.
    Total 3 (delta 0), reused 0 (delta 0)
    To git@github.com:GITHUB_USERNAME/uchicago-cs-git-tutorial.git
       392555e..0c85752  main -> main

You can ignore most of those messages. The important thing is to not see
any warnings or error messages.

.. warning::

   When you push for the first time, you may get a message
   saying that ``push.default is unset``, and suggesting two possible
   commands to remedy the situation. While the rest of the commands in this tutorial
   will work fine if you don’t run either of these commands, you should run the
   command to use “simple” (this will prevent the warning from appearing
   every time you push)

You can verify that your commit was correctly pushed to GitHub by
going to your repository on the GitHub website. The ``README.md`` file should now
show the updated content (your name and CNetID)

In general, if you’re concerned about whether the course staff are seeing the
right version of your work, you can just go to GitHub. Whatever is shown
on your repository’s page is what the course staff will see. If you wrote
some code, and it doesn’t show up on GitHub, make sure you didn’t forget
to add your files, create a commit, and push the most recent commit to
the server.

``git add`` revisited and ``git status``
----------------------------------------

Let’s make a further change to ``README.md``: Add a line with the text
``UChicago CS Git Tutorial``.

So, at this point, we have a file we have already committed
(``README.md``) but where the *local* version is now out of sync with
the version on GitHub. Furthermore, earlier we created a ``test.txt``
file. Is it a part of our repository? You can use the following command
to ask Git for a summary of the files it is tracking:

::

   git status

This command should output something like this:

::

    On branch main
    Your branch is up to date with 'origin/main'.

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
        test.txt

    no changes added to commit (use "git add" and/or "git commit -a")

.. note::

   When working on CS machines, you should see the message above.  At
   some point, you will start using git with your own machine.
   depending on the version of Git you have installed, the message
   under ``Changes not staged for commit`` may refer to a command
   called ``git checkout`` (instead of ``git restore``).

Notice that there are two types of files listed here:

-  ``Changes not staged for commit``: This is a list of files that Git
   knows about and have been modified since your last commit, but which
   have not been added to a commit (with ``git add``). Note that we
   *did* use ``git add`` previously with ``README.md`` (which is why Git
   is “tracking” that file), but we have not run ``git add`` since our
   last commit, which means the change we made to ``README.md`` is not
   currently scheduled to be included in any commit. Remember: committing is
   a two-step process (you ``git add`` the files that will be part of
   the commit, and then you create the commit).

-  ``Untracked files``: This is a list of files that Git has found in
   the same directory as your repository, but which Git isn’t tracking.

.. warning::

   You may see some automatically generated files in your
   Untracked files section. Files that start with a pound sign (#) or end
   with a tilde should *not* be added to your repository. Files that end
   with a tilde are backup files created by some editors that are intended
   to help you restore your files if your computer crashes. In general,
   files that are automatically generated should not be committed to your
   repository. Other people should be able to generate their own versions,
   if necessary.

So, let’s go ahead and add ``README.md``:

::

   git add README.md

And re-run ``git status``. You should see something like this:

::

    On branch main
    Your branch is up to date with 'origin/main'.

    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
        modified:   README.md

    Untracked files:
      (use "git add <file>..." to include in what will be committed)
        test.txt

.. note::

   When working on CS machines, you should see the message above.
   When using your git on own machine and depending on the version of
   Git you have installed, the message under ``Changes to be
   committed`` may refer to a command called ``git reset`` (instead of
   ``git restore``).

Notice how there is now a new category of files:
``Changes to be committed``. Adding ``README.md`` not only added the
file to your repository, it also staged it into the next commit (which,
remember, won’t happen until you actually run ``git commit``).

If we now add ``test.txt``:

::

   git add test.txt

The output of ``git status`` should now look like this:

::

    On branch main
    Your branch is up to date with 'origin/main'.

    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
        modified:   README.md
        new file:   test.txt

Now, we are going to create a commit with these changes. Notice how we
are not going to use the ``-m`` parameter to ``git commit``:

::

   git commit

When you omit ``-m``, Git will open a terminal text editor where you can
write your commit message, including multi-line commit messages. By
default, the CS machines will use `nano <https://www.nano-editor.org/>`__ for this.
You should see something like this:

::

    # Please enter the commit message for your changes. Lines starting
    # with '#' will be ignored, and an empty message aborts the commit.
    #
    # On branch main
    # Your branch is up to date with 'origin/main'.
    #
    # Changes to be committed:
    #       modified:   README.md
    #       new file:   test.txt
    #


Now, type in the following commit message above the lines that start with ``#``:

::

   Tutorial updates:

   - Added test.txt
   - Updated README.md file

In nano, you can save the file and exit by pressing Control-X, entering "Y" when
prompted to "save modified buffer" (i.e., whether to save the file before exiting),
and then Enter (you will be asked to confirm the filename to save; do not modify this
in any way, just confirm by pressing Enter).

This will complete the commit, and you will see a message like this:

::

    [main 1810c54] Tutorial updates:
     2 files changed, 3 insertions(+), 1 deletion(-)
     create mode 100644 test.txt


.. note::

    If you want to change your default command-line editor, add a line like this:

    ::

       export EDITOR=myfavoriteeditor

    At the end of the ``.bashrc`` file in your home directory (make sure you
    replace ``myfavoriteeditor`` with the command for your favorite
    command-line editor: ``vi``, ``emacs``, ``nano``, ``mcedit``, etc.)

Now, edit ``README.md`` and ``test.txt`` and add an extra line to each of them with the text
``Git is pretty cool``. Running ``git status`` should now show the
following:

::

    On branch main
    Your branch is ahead of 'origin/main' by 1 commit.
      (use "git push" to publish your local commits)

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
        modified:   README.md
        modified:   test.txt


If we want to create a commit with these changes, we could simply run
``git add README.md test.txt``, but this can get cumbersome if we want to
add a lot of files. Fortunately, we can also do
this:

::

   git add -u

This command will add every file that Git is tracking, and will ignore untracked
files. There are a few other shortcuts for adding multiple files, like
``git add .`` and ``git add --all``, but we strongly suggest you avoid them,
since they can result in adding files you did not intend to add to your
repository.

So, if you run ``git add -u`` and create a commit:

::

   git commit -m "A few more changes"

``git status`` will now show this:

::

    On branch main
    Your branch is ahead of 'origin/main' by 2 commits.
      (use "git push" to publish your local commits)

    nothing to commit, working tree clean


The message ``Your branch is ahead of 'origin/main' by 2 commits.`` is
telling you that your local repository contains two commits that have
not yet been uploaded to GitHub. In fact, if you go to your repository
on the GitHub website, you’ll see that the two commits we just created
are nowhere to be seen. As helpfully pointed out by the above output,
all we need to do is run ``git push``, which should show something like
this:

::

    Enumerating objects: 10, done.
    Counting objects: 100% (10/10), done.
    Delta compression using up to 16 threads
    Compressing objects: 100% (6/6), done.
    Writing objects: 100% (8/8), 728 bytes | 728.00 KiB/s, done.
    Total 8 (delta 1), reused 0 (delta 0)
    remote: Resolving deltas: 100% (1/1), done.
    To git@github.com:GITHUB_USERNAME/uchicago-cs-git-tutorial.git
       0c85752..e3f9ef1  main -> main


Now go to GitHub. Do you see the updates in your repository? Click on
“Commits” (above the file listing in your repository). If you click on
the individual commits, you will be able to see the exact changes that
were included in each commit.

Now, ``git status`` will look like this:

::

    On branch main
    Your branch is up to date with 'origin/main'.

    nothing to commit, working tree clean


If you see ``nothing to commit, working tree clean``, that means
that there are no changes in your local repository since the last commit
you created (and, additionally, the above output also tells us that all
our commits have also been uploaded to GitHub)

Working from multiple locations
-------------------------------

So far, you have a local repository in your CS home directory, which you
have been uploading to GitHub using the ``git push`` command. However,
if you work from multiple locations (e.g., on a CS machine but also from
your laptop), you will need to be able to create a local repository in
those locations too. You can do this by running the ``git clone``
command (don’t run this command just yet):

::

   git clone git@github.com:GITHUB_USERNAME/uchicago-cs-git-tutorial.git

This will create a local repository that “clones” the version of the
repository that is currently stored on GitHub.
For the purposes of this tutorial, we'll create this second copy in a
separate directory of the same machine where you've been running Git
commands so far. Open a second terminal window, and run the following:

::

   mkdir -p /tmp/$USER/git-tutorial
   cd /tmp/$USER/git-tutorial
   git clone git@github.com:GITHUB_USERNAME/uchicago-cs-git-tutorial.git

Make sure to replace ``GITHUB_USERNAME`` with your GitHub username!

Take into account that, when you run ``git clone``, the repository is
not cloned *into* the current directory. Instead, a *new* directory
(with the same name as the repository) will be created in the current
directory, and you will need to ``cd`` into it to use Git commands for
that repository.

You now have two local copies of the repository: one in your home
directory (``/home/USER/git-tutorial``), which we will refer to as your
*home* repository for now and one in ``/tmp``
(``/tmp/USER/git-tutorial/uchicago-cs-git-tutorial``) which we will
refer to as your *temp* repository.


Now, switch to the window that is open to your home repository, add a
line to ``test.txt`` with the text ``One more change!``. Create a
commit for that change::

    git commit -m"Adding one more change"

And push it to GitHub (you should know how to
do this by now, but make sure to ask for help if
you’re unsure of how to proceed).

Next, switch to the window that is open to your temp repository, check
if that change appears in the ``test.txt`` file. It will not, because
you have not yet downloaded the latest commits from the
repository. You can do this by running this command:

::

   git pull

This should output something like this:

::

    remote: Enumerating objects: 5, done.
    remote: Counting objects: 100% (5/5), done.
    remote: Compressing objects: 100% (2/2), done.
    remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0
    Unpacking objects: 100% (3/3), 312 bytes | 20.00 KiB/s, done.
    From git@github.com:GITHUB_USERNAME/uchicago-cs-git-tutorial.git
       e3f9ef1..5716877  main       -> origin/main
    Updating e3f9ef1..5716877
    Fast-forward
     test.txt | 3 ++-
     1 file changed, 2 insertions(+), 1 deletion(-)


If you have multiple local repositories (e.g., one on a CS machine and
one on your laptop), it is very important that you remember to run
``git pull`` before you start working, and that you ``git push`` any
changes you make. Otherwise, your local repositories (and the repository
on GitHub) may *diverge* leading to a messy situation called a *merge
conflict* (we discuss conflicts in more detail below). This will be
specially important once you start using Git for its intended purpose:
to collaborate with multiple developers, where each developer will have
their own local repository, and it will become easier for some
developers’ code to diverge from others’.

Discarding changes and unstaging
--------------------------------

One of the benefits of using a version control system is that it is very
easy to inspect the history of changes to a given file, as well as to
undo changes we did not intend to make.

For example, edit ``test.txt`` to remove all its contents. Make sure you
do this in your home repository (``/home/USER/git-tutorial/``)
and not in the temp repository you created earlier.

``git status`` will tell us this:

::

    On branch main
    Your branch is up to date with 'origin/main'.

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
        modified:   test.txt


If we want to discard the changes we made to ``test.txt``, all we have
to do is follow the helpful advice provided by the above output:

::

   git restore test.txt

.. note::

   In older versions of Git, ``git status`` may refer to the ``git checkout`` command.
   In that case, run this command instead::

        git checkout -- test.txt

If you open ``test.txt``, you’ll see that its contents have been
magically restored!

Now, edit ``test.txt`` and ``README.md`` to add an additional line with
the text ``Hopefully our last change...``. Run ``git add -u`` but don’t
commit it just yet. ``git status`` will show this:

::

    On branch main
    Your branch is up to date with 'origin/main'.

    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
        modified:   README.md
        modified:   test.txt


Now, let’s say we realized we want to commit the changes to
``README.md``, but not to ``test.txt``. However, we’ve already told git
that we want to include ``test.txt`` in the commit. Fortunately, we can
“un-include” it (or “unstage” it, in Git lingo) by running this:

::

   git restore --staged test.txt

.. note::

   In older versions of Git, ``git status`` may refer to the ``git reset`` command.
   In that case, run this command instead::

        git reset HEAD test.txt

Now, ``git status`` will show the following:

::

    On branch main
    Your branch is up to date with 'origin/main'.

    Changes to be committed:
      (use "git restore --staged <file>..." to unstage)
        modified:   README.md

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git restore <file>..." to discard changes in working directory)
        modified:   test.txt


Go ahead and commit this change::

   git commit -m"Our last change?"

The commit will now include only ``README.md``.

We're nearing the end of the first part of the tutorial so, before
continuing to the second part of the tutorial, let's make sure all
our changes have been committed and pushed::

    git add -u
    git commit -m"Wrapping up first part of the tutorial"
    git push

Before continuing, make sure ``git status`` shows this::

    On branch main
    Your branch is up to date with 'origin/main'.

    nothing to commit, working tree clean

Looking at the commit log
-------------------------

Once you have made multiple commits, you can see these commits, their
dates, commit messages, author, etc. by typing ``git log``. This command
will open a scrollable interface (using the up/down arrow keys) that you
can get out of by pressing the ``q`` key. As we saw earlier, you can
also see the history of commits through on GitHub’s web interface, but
it is also useful to be able to access the commit log directly from the
terminal, without having to open a browser.

Each commit will have a *commit hash* (usually referred to as the
*commit SHA*) that looks something like this:

::

   9119c6ffcebc2e3540d587180236aaf1222ee63c

This is a unique identifier that we can use to refer to that commit
elsewhere. For example, choose any commit from the commit log and run
the following:

::

   git show COMMIT_SHA

Make sure to replace ``COMMIT_SHA`` with a commit SHA that appears in
your commit log.

This will show you the changes that were included in that commit. The
output of ``git show`` can be a bit hard to parse at first but the most
important thing to take into account is that any line starting with a
``+`` denotes a line that was added, and any line starting with a ``-``
denotes a line that was removed.

Pro tip: in any place where you have to refer to a commit SHA, you can
just write the first few characters of the commit SHA. For example, for
commit ``9119c6ffcebc2e3540d587180236aaf1222ee63c`` we could write just
this:

::

   git show 9119c6f

Git will only complain if there is more than one commit that starts with
that same prefix.


Acknowledgements
----------------

Parts of this tutorial are based on a Git lab originally written for CMSC 12100
by Prof. Anne Rogers, and edited by numerous TAs over the years.