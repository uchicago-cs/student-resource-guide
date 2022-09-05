.. _vscode-config:

Configuring and Using Visual Studio Code
========================================

.. todo::
    Add images for configuration.

In this page, you will find instructions on how to set some common configuration
options. Many of these will make it easier to conform to our style guides.

Space Indentation
-----------------

Your editor should be set such that tabs are equivalent to four spaces. This guide focuses on how to configure indentation in VS Code. First, set the tab size to four spaces. Go to *Preferences*, *Settings*, and select *Commonly Used*. Under *Commonly Used* find *Editor: Tab Size* and set it to four. Next, set tabs as spaces. Go to *Commonly Used* again, and set *Editor: Insert Spaces* to true.

Rulers
------

Your code should, generally, not have lines longer than 80 characters. To make sure you do not go over that line limit, you should configure VS Code to render line rulers. Go to *Preferences*, *Settings*, and look up *Editor: Rulers*. Open the *settings.json* file and copy the following to the file.  Add the text after the last item within the curly braces.

.. code-block::

    "editor.rulers": [80,120],

    "workbench.colorCustomizations": {
        "editorRuler.foreground": "#ff4081"
    }


Make sure to save the file using ``Ctrl-s``, if you are using a
Windows or Linux Machine or ``Command-s``, if you are using a MacOS
machine.  If your changes worked properly, you will see a vertical
red-line at 80 characters.  If your VSCode window is wide enough, you
will see a second vertical line at 120 characters.

Terminal
--------

When you open a terminal in a CS Linux system (whether it be on a desktop environment or via SSH),
the exact type of terminal that will be running is a `Bash <https://en.wikipedia.org/wiki/Bash_(Unix_shell)>`__
shell. So, we recommend that you set up VS Code to run a Bash shell in the built-in terminal.

If you are running on a Windows machine, you should install `Git for Windows <https://gitforwindows.org/>`__,
which provides a Bash emulation layer called "Git Bash". While this is not a full-featured Bash shell,
it will allow you to run Git commands as if you were in a Bash shell.

If you are on a Linux or Mac, Bash is already pre-installed.

Regardless of what operating system you use, you should make sure that Bash is set up as your
default shell in VS Code:

#. Open the integrated terminal by pressing :code:`Ctrl-Shift-``
#. Click on the drop down next to the plus sign.
#. Click *Select Profile*
#. Select bash or Git Bash.


Tips and Tricks
---------------

.. todo::
    Decide if we should keep the panel section, and add images for it.

Shortcuts
~~~~~~~~~

VS Code includes a number of keyboard shortcuts that can come in handy.  Linux and Windows use Control (``Ctrl``) and Alt (``Alt`)`, while MacOS uses Command (``Cmd``) and Option (``Opt``).

.. list-table:: Common Shortcuts
    :header-rows: 1

    * - Shortcuts for Linux and Windows
      - Shortcuts for MacOS
      - Action
    * - Ctrl + X
      - Cmd + X
      - Cut line (or selection)
    * - Ctrl + C
      - Cmd + C
      - Copy line (or selection)
    * - Ctrl + V
      - Cmd + V
      - Paste
    * - Ctrl + ]
      - Cmd + ]
      - Indent line
    * - Ctrl + [
      - Cmd + [
      - Outdent line
    * - Ctrl + /
      - Cmd + /
      - Toggle line comment
    * - Shift + Alt + A
      - Shift + Opt + A
      - Toggle block comment
    * - Alt + Z
      - Option + Z
      - Toggle word wrap 

For a full list of shortcuts see the following links:

    - `On Windows <https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf>`__
    - `On macOS <https://code.visualstudio.com/shortcuts/keyboard-shortcuts-macos.pdf>`__
    - `On Linux <https://code.visualstudio.com/shortcuts/keyboard-shortcuts-linux.pdf>`__

..
    Panels
    ------

    Explorer
    ~~~~~~~~

    The *Explorer* panel is an integrated file explorer interface. It allows you to easily manage the files in your working directory.

    Source Control
    ~~~~~~~~~~~~~~

    The *Source Control* panel is an integrated GUI to use git or any other source control system set up in your working directory. It enables one-click use of common actions like staging, commiting, and pushing.

    Extensions
    ~~~~~~~~~~

    The *Extensions* panel is an interface for managing VS Code extensions. Extensions are simply packages that extend some functionality of the editor. You may have to install some extensions for some of your coursework.
