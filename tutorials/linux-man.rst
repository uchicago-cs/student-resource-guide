.. _linux-man:

Lunix Basics Tutorial - Man Pages
=================================

This tutorial is an extension of :ref:`Introduction to Linux <tutorial-linux-intro>`.
For exercises, make sure you have completed this tutorial before proceeding.

In this tutorial you will learn how to use
the terminal to perform some basic operations in Linux, including how to:

#. Read a man page

For more check out:
#. :ref:`Edit, Compile, and Run a Program <linux-compile-and-run>`
#. :ref:`Linux Tips and Tricks <linux-tip-tricks>`

What is needed for this tutorial?
----------------------------------
This section assumes you have completed :ref:`Introduction to Linux <tutorial-linux-intro>`.

Open the terminal and use ``pwd``, ``ls``, and ``cd`` to explore the tutorial files and to
navigate to the ``linux-tutorial-files`` directory. The next examples
will assume that your current directory is the ``linux-tutorial-files`` directory.

In the remaining sections, we will introduce a new concept or skill
in each section, and will provide a few simple examples. In fact, we show many
examples of sample output throughout the tutorial. Bear in mind that the
output you see when you run through our examples may vary a bit; this is normal.
We have also included a few exercises in each section so you can practice
those skills.

Man Pages
---------

A man page (short for manual page) documents or describes topics related to working with Linux. These topics include specific Linux programs, certain programming functions, standards, and conventions, and abstract concepts.

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

The next tutorial in Linux Basics is #. :ref:`Linux Tips and Tricks <linux-tip-tricks>`.

Acknowledgments
----------------

Parts of this tutorial are based on a Linux lab originally written for CMSC 12100
by Prof. Anne Rogers and Prof. Borja Sotomayor, and edited by numerous instructors
and TAs over the years.
