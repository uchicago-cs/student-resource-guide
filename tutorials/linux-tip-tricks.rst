.. _linux-tip-tricks:

Linux Tutorial - Tips and Tricks
=======================================

In this section of the tutorial, you will learn some time saving
keyboard shortcuts for Linux.  Learning to use keyboard shortcuts will
allow you to work **more efficiently and with less frustration**.

Using the Control Key
---------------------

In the text below, when we write ``Ctrl-X`` for some letter ``X``, we
mean press the control key and the key for the specified letter at the
same time.  For example, to type ``Ctrl-C``, you will press the
control key and the ``c`` key at the same time.  By convention, the
letter is usually written as a capital letter (e.g., ``C``) for
clarity, but you do not need to press the shift key in addition to the
control key.


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

Here are some useful shortcuts for editing the current text on the command-line:

- ``Ctrl-A`` will move you to the beginning of a line.
- ``Ctrl-E`` will move you to the end of a line.
- ``Ctrl-U`` will erase everything from where you are in a line back to the beginning.
- ``Ctrl-K`` will erase everything from where you are to the end of the line.
- ``Ctrl-L`` will clear the text from current terminal  
  

Play around with these commands.  Being able to scroll back to, edit,
and then rerun previously used commands saves time and typing!  And
like auto-completion, getting in the habit of using keyboard shortcuts
will reduce frustration as well save time.

Summary
-------

Here is a complete list of the commands discussed in this section:

- ``Ctrl-C`` will send an interrupt signal to a running program, which will usually terminate it.
- ``Ctrl-D`` will send an end-of-input signal to a program.
- ``Ctrl-P`` will roll back to the previous command in the command history.
- ``Ctrl-N`` will move forward one command in the command history.
- ``Ctrl-A`` will move you to the beginning of a line.
- ``Ctrl-E`` will move you to the end of a line.
- ``Ctrl-U`` will erase everything from where you are in a line back to the beginning.
- ``Ctrl-K`` will erase everything from where you are to the end of the line.
- ``Ctrl-L`` will clear the text from current terminal


You have finished the tips and tricks section.

If you have been referred to this tutorial as part of a class you
are taking, please move on to the next section required by your instructor.

