.. _linux-tip-tricks:

Lunix Tutorial - Tips and Tricks
=======================================

In this section of the tutorial you will learn some time saving keyboard shortcuts for Linux.
some keyboard shortcuts to work with Linux **more efficiently and with less frustration**.

Terminating a program
---------------------

Sometimes, a program will run indefinitely or misbehave. When this
happens, you can type ``Ctrl-C`` to send an interrupt signal to the
running program, which usually causes it to terminate. On occasion,
you may need to type ``Ctrl-C`` a few times.

Typing ``Ctrl-D`` sends an end of input signal, which tells the program that
no more information is coming. Typing ``Ctrl-D`` does not terminate the program. 
This can be helpful if you call ``cat`` with no input as the command will continue to wait for an input.

Keyboard shortcuts
------------------

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

You have finished the tips and tricks section.  Please move on to the
next section required by your instructor.
