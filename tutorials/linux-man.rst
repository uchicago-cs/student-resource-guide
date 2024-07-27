.. _linux-man:

Linux Tutorial - Man Pages
==========================

In this section of the tutorial you will learn how to use
the terminal to perform some basic operations in Linux, including how to:

#. Read a man page

Man Pages
---------

A man page (short for manual page) documents or describes topics related to working with Linux and helps give insights into Linux based tools. 
These topics include specific Linux programs, certain programming functions, standards, and conventions, and abstract concepts.
Information provided by a man page can include what flags and arguments can be utilized with a command. 
More information about flags and arguments can be found in `Intro to Linux - Useful Commands <useful_commands>`.

Learning how to read a man page takes time and is a skill you will develop with practice.

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


You have finished the section on manual pages.

If you have been referred to this tutorial as part of a class you
are taking, please move on to the next section required by your instructor.