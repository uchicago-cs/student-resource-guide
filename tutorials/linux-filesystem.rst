.. _linux-file-system:

Linux Tutorial - Navigating the filesystem
==========================================

.. note::
   
   This section assumes you have :ref:`picked up the tutorial
   materials <tutorial-materials>` and have a :ref:`terminal window
   open <terminal>` to your home directory.

Files in Linux are stored in directories/folders, just like in
macOS/Windows. Directories can hold files or other subdirectories and
there is a special directory---your home directory---for your personal
files:

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

We think of the file system as a tree. It is traditional to draw
the tree with the root of the file system at the top.  We can also think of
each directory and the files and subdirectories that it contains as a
tree.

For the above and from this point forward, consider that the text
"username" is replaced with your own actual username, which is just
your CNetID.

.. note::

    If you are connected to a CS machine, either because you're
    physically sitting at a CSIL machine or have logged in remotely
    via SSH, that machine is connected to a *network file system*.
    
    A network filesystem is logically one very large hard drive shared
    by all the CS machines. As a result, you will have access to your
    home directory and its contents regardless of what machine you
    use.

    For example, if you create some files while logged into a CSIL machine,
    and then sit at a different CSIL machine the next day (or SSH into the CS Linux servers),
    you will have acess to the exact same files on the new machine.


Show Files
~~~~~~~~~~

As noted in the section on :ref:`opening a terminal window
<terminal>`, you will be in your home directory when you open a
terminal window.

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
    cs  html  linux-tutorial-files
    username@computer:~$

Try these commands yourself to verify that everything looks similar.

The directory path and the list of files that you would see if you opened
your home folder graphically are identical to those provided by
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
change to the ``html`` directory, we type the following in the
terminal::

    username@computer:~$ cd html

Here is an example of changing to the ``html`` directory in the terminal.
We use ``pwd`` and ``ls`` to verify where we are and where we can go::

    username@computer:~$ pwd
    /home/username/
    username@computer:~$ ls
    cs  html  linux-tutorial-files
    username@computer:~$ cd html
    username@computer:~/html$ pwd
    /home/username/html/
    username@computer:~/html$ ls

    username@computer:~/html$

Notice that after we ``cd`` into the ``html`` the command ``pwd`` now
prints out::

    /home/username/html/

rather than::

    /home/username/

In the beginning, there are no files in the ``html`` directory, which is
why the output of ``ls`` in this directory is empty.

We can move up one step in the directory tree (e.g., from
``/home/username/html`` to ``/home/username`` or from
``/home/username`` to ``/home``) by typing ``cd ..`` Here "up" is
represented by "``..``" In this context, this command will move us up
one level back to our home directory::

    username@computer:~/html$ pwd
    /home/username/html/
    username@computer:~/html$ cd ..
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
we can ``cd`` to ``html`` is because ``html`` is a folder within
the ``/home/username`` directory.  But, if we use a ``/`` at the
*beginning* of our path, we are specifying an absolute path or one
that is relative to the the "root" or top of the file system.  For
example::

        username@computer:~$ pwd
        /home/username/
        username@computer:~$ cd /home/username/html
        username@computer:~/html$ pwd
        /home/username/html
        username@computer:~/html$ cd /home/username
        username@computer:~$ pwd
        /home/username

These commands achieve the same thing as the ones above: we ``cd``
into ``html``, a folder within our home directory, and then back to
our home directory.  Paths that start with a ``/`` are known as
*absolute paths* because they always lead to the same place,
regardless of your current working directory.

Running ``cd`` without an argument will take you back to your home
directory without regard to your current location in the file system.
For example::

    username@computer:~/html$ cd
    username@computer:~$ pwd
    /home/username

Finally, running ``cd -`` will take you to the previous directory you
were in. For example, suppose we go into the ``html`` directory and,
from there, switch to the ``linux-tutorial-files`` directory. If we wanted to
go back to the ``html`` directory, we can just write ``cd -``::

        username@computer:~$ cd html
        username@computer:~/html$ cd ../linux-tutorial-files
        username@computer:~/linux-tutorial-files$ cd -
        username@computer:~/html$ pwd
        /home/username/html


To improve the readability of our examples, we will use ``$`` as the
prompt rather than the full text ``username@computer:~$`` in the rest
of this tutorial.  Keep in mind, though, that the prompt shows your
current working directory.

Exercises
^^^^^^^^^

Use ``pwd``, ``ls``, and ``cd`` to navigate to your
``linux-tutorial-files`` directory and explore the tutorial files. Subsequent
examples will assume that your current directory is the ``linux-tutorial-files`` directory.


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

    Running ``rm`` cannot be undone. If you want to remove the entire contents
    of a directory, make sure you're certain *before* you use ``rm -r`` that you want to remove
    *everything* in the named directory.

Some useful terminology: the ``-r`` argument in ``cp -r`` or ``rm -r`` is known as a *flag*.  Flags help determine the behavior of a program.  In this case, the flag allows ``cp`` and ``rm`` to work with a directory tree, rather than just a single file. Most commands can accept a number
of different flags; the :ref:`Man Pages <linux-man>` section explains how to look up the documentation for
specific commands, including the list of supported flags in each command.

You can make a new directory with ``mkdir <directoryname>``, where
the placeholder ``<directoryname>`` is replaced with the desired name for the new directory.

Sometimes, we may want to take a look at the contents of a file from the terminal, without
opening the file in an editor. We can do this task with the ``cat`` command. For example::

    $ cat test.txt
    Linux Tutorial - Test file
    ==========================

    Name: Firstname Lastname

For larger files, you may want to use the ``less`` command, which
allows you to look at a file one screen-full at a time.

In :ref:`Edit, Compile, and Run <linux-compile-and-run>`, you will see a couple of ways to edit files.

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

6. Now that we have a copy of ``test.txt`` in the file named ``copy2.txt`` in the ``backups`` directory we
   no longer need ``copy2.txt`` in ``linux-tutorial-files``. Remove the file ``copy2.txt`` from the ``linux-tutorial-files``
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

Sometimes when we enter a string, we want part of it to be variable, or a wildcard. For example,  listing all files that end with a given extension, such as ``.txt``, is a common task.  The wildcard functionality, through an asterisk, allows us to simply say::

    $ ls *.txt

The wildcard can represent a string of any length consisting of any characters, including the empty string.

It is important to be **careful** using wildcards, especially for commands like ``rm`` that cannot be undone. A command like::

    $ rm *             ### DO NOT RUN THIS COMMAND!

will delete **all** of the files in your working directory!

Note that text following a ``#`` on the linux command-line is
treated as a comment and is ignored.

Exercises
^^^^^^^^^

#. Navigate to your home directory.  What do you see when you run ``ls linux-tutorial*``?  What about ``ls linux-tutorial*/*.py``?

You have finished the section on navigating the file system.  Please
move on to the next section required by your instructor.
