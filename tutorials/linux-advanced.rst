.. _tutorial-linux-advanced:

Tutorial - Advanced Linux
=========================

This tutorial covers a few advanced topics related to using a Linux environment.
These topics are typically not essential to perform basic tasks in a Linux environment,
but some classes may assume that you are familiar with the topics covered in this
tutorial.

This tutorial assumes that you have worked through the
:ref:`Linux Basics tutorial <tutorial-linux-basics>`, or are already familiar
with the topics covered in that tutorial. If you did not work through the Linux Basics tutorial
(but are comfortable with the material covered in it),
make sure you download the files from the Linux Basics tutorial, as we will be using them
in this tutorial as well. You can do so like this::

    $ wget -nv https://uchicago-cs.github.io/dev-guide/_static/linux-tutorial-files.zip
    $ unzip linux-tutorial-files.zip

This will create a ``linux-tutorial-files`` directory that has some files
for us to play with.

Running Commands Sequentially
-----------------------------

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
previously discussed (in the :ref:`tutorial-linux-basics-man-pages` section of
the :ref:`Linux Basics Tutorial <tutorial-linux-basics>`. Let's assume that you hadn't yet been introduced to the ``mkdir`` command.
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

#. Use piping to chain together the ``printenv`` and ``tail`` commands to display the last 10 lines of output from ``printenv``.
#. Replicate the above functionality without using the ``|`` operator. (hint: Use a temporary file.)


.. _file_permissions:

File Permissions
----------------

Sometimes we want to restrict who can access certain resources on the file system.

Most file systems assign 'File Permissions' (or just permissions) to specific users and groups of users. Unix is no different. File permissions dictate who can read (view), write (create/edit), and execute (run) files on a file system.

All directories and files are owned by a user. Each user can be a member of one or more groups. To see your groups, enter the command ``groups`` into the command line.

File permissions in Unix systems are managed in three distinct scopes. Each scope has a distinct set of permissions.

**User** - The owner of a file or directory makes up the *user* scope.

**Group** - Each file and directory has a group assigned to it. The members of this group make up the *group* scope.

**Others** - Every user who does not fall into the previous two scopes make up the *others* scope.

If a user falls into more than one of these scopes, their effective permissions are determined based on the first scope the user falls within in the order of user, group, and others.

Each scope has three specific permissions for each file or directory:

**read** - The read permission allows a user to view a file's contents. When set for a directory, this permission allows a user to view the names of files in the directory, but no further information about the files in the directory. ``r`` is shorthand for read permissions.

**write** - The write permission allows a user to modify the contents of a file. When set for a directory, this permission allows a user to create, delete, or rename files. ``w`` is shorthand for write permissions.

**execute** - The execute permission allows a user to execute a file (or program) using the operating system. When set for a directory, this permission allows a user to access file contents and other information about files within the directory (given that the user has the proper permissions to access the file). The execute permission does not allow the user to list the files inside the directory unless the read permission is also set. ``x`` is shorthand for execute permissions.

To list information about a file, including its permissions, type::

    ls -l <filepath>

You'll get output of the form::

    <permissions> 1 owner group <size in bytes> <date modified> <filepath>

For example, if we want information on ``/usr/bin/python3.8``::

    $ ls -l /usr/bin/python3.8
    -rwxr-xr-x 1 root root 5486384 Jan 27  2021 /usr/bin/python3.8


First thing we can notice is that the owner of the file is a user
named ``root``. The file's group is also ``root``.

.. note::

    ``root`` is a name for an account that has access
    to *all* commands and files on a Linux system.  Other accounts may
    also have "root" privileges.

The permissions are ``-rwxr-xr-x``.  The initial dash (``-``)
indicates that ``/usr/bin/python3.8`` is a file, not a directory.
Directories have a ``d`` instead of a dash.  Then the permissions are
listed in user, group, and others order. In this example, the owner,
``root``, can read (``r``), write (``w``), and execute (``x``) the
file. Users in the ``root`` group and all other users can read and
execute the files.


By default, any files or directories that you create will have your
username as both the user and the group.  (If you run ``groups``,
you'll notice that there is a group with the same name as your
username.  You are the only member of this group.)  On our Linux
machines, by default, new files are give read and write
permissions to user and group and no permissions to other.  New
directories will be set to have read, write and execute permissions
for user and group.

Exercise
~~~~~~~~

.. note::

   If you have not completed the :ref:`Linux Basics Tutorial <tutorial-linux-basics>`,
   create a new directory and file by running the following in your
   ``linux-tutorial-files`` directory::

       $ mkdir backups
       $ cp test.txt backups/copy2.txt

Verify that the permissions in your directories and files were set
correctly by running ``ls -l backups/copy2.txt`` and ``ls -ld  backups`` in your ``linux-tutorial-files`` directory.

The ``-d`` flag tells ``ls`` to list the directory, instead of its
contents. Notice that that the first letter in the permissions string
for ``backups`` is a `d`, while it is a ``-`` for
``backups/copy2.txt``.

Once you have verified the claim, go ahead and remove the ``backups``
directory.



Changing Permissions, Owner, & Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

+-----------------------------------------+----------------------------------------------+
| ``chmod`` <permissions> <path-name>     | set the permissions for a file/directory     |
+-----------------------------------------+----------------------------------------------+
| ``chmod`` <changes> <path-name>         | update the permissions for a file/directory  |
+-----------------------------------------+----------------------------------------------+
| ``chown`` <username> <path-name>        | change the owner of a file to username       |
+-----------------------------------------+----------------------------------------------+
| ``chgrp`` <group> <path-name>           | change the group of a file                   |
+-----------------------------------------+----------------------------------------------+



To change permissions, we use the ``chmod`` command.  There are two
ways to specify the permissions.  We'll describe the more accessible
one first: to set the permissions you specify the scope using a
combination of ``u``, ``g``, and ``o``, the permission using ``r``,
``w``, and ``x``, and either ``+`` or ``-`` to indicate that you want
to add or remove a permission.  For example ``uo+rw`` indicates that
you want to add read and write permissions for the user and others
groups.

We can demonstrate this using the ``cat`` command::

    $ echo "Hello!" > testfile
    $ ls -l testfile
    -rw-rw---- 1 username username 7 Aug 23 11:22 testfile
    $ cat testfile
    Hello!
    $ chmod ug-r testfile   #remove read and permissions from user and group
    $ ls -l testfile
    --w--w---- 1 username username 7 Aug 23 11:22 testfile
    $ cat testfile
    cat: testfile: Permission denied
    $ chmod u+r testfile    #give user scope read permissions


In this last example, we have added user read permissions to
``testfile``.

In addition to the symbolic method for setting permissions, you can
also use a numeric method: each permission has a unique value: read =
4, write = 2, execute = 1. As a result, you can describe the
permissions of each scope using the sum of its permissions'
values. For example, if a file has read and write permissions for the
user scope, its permissions can be described as 6 (4 + 2 = 6).

You can describe the permissions of a file overall using these values
for each scope. For example, 761 describes the permissions for a file
with read, write, and execute permissions for the user scope, read and
write permissions for the group scope, and only execute permissions
for the others scope.

The symbolic approach is relative: it allows you to add and remove
permissions relative the the current file permissions.  The numeric
method is absolute: it sets the permissions to a specific
configuration.  We recommend starting the symbolic approach.  It is
easier to get right.  As you get more comfortable with setting
permissions, it is useful to learn how to use the numeric method.

To change the owner of a file or directory (if you are the owner or root), use the command::

    chown <new owner> <path to file>

To change a file's group (if you are the owner or root), use the command::

    chgrp <new group> <path to file>



Exercises
~~~~~~~~~

#. Run ``echo "Hello!" > testfile`` to construct ``testfile``.  Look at the permissions using ``ls -l``.
#. Change the permissions on ``testfile`` to allow write and read access for others.  Run ``ls -l testfile`` to check the new permissions.
#. Remove group write access from ``testfile``.  Check the corrected permissions.
#. Remove ``testfile`` using ``rm``.


Acknowledgements
----------------

Parts of this tutorial are based on a Linux lab originally written for CMSC 12100
by Prof. Anne Rogers and Prof. Borja Sotomayor, and edited by numerous instructors
and TAs over the years.
