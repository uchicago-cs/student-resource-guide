.. _tutorial-linux-intro:

Lunix Tutorial - Introduction To Linux
======================================

Linux is an operating system, just like Windows and MacOS. It allows
you (the user) to interact with your computer, and provides many
of the same tools you're accustomed to in Windows and MacOS (web
browsers, word processors, etc.).

In almost all CS classes, instructors will assume that you know your
way around a Linux environment, and may require that you compile and
run code in a Linux system. While there are many things you'll
be able to do from a Linux desktop environment, it is also important
that you be come comfortable using the *terminal*, a command-line
interface for interacting with the filesystem, running programs, etc.

In this tutorial you will learn how to use
the terminal to perform some basic operations in Linux, including how to:

#. Use basic terminal commands
#. Navigate a UNIX filesystem

Please complete all tutorial sections relevant to your course.

Other tutorials include:
#. :ref:`Edit, Compile, and Run a Program <linux-compile-and-run>`
#. :ref:`Man Pages <linux-man>`
#. :ref:`Linux Tips and Tricks <linux-tip-tricks>`
#. :ref:`Running Commands Sequentially <linux-sequence>`
#. :ref:`Working with Input/Output Streams <linux-input-output>`
#. :ref:`File Permissions <linux-permissions>`


Where should you do this tutorial?
----------------------------------

Since one of the goals of this tutorial is for you to be able to use
the CS department's Linux environment, we strongly suggest you work
through this tutorial on a :ref:`UChicago CS software environment <software-environment>`.
While you can work through the tutorial in one of our computer labs,
we recommend :ref:`using SSH <ssh>` to log into a CS Linux server from
your personal computer, as this will likely be the primary way you'll
be interacting with the CS department's Linux systems.

It should also be possible for you to work through this
tutorial in other UNIX environments, such as the MacOS terminal
or `Ubuntu WSL <https://ubuntu.com/wsl>`__ on Windows, but we
recommend against it, since you should try to become familiar
specifically with the Linux environment provided by the CS department.



Terminal/Shell
--------------

On your personal computer, you probably navigate your hard drive by
double clicking on icons. While convenient for simple tasks, this
approach is limited. For example, imagine that you want to delete all of
the music files over 5 MB that you haven't listened to in over a
year. This task is very hard to do with the standard double-click
interface but is relatively simple using the terminal.

If you are using SSH, connecting to a CS Linux server will directly
open a terminal for you.

