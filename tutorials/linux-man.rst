.. _linux-getting-help:

Linux Tutorial - Getting Help
=============================

There are a number of ways to get help using command-line applications from within the terminal itself:

* ``--help`` flag
* ``tldr`` command
* ``man`` pages

``--help``
~~~~~~~~~~

Many commands have a ``--help`` flag that can be passed after the command name. ``pwd`` for example::

   $ pwd --help
   pwd: pwd [-LP]
       Print the name of the current working directory.
    
       Options:
         -L        print the value of $PWD if it names the current working
                   directory
         -P        print the physical directory, without any symbolic links
    
       By default, `pwd' behaves as if `-L' were specified.
    
       Exit Status:
       Returns 0 unless an invalid option is given or the current directory
       cannot be read.



This will often give helpful reminders about flags and options.

tldr
~~~~

The CS Linux servers also have a program called ``tldr`` installed.

This program gives a selection of examples of common behaviors. It isn't comprehensive, but can often give a quick answer when you are trying to remember how to perform a particular task.

To get the tldr page for a Linux command, you can type::

    tldr <command name>

For example::

    $ tldr ls

    List directory contents.
    More information: <https://www.gnu.org/software/coreutils/ls>.

    List files one per line:

        ls -1

    List all files, including hidden files:

        ls -a

    List all files, with trailing `/` added to directory names:

        ls -F

    Long format list (permissions, ownership, size, and modification date) of all files:

        ls -la

    Long format list with size displayed using human-readable units (KiB, MiB, GiB):

        ls -lh

    Long format list sorted by size (descending) recursively:

        ls -lSR

    Long format list of all files, sorted by modification date (oldest first):

        ls -ltr

    Only list directories:

        ls -d */

man pages
~~~~~~~~~

A man page (short for manual page) documents or describes topics related to working with Linux.
These topics include specific Linux programs, certain programming functions, standards, and conventions, and abstract concepts. Information provided by a man page can include what flags and arguments can be utilized with a command (we discussed flags and arguments when learning how to :ref:`navigate the filesystem <linux-file-system>`).

Man pages are the most comprehensive form of help, but also the most verbose. In this section of the tutorial you will learn how to access and read man pages. Learning how to read a man page takes time and is a skill you will develop with practice.

To get the man page for a Linux command, you can type::

    man <command name>

So in order to get the man page for ``ls``, you would type::

    $ man ls

This command displays a man page that gives information on the ``ls`` command, including a description of the command, a list of the flags it supports, instructions on how to use it, and other information.

Each man page has a description. The ``-k`` flag for ``man`` allows you to search these descriptions using a keyword. For example::

    $ man -k printf

This searches all the descriptions for the keyword ``printf`` and prints the names of the man pages with matches.

Learning how to read man pages is an important skill.

Exercise
~~~~~~~~

By default, the ``ls`` command does not include files with names that start with a dot (``.``).
The ``linux-tutorial-files`` directory contains a file that starts with a dot.  Use ``man`` to identify the flag to use with ``ls`` to include this file when listing the contents of ``linux-tutorial-files``.


You have finished the section on getting help.

If you have been referred to this tutorial as part of a class you
are taking, please move on to the next section required by your instructor.
