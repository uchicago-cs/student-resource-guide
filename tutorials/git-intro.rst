.. _tutorial-git-intro:

Git Tutorial - Introduction to Git
==================================

In many of your CS classes, you will use a system called Git to manage code. 
In a nutshell, you can think of Git as a system for tracking changes to your code, storing your code on a remote server, 
sharing your code with the course staff, and, eventually, in later courses, internships, and jobs, for working collaboratively with others.

More specifically, Git is a version control system that tracks your
files as well as changes that you made to those files. While you may
already be familiar with software, such as Microsoft Word, that allows
you to revert to earlier versions, Git is a tool that lets you group a
set of related changes-- adding a feature, fixing a bug, etc.-- into a
single *commit*. A commit is a checkpoint that represents all of the
changes made since the previous checkpoint. This mechanism makes it
possible to look at and even revert to older versions of a file (or
collection of files) by going back to your code as it was when you
“checkpointed” it with a commit.  These commits, along with your
actual files make up a *repository*.

In this tutorial, you will learn how to:

#. set up your local Git configuration,
#. create and work with a local Git repository, 
#. set up your account on GitHub, a web-based hosting service,
#. link a local repository with a remote repository on GitHub,
#. work from multiple locations,
#. use Git to work collaboratively, 
#. work with multiple branches,
#. merge different branches, and
#. handle the kinds of conflicts that arise when multiple people work on the same repository.

The different sections build upon each other, so please plan to
complete them in the order listed.  The last few topics are fairly
advanced and are not relevant to all students.  Please check the
instructions you received from your instructor(s) to determine which
sections you need to complete.

Where to Run This Tutorial
--------------------------

This tutorial needs to be completed on a CS Linux server.  If you are
not already logged in, open a terminal window and log into one of CS
Linux servers using SSH.  (If your course has a bank of servers
assigned to it, make sure to use your assigned server.)  More
information on SSH can be found in the `Remote SSH Access <https://uchicago-cs.github.io/student-resource-guide/environment/ssh.html>`__ tutorial.

Once you are logged in to your CS Linux server run::

  $ cd

to ensure that you are in your home directory. (Recall that we use
``$`` to indicate work to be done at the Linux command line.)

Configuring Git
---------------

Before creating your first repository, it is a good idea to register
your name and email address with Git using the following commands::

  $ git config --global user.name "YOUR NAME"
  $ git config --global user.email "YOUR UCHICAGO EMAIL ADDRESS"

Replace ``"YOUR NAME"`` with your name in quotes in the first command
and ``"YOUR UCHICAGO EMAIL ADDRESS"`` with your UChicago email address
in quotes in the second command.

Git stores this information in a hidden file named ``.gitconfig`` in your
home directory. You can see the contents of this file using the command::

  $ cat .gitconfig

or you can run the command::

  $ git config --list

The output from this command may include a few other values. You can
ignore them.

Verify that your name (``user.name``) and email address
(``user.email``) are correct.  If you mistyped your name or email
address, you can rerun the appropriate ``git config`` command with the
correct information.

Once the values are set correctly, you will not need to run these
commands again on the CS Linux machines.


.. _tutorial-git-materials:

Getting The Tutorial Materials
------------------------------

To get the materials you will use for this tutorial, run::

  $ wget -nv https://uchicago-cs.github.io/student-resource-guide/_static/git-tutorial.zip
  $ unzip git-tutorial.zip

The first command, ``wget``, downloads a compressed directory (aka,
folder) from the web. The second, ``unzip``, decompresses it.

Once you have completed these commands, you should have a directory
named ``git-tutorial``.  In your terminal window, navigate to the
``git-tutorial`` directory using ``cd``::

  $ cd git-tutorial

and run ``ls`` to view the contents of the directory. It should
contain two files: ``hello.py``, and ``hola.py``.  The first is a
simple Python program to print a few greetings in English.  The second
is a simple Python program to print the same greetings in Spanish.

The `next section of the tutorial <tutorial-git-local>`_ covers
creating and working with a local Git repository.

**Acknowledgments**: This tutorial is based, in part, on lecture notes
prepared by Borja Sotomayor, and in part, based on a Git lab
originally written for CMSC 12100 by Anne Rogers, and improved by
numerous TAs over the years.  The content in
:ref:`<tutorial-git-branches>` section is based on materials
originally written by Isha Mehrotra (SB'19) for CMSC 22000.
