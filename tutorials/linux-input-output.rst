.. _linux-input-output:

Linux Tutorial - Working with Input/Output Streams
==================================================

.. note::
   
   This section assumes you have :ref:`picked up the tutorial
   materials <tutorial-materials>` and that you have a :ref:`terminal
   window open <terminal>` to your ``linux-tutorial-files`` directory.


In this section of the tutorial you will learn how to use
the terminal to perform some more advanced operations in Linux, including:
#. Redirection
#. Piping

Working with Input/Output Streams
---------------------------------

When you run a program (at the command-line or by clicking), the Linux
operating system creates a new *process* for running the program.
Every Linux process has an input stream (known as *standard in*) for
providing input to a program and two output streams, one for regular
output (known as *standard out*) and one for providing information
about errors (known as *standard error*).  In this section, you will
learn how to use these streams to provide input to a program and to
capture the output.


Redirection
~~~~~~~~~~~

The examples in this section will use commands that we've not yet
discussed.  Refer to the man pages for information about unfamiliar
commands.

As we already know, commands like ``pwd`` and ``ls``, and ``cat`` will
print output to screen by default.  Sometimes, however, we may prefer
to write the output of these commands to a file. In Linux, we can
redirect the output of a program to a file of our choosing. This
operation is done with the ``>`` operator.

Try the following example and compare your output with ours::

        $ cd
        $ touch test-0.txt
        $ ls > test-1.txt
        $ cat test-1.txt
        Desktop
        Documents
        Downloads
        Music
        Pictures
        Public
        Templates
        test-0.txt
        test-1.txt
        Videos
        $ echo "Hello World!" > test-2.txt
        $ cat test-2.txt
        Hello World!
        $ cat test-2.txt > test-1.txt; cat test-1.txt
        Hello World!
        $ rm test-*

Two important things to note:

#. If you redirect to a file that does not exist, that file will be created.
#. If you redirect to a file that already exists, the contents of that file will be **overwritten**.

You can use the append operator (``>>``) to append the output of
command to the end of an existing file rather than overwrite the
contents of that file.

Not only can we redirect the output of a program to a file, we can
also have a program receive its input from a file.  This operation is
done with the ``<`` operator.  For example::

        $ python3 my_echo.py < my-input.txt

(Change back to your ``linux-tutorial-files`` directory before you try this command.)

In general, all Linux processes can perform input/output operations
through, at least, the keyboard and the screen. More specifically,
there are three 'input/output streams': standard input (or ``stdin``),
standard output (or ``stdout``), and standard error (or ``stderr``).
The code in ``my_echo.py`` simply reads information from ``stdin`` and
writes it back out to ``stdout``.  The redirection operators change
the bindings of these streams from the keyboard and/or screen to files.
For the purposes of this tutorial, we will only care about standard
input and standard output.

Exercises
~~~~~~~~~

#. Run ``my_echo.py`` as shown above.
#. Run ``my_echo.py`` again, but this time redirect the output to a file named ``output.txt``.  Check the contents of ``output.txt`` using an editor or by using the ``cat`` or ``more`` commands.
#. Run ``my_echo.py``  redirecting the input from ``test.txt`` and the output to ``output2.txt``.  Check the contents of ``output2.txt``.
#. When you are done, remove ``output.txt`` and ``output2.txt``.

.. note::

   Notice how, if you run ``python3 my_echo.py`` without redirecting the input, it will patiently wait for you to type some input for it to echo.  Once you type some input and hit return, the program will echo your input, and then resume waiting for input.  It will continue to do so until you exit by typing ``Ctrl-d``.  Give it a try!


Piping
~~~~~~

In addition to the ability to direct output to and receive input from files,
Linux provides a very powerful capability called piping. Piping allows one program
to receive as input the output of another program, like so::

        $ program1 | program2

In this example, the output of program1 is used as the input of
program2.  Or to put it more technically, the ``stdout`` of
``program1`` is connected to the ``stdin`` of ``program2``.

As another more concrete example, consider the ``man`` command with the ``-k`` option that we've
previously discussed in the :ref:`linux-man` section of
the :ref:`Linux Basics Tutorial <tutorial-linux-intro>`. Let's assume that you hadn't yet been introduced to the ``mkdir`` command.
How would you look for the command to create a directory? First attempts::

        $ man -k "create directory"
        create directory: nothing appropriate
        $ man -k "directory"
        (a bunch of mostly irrelevant output)

As we can see, neither of these options is particularly helpful. However, with
piping, we can combine ``man -k`` with a powerful command line utility called
``grep`` to find what we need::

        $ man -k "directory" | grep "create"
        mkdir (2)            - create a directory
        mkdirat (2)          - create a directory
        mkdtemp (3)          - create a unique temporary directory
        mkfontdir (1)        - create an index of X font files in a directory
        mklost+found (8)     - create a lost+found directory on a mounted Linux second extended fil...
        mktemp (1)           - create a temporary file or directory
        pam_mkhomedir (8)    - PAM module to create users home directory
        update-info-dir (8)  - update or create index file from all installed info files in directory
        vgmknodes (8)        - recreate volume group directory and logical volume special files

Nice.

Exercises
~~~~~~~~~

#. Learn about the ``printenv`` command by looking at its manual page (``man printenv``)  and then giving it a try.
#. Use piping to chain together the ``printenv`` and ``tail`` commands to display the last 10 lines of output from ``printenv``.
#. Replicate the above functionality without using the ``|`` operator. (hint: Use a temporary file.)

You have finished the section on working with input and output.  Please
move on to the next section required by your instructor.
   
