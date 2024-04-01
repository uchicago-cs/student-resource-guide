.. _linux-tip-tricks:

Lunix Basics Tutorial - Tips and Tricks
=======================================

This tutorial is an extension of :ref:`Introduction to Linux <tutorial-linux-intro>`.

In this tutorial you will learn some time saving keyboard shortcuts for Linux.

For more check out:
#. :ref:`Edit, Compile, and Run a Program <linux-compile-and-run>`
#. :ref:`Man Pages <linux-man>`

Tips and Tricks
---------------

Terminating a program
~~~~~~~~~~~~~~~~~~~~~

Sometimes, a program will run indefinitely or misbehave. When this
happens, you can type ``Ctrl-C`` to send an interrupt signal to the
running program, which usually causes it to terminate. On occasion,
you may need to type ``Ctrl-C`` a few times.  As noted earlier, typing
``Ctrl-D`` sends an end of input signal, which tells the program that
no more information is coming.

Keyboard shortcuts
~~~~~~~~~~~~~~~~~~

Used in the terminal, the keyboard shortcut ``Ctrl-P`` will roll
back to the previous command.  If you type ``Ctrl-P`` twice, you will
roll back by two commands.  If you type ``Ctrl-P`` too many times, you
can use ``Ctrl-N`` to move forward.  You can also use the arrow keys:
up for previous (backward), down for next (forward).

Here are few more useful shortcuts:

- ``Ctrl-A`` will move you to the beginning of a line.
- ``Ctrl-E`` will move you to the end of a line.
- ``Ctrl-U`` will erase everything from where you are in a line back to the beginning.
- ``Ctrl-K`` will erase everything from where you are to the end of the line.
- ``Ctrl-L`` will clear the text from current terminal

Play around with these commands.  Being able to scroll back to, edit,
and then rerun previously used commands saves time and typing!  And
like auto-completion, getting in the habit of using keyboard shortcuts
will reduce frustration as well save time.

This is the last tutorial in Linux Basics.

Acknowledgments
----------------

Parts of this tutorial are based on a Linux lab originally written for CMSC 12100
by Prof. Anne Rogers and Prof. Borja Sotomayor, and edited by numerous instructors
and TAs over the years.
