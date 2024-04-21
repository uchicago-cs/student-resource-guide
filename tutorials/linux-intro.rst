.. _tutorial-linux-intro:

Lunix Tutorial - Introduction To Linux
======================================

Linux is an operating system, just like Windows and MacOS. It allows
you (the user) to interact with your computer, and provides many
of the same tools you're accustomed to in Windows and MacOS (web
browsers, word processors, etc.).

In almost all CS classes, instructors will assume that you know your
way around a Linux environment, and may require that you compile and
run code in a Linux system.  Being comfortable using the *terminal*, a command-line
interface for interacting with the filesystem, running programs, etc, is an
important part knowing your way around Linux.

In this tutorial you will learn how to:

#. :ref:`Open a terminal window <terminal>`
#. :ref:`Navigate the filesystem <linux-file-system>`
#. :ref:`Edit, Compile, and Run a Program <linux-compile-and-run>`
#. :ref:`Use Man Pages <linux-man>`
#. :ref:`Use Keyboard Shortcuts  <linux-tip-tricks>`
#. :ref:`Run Commands Sequentially <linux-sequence>`
#. :ref:`Work with Input/Output Streams <linux-input-output>`
#. :ref:`Understand and Set File Permissions <linux-permissions>`

Everyone should work through the first part, even students with prior
experience with Linux, since it explains how to pick up the materials
you will need to complete subsequent parts.

As for the rest of the tutorial, you are welcome to complete all the
sections, but only some will be relevant for your current course(s).
Check the instructions you received from your instructor(s) to
determine which sections you need to complete.


Where should you do this tutorial?
----------------------------------

Since one of the goals of this tutorial is for you to be able to use
the CS department's Linux environment, we strongly suggest you work
through this tutorial on a :ref:`UChicago CS software environment <software-environment>`.
While you can work through the tutorial in one of our computer labs,
we recommend :ref:`using SSH <ssh>` to log into a CS Linux server from
your personal computer, as this will likely be the primary way you'll
be interacting with the CS department's Linux systems.

Many of the steps in this tutorial can be replicated on a MacOS system
or using `Ubuntu WSL <https://ubuntu.com/wsl>`__ on Windows.
While eventually you'll be able to reuse these skills in those
environments, for now, we **strongly** recommend that you use the
Linux environment provided by the CS department.

.. _terminal:

Opening a Terminal Window
-------------------------

On your personal computer, you probably navigate your hard drive by
double clicking on icons. While convenient for simple tasks, this
approach is limited. For example, imagine that you want to delete all of
the music files over 5 MB that you haven't listened to in over a
year. This task is very hard to do with the standard double-click
interface but is relatively simple using the terminal.

If you are using SSH, connecting to a CS Linux server will directly
open a terminal for you.

If you are using a desktop environment (e.g., you are sitting in
CSIL), you can start a terminal by clicking on the Application icon
(3x3 grid of dots) at the bottom left of the screen:

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
popular shells, such as ``tcsh``, ``zsh``, etc.

The terminal will start in your *home directory*, ``/home/username/``,
which is a special directory (*i.e.*, folder) assigned to your user
account.

In each part of the tutorial, we will introduce a new concept or
skill, and will provide a few simple examples. In fact, we show many
examples of sample output throughout the tutorial. Bear in mind that
the output you see when you run through our examples may vary a bit;
this is normal.  We have also included a few exercises in each section
so you can practice these skills.


.. _tutorial-materials:

Pick Up the Tutorial Materials
------------------------------

To complete this tutorial, you will need a series of files to use with
for the examples and exercises.

To fetch these files, run the following commands one at a time::

    $ cd
    $ wget -nv https://uchicago-cs.github.io/student-resource-guide/_static/linux-tutorial-files.zip
    $ unzip linux-tutorial-files.zip

(We use ``$`` to represent the Linux command-line prompt.  Do not include it
when you run the commands.)

The first command (``cd``), which we explain in the :ref:`Navigating
the File System <linux-file-system>` section, ensures that you are in
your home directory.  The second downloads up a compressed file from our
GitHub site.   And finally, the third command decompresses that file.

(As an aside, be very careful when running ``wget`` commands that you
find in instructions on the internet.  You should always verify that the
download site is legitimate.)

After you run these commands, your home directory will contain a
``linux-tutorial-files`` directory that has some files
for us to play with.

The next section of the tutorial covers :ref:`Navigating the Filesystem <linux-file-system>`.

