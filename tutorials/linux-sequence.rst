.. _linux-sequence:

Linux Tutorial - Running Commands Sequentially
===============================================

.. note::
   
   This section assumes you have :ref:`picked up the tutorial
   materials <tutorial-materials>` and that you have a :ref:`terminal
   window open <terminal>` to your  ``linux-tutorial-files`` directory.

In this section of the tutorial you will learn how to run commands
sequentially.

It is often convenient to chain together commands that you want to run in sequence.
For example, recall that to print the working directory and list all of
the files and directories contained inside, you would use the following commands::

        $ pwd
        /home/username/
        $ ls
        Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos

You could also run them together by separating them with a semicolon, like so::

        $ pwd ; ls
        /home/username/
        Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos

First, ``pwd`` is executed and run to completion, and then ``ls`` is executed and
run to completion. The two examples above are thus equivalent, but the ability to
run multiple commands together is a small convenience that could save you some time
if there is a group of commands that you want to execute sequentially.


.. note::

    What actually acts as a separator between the comments is the semicolon,
    and the shell is generally pretty flexible about the amount of white space separating commands,
    arguments, etc., so it will run any of the following as well::

        $ pwd;ls
        $ pwd ;ls
        $ pwd; ls
        $ pwd       ;        ls


This tutorial covers a few advanced topics related to using a Linux environment.
These topics are typically not essential to perform basic tasks in a Linux environment,
but some classes may assume that you are familiar with the topics covered in this
tutorial.

If you skipped other tutorials make sure to pick up materials in `Introduction to Linux <tutorial-materials>` before proceeding.

You have finished the section on running commands sequentially.  Please
move on to the next section required by your instructor.
	
