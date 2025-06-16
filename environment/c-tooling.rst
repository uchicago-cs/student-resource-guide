.. _c-tooling:

The UChicago CS C Tool Chain
============================

This page describes how to install the tools used to work with C in many of your 
classes. In particular, this page focuses on the following:

* ``clang``: Clang is a compiler for languages in the C language family.
* ``lldb``: LLDB is a debugger for C, C++, and Objective-C.
* ``varlgrind``: Valgrind is a memory profiling tool used for detecting memory leaks and other memory debugging.
* ``criterion``: Criterion is a C and C++ unit testing library.
* ``make``: Make is a buildsystem used to automate building software.

.. _The which Command:

The ``which`` Command
---------------------

Before attempting to install any packages, it is good to check whether or not the
tool is already installed. To check if you already have a program installed  you can
use the ``which`` command. You can use the ``-a`` if you want to see all the 
installations in your ``PATH`` directories, which are the various directories in
which your system is configured to look for installed software.

When which has no response, it means one of the following: 

1. The software is not installed.
2. The software is installed but not in your ``PATH``.
3. There is no such software.

To check for the tools listed above, run the commands below. Note that you should
only run these when specified in the instructions for your particular OS as there
may be additional steps or relevant details.

::

    which clang
    which lldb
    which valgrind
    which make

Note that we do not check for Criterion as it is a library and not a standalone
application.


Windows Instructions
--------------------

WSL
~~~

Assuming you are setting up your computer, the very first thing to do is to make
sure you have a UNIX-style terminal readily available on your machine. For
Windows, this means installing a *Windows Subsystem for Linux* (WSL).

To install WSL, follow the instructions in the 
`official Microsoft documentation <https://learn.microsoft.com/en-us/windows/wsl/install>`__.
Make sure to install the Ubuntu distribution.

If you encounter great difficulty getting WSL to work, an approach that has 
helped address problems in the past has been to:

1. Check existing Linux installations with ``wsl --list``.
2. Unregister all such installations (for example, Ubuntu) with  ``wsl --unregister <linux-distro>``.
3. Uninstall Linux distros and WSL itself under Windows Apps.
4. Install WSL from scratch.

Note that this will result in the loss of data stored in previous WSL installations.

Tool Installation
~~~~~~~~~~~~~~~~~

Once you have successfully installed WSL, open up a new WSL terminal. Follow the
instructions in :ref:`The which Command` section to check if any of the tools are
already installed.

Use the relevant commands below to install any missing tools.

::

    sudo apt-get install clang
    sudo apt-get install lldb
    sudo apt-get install valgrind
    sudo apt-get install make

Use the following command to install the Criterion library.

::
    sudo apt-get install libcriterion-dev


MacOS Instructions
------------------

Homebrew
~~~~~~~~

Tool Installation
~~~~~~~~~~~~~~~~~

Linux Instructions
------------------

.. Credits
    Adapted from a lab assignment created by Adam Shaw and Matthew Wachs.