If you are using a desktop environment (e.g., you are sitting in CSIL
or you're using the Virtual Desktop), you can start a terminal by
clicking on the Application icon (3x3 grid of dots) at the bottom left of
the screen:

.. figure:: ubuntu-3x3.png
   :alt: Application icon in Ubuntu

Then, type "terminal" in the input box. Click the "terminal"
icon to open a terminal window.  You can also use the keyboard shortcut: ``Ctrl+Alt+t.``

Regardless of how you open the terminal, you will see something
like this::

    username@computer:~$

where ``username`` has been replaced by your CNetID and ``computer``
is the name of the machine you happen to be using.  This string is
called the *prompt*.  When you start typing, the characters you type
will appear to the right of the ``$``.

The program that runs within a terminal window and processes the
commands the you type is called a *shell*.  We use ``bash``, which is
the default shell on most Linux distributions, but there are other
popular shells, such as ``ksh``, ``tcsh``, etc.

In the remaining sections, we will introduce a new concept or skill
in each section, and will provide a few simple examples. In fact, we show many
examples of sample output throughout the tutorial. Bear in mind that the
output you see when you run through our examples may vary a bit; this is normal.
We have also included a few exercises in each section so you can practice
those skills.

Navigating the File System
--------------------------

Files in Linux are stored in directories/folders, just like in
macOS/Windows. Directories can hold files or other subdirectories and
there are special directories for your personal files, your Desktop,
etc.:

+------------------+------------------+-------------------+----------------------------------------+
| Name             | Linux            | Mac               | Windows                                |
+==================+==================+===================+========================================+
| Root directory   | /                | /                 | C:\\                                   |
+------------------+------------------+-------------------+----------------------------------------+
| Home directory   | /home/username   | /Users/username   | C:\\Documents and Settings\\username   |
+------------------+------------------+-------------------+----------------------------------------+

.. image:: filesystem.username.svg
   :align: center
   :width: 650
   :height: 250

The figure above illustrates how Linux organizes the file system. Your
own computer might have a slightly different organization
(e.g., you might replace ``/`` with ``C:``), but the idea is the
same.

For the above and from this point forward, consider that the text
"username" is replaced with your own actual username, which is just
your CNetID.

.. note::

    If you are connected to a CS machine, either because you're physically sitting
    at a CSIL machine or have logged in remotely via SSH or the Remote Desktop,
    that machine is connected to a *network file system*. 
    
    This means that there is effectively
    one very large hard drive shared by all the CS machines. As a result you
    will have access to those files regardless of what machine you use.

    For example, if you create some files while logged into a CSIL machine,
    and then sit at a different CSIL machine the next day (or SSH into the CS Linux servers),
    you will have acess to the exact same files there.


Show Files
~~~~~~~~~~

The terminal will start in your home directory, ``/home/username/``,
which is a special directory assigned to your user account. Any CS
machine that you use (either in CSIL or remotely) will automatically
connect to your home directory and all files that you created or
changed in previous work sessions will be available to you.

Two very useful commands are ``pwd`` and ``ls``:

+---------+--------------------------------------------------------------+
| ``pwd`` | Prints your current working directory - tells you where you  |
|         | are in your directory tree.                                  |
+---------+--------------------------------------------------------------+
| ``ls``  | Lists all of the files in the current directory.             |
+---------+--------------------------------------------------------------+

The following is an example using these two commands in a terminal window::

    username@computer:~$ pwd
    /home/username/
    username@computer:~$ ls
    cs   html
    username@computer:~$

Try these commands yourself to verify that everything looks similar.

Notice that the directory path and list of files that you see if you
open your home folder graphically are identical to those provided by
``pwd`` and ``ls``, respectively. The only difference is how you get
the information, how the information is displayed, and how easy it is
to write a script that, say, processes all the Python files in a
directory.

Change Directory
~~~~~~~~~~~~~~~~

+-------------------+--------------------------------------------------------------+
|``cd <path-name>`` |     change to the directory path-name                        |
+-------------------+--------------------------------------------------------------+
|  ``cd ..``        |            move up/back one directory                        |
+-------------------+--------------------------------------------------------------+
|   ``cd``          |             move to your home directory                      |
+-------------------+--------------------------------------------------------------+
|   ``cd -``        |             move to the previous directory you were in       |
+-------------------+--------------------------------------------------------------+

How can we move around in the file system? If we were using a
graphical system, we would double click on folders and occasionally
click the "back" arrow. In order to change directories in
the terminal, we use ``cd`` (change directory) followed by the name of
the destination directory. (A note about notation: we will use text
inside angle brackets, such as ``<path-name>`` as a place holder.  The
text informally describes the type of value that should be supplied.
In the case of ``<path-name>``, the desired value is the path-name for
a file or directory.  More about path-names later.)  For example if we want to
change to the ``cs`` directory, we type the following in the
terminal::

    username@computer:~$ cd cs

Here is an example of changing to the ``cs`` directory in the terminal.
We use ``pwd`` and ``ls`` to verify where we are and where we can go::

    username@computer:~$ pwd
    /home/username/
    username@computer:~$ ls
    cs  html
    username@computer:~$ cd cs
    username@computer:~/cs$ pwd
    /home/username/cs/
    username@computer:~/cs$ ls

    username@computer:~/cs$

Notice that after we ``cd`` into the ``cs`` the command ``pwd`` now
prints out::

    /home/username/cs/

rather than::

    /home/username/

In the beginning, there are no files in the ``cs`` directory, which is
why the output of ``ls`` in this directory is empty.

We can move up one step in the directory tree (e.g., from
``/home/username/cs`` to ``/home/username`` or from
``/home/username`` to ``/home``) by typing ``cd ..`` Here "up" is
represented by "``..``" In this context, this command will move us up
one level back to our home directory::

    username@computer:~/cs$ pwd
    /home/username/cs/
    username@computer:~/cs$ cd ..
    username@computer:~$ pwd
    /home/username/

Notice that the current working directory is also shown in the prompt string.

+-------------------+--------------------------------------------------------------+
| ``~``             |         shortcut for your home directory                     |
+-------------------+--------------------------------------------------------------+
| ``.``             |         shortcut for the current working directory           |
+-------------------+--------------------------------------------------------------+
| ``..``            |shortcut for one level up from your current working directory |
+-------------------+--------------------------------------------------------------+

The tilde (~) directory is the same as your home directory: that is, ``~`` is shorthand for ``/home/username``.  Here's another useful shorthand: a single dot (``.``) refers to the current directory.

Usually when you use ``cd``, you will specify what is called a
*relative* path, that is, you are telling the computer to take you to
a directory where the location of the directory is described relative
to the current directory. The only reason that the computer knows that
we can ``cd`` to ``cs`` is because ``cs`` is a folder within
the ``/home/username`` directory.  But, if we use a ``/`` at the
*beginning* of our path, we are specifying an absolute path or one
that is relative to the the "root" or top of the file system.  For
example::

        username@computer:~$ pwd
        /home/username/
        username@computer:~$ cd /home/username/cs
        username@computer:~/cs$ pwd
        /home/username/cs
        username@computer:~/cs$ cd /home/username
        username@computer:~$ pwd
        /home/username

These commands achieve the same thing as the ones above: we ``cd``
into ``cs``, a folder within our home directory, and then back to
our home directory.  Paths that start with a ``/`` are known as
*absolute paths* because they always lead to the same place,
regardless of your current working directory.

Running ``cd`` without an argument will take you back to your home
directory without regard to your current location in the file system.
For example::

    username@computer:~/cs$ cd
    username@computer:~$ pwd
    /home/username

Finally, running ``cd -`` will take you to the previous directory you
were in. For example, suppose we go into the ``cs`` directory and,
from there, switch to the ``html`` directory. If we wanted to
go back to the ``cs`` directory, we can just write ``cd -``::

        username@computer:~$ cd cs
        username@computer:~/cs$ cd ../html
        username@computer:~/html$ cd -
        username@computer:~/cs$ pwd
        /home/username/cs


To improve the readability of our examples, we will use ``$`` as the
prompt rather than the full text ``username@computer:~$`` in the rest
of this tutorial.  Keep in
mind, though, that the prompt shows your current working directory.

.. _tutorial-materials:

Pick Up the Tutorial Materials
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the remainder of this tutorial, we will need a series of files that you
will use in certain examples and exercises. To fetch these files,
run the following commands::

    $ cd
    $ wget -nv https://uchicago-cs.github.io/student-resource-guide/_static/linux-tutorial-files.zip
    $ unzip linux-tutorial-files.zip

After you run these commands, your home directory will contain a
``linux-tutorial-files`` directory that has some files
for us to play with. You will learn how to manipulate these files in
the next section.

Exercises
^^^^^^^^^

Use ``pwd``, ``ls``, and ``cd`` to explore the tutorial files and to
navigate to the ``linux-tutorial-files`` directory. The next examples
will assume that your current directory is the ``linux-tutorial-files`` directory.


.. _useful_commands:

Useful commands
~~~~~~~~~~~~~~~

+---------------------------------+----------------------------------------------+
|   ``cp`` <source> <destination> | copy the source file to the new destination  |
+---------------------------------+----------------------------------------------+
|   ``mv`` <source> <destination> | move the source file to the new destination  |
+---------------------------------+----------------------------------------------+
|    ``rm`` <file>                | remove or delete a file                      |
+---------------------------------+----------------------------------------------+
|    ``mkdir`` <directoryname>    | make a new empty directory                   |
+---------------------------------+----------------------------------------------+
|    ``cat`` <path-name>          | print the contents of a file to the terminal |
+---------------------------------+----------------------------------------------+

Sometimes it is useful to make a copy of a file. To copy a file, use
the command::

    cp <source> <destination>

where ``<source>`` is replaced by the name of the file you want to
copy and ``<destination>`` is replaced by the desired name for the
copy. An example of copying the file ``test.txt`` to ``copy.txt`` is
below::

    $ cp test.txt copy.txt

``<destination>`` can also be replaced with a path to a directory.  In
this case, the copy will be stored in the specified directory and will
have the same name as the source.

Move (``mv``) has exactly the same syntax, but does not keep the
original file. Remove (``rm``) will delete the file from your
directory.

If you want to copy or remove an entire directory along with its
files, the normal ``cp`` and ``rm`` commands will not work. Use ``cp -r`` instead of ``cp`` or ``rm -r``  instead of ``rm`` to copy or remove directories (the ``r`` stands for "recursive").

.. warning::

    Running ``rm -r`` cannot be undone. If you want to remove the entire contents
    of a directory, make sure you're certain *before* you use ``rm -r`` that you want to remove
    *everything* in the named directory.

Some useful terminology: the ``-r`` argument in ``cp -r`` or ``rm -r`` is known as a *flag*.  Flags help determine the behavior of a program.  In this case, the flag allows ``cp`` and ``rm`` to work with a directory tree, rather than just a single file. Most commands can accept a number
of different flags; :ref:`Man Pages <linux-man>`, shows how to look up the documentation for
specific commands, where we will be able to see the list of supported flags in each command.

You can make a new directory with ``mkdir <directoryname>``, where
the placeholder ``<directoryname>`` is replaced with the desired name for the new directory.

Sometimes, we may want to take a look at the contents of a file from the terminal, without
opening the file in an editor. We can do this with the ``cat`` command. For example::

    $ cat test.txt
    Linux Tutorial - Test file
    ==========================

    Name: Firstname Lastname

In :ref:`Edit, Compile, and Run <linux-compile-and-run>` you will learn how to edit these files.

Exercises
^^^^^^^^^

Try the following tasks to practice and check your understanding of
these terminal commands.

1. Copy ``test.txt`` to ``copy.txt`` and use ``ls`` to ensure that both files exist.

2. Move the file ``copy.txt`` to the name ``copy2.txt``. Use ``ls`` to
   verify that this command worked.

3. Make a new directory named ``backups`` using the ``mkdir`` command.

4. Copy the file ``copy2.txt`` to the ``backups`` directory.

5. Verify that step (4) was successful by listing the files in the
   ``backups`` directory.

6. Now that we have a copy of ``test.txt`` in the ``backups`` directory we
   no longer need ``copy2.txt``. Remove the file ``copy2.txt`` in the ``linux-tutorial-files``
   directory.

7. Print the contents of the ``hello.py`` file.


It can be tedious (and, when you are tired, challenging) to spell
directory or file names exactly, so the terminal provides an
auto-complete mechanism to guide you through your folder
explorations. To access this functionality simply start typing
whatever name you are interested in the context of a command and then
hit tab. If there is only one way to finish that term hitting tab will
fill in the rest of the term, for instance, if we typed ``ls b`` and
then hit tab it would automatically finish the word ``ls backups`` and
then await our hitting enter. If there is MORE than one way to finish
a term, like if we had another folder called ``backups-old``, then
hitting tab twice will cause the terminal to display all of the
options available.

Training yourself to use auto-completion (aka tab completion) will save
you time and reduce the inevitable frustration that arises from
mistyping filenames when you are tired or distracted.

Wild Cards (using an asterisk)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sometimes when we enter a string, we want part of it to be variable, or a wildcard. A common task is to list all files that end with a given extension, such as ``.txt``.  The wildcard functionality, through an asterisk, allows us to simply say::

    $ ls *.txt

The wildcard can represent a string of any length consisting of any characters - including the empty string.

It is important to be **careful** using wildcards, especially for commands like ``rm`` that cannot be undone. A command like::

    $ rm *             ### DO NOT RUN THIS COMMAND!

will delete **all** of the files in your working directory!

FYI, the text that follows a ``#`` on the linux command-line is
treated as a comment and is ignored.

Exercises
^^^^^^^^^

#. Navigate to your home directory.  What do you see when you run ``ls linux-tutorial*``?  What about ``ls linux-tutorial*/*.py``?
