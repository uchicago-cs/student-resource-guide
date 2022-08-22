.. _ssh:

Remote SSH Access
=================

While your code must compile and run in a :ref:`CS Software Environment <software-environment>` that doesn't mean you have to do all your work on a CS machine (although that is certainly an option too). This page describes a number of ways in which you can do some or most of your work from your personal computer, and accessing a CS software environment when needed.

SSH'ing into a CS system
------------------------

The simplest mechanism to access a CS software environment is to log into a CS machine remotely using SSH. This will allow you to open a terminal that runs on a CS machine, but which you can access from your computer. Instructions on how to do this can be found on the `Remote Access <https://howto.cs.uchicago.edu/remote_access>`__ page of the `CS Techstaff Wiki <https://howto.cs.uchicago.edu/>`__. Your machine will most likely have a version of a SSH client already installed. If for whatever reason it does not, see the last section for a troubleshooting guide.
.. Link the last section .

However, this means that you are constrained to interacting with a CS machine only via a terminal: you will not be able to launch any graphical programs (like you would if you were physically sitting at a Linux machine in a CSIL lab). So, you will either have to do all your work using a terminal text editor (like vi or Emacs) running on the CS machine, or you will have to copy your files from your personal computer to your CS home directory before you compile/run them.

If you do take the approach of copying files between your computer and a CS machine (so you can edit them on your computer, and then run them on a CS machine), do *not* do this using a version control tool like Git. Instead, you should use `scp` or `rsync` to copy files between the two computers (see "File Transfer" in the   `Remote Access <https://howto.cs.uchicago.edu/remote_access>`__  page for more details).


SSH access from a code editor
-----------------------------

Manually copying over files from your computer to a CS machine can be tiresome. Fortunately, a lot of code editors include SSH functionality that will allow you to automate this process. In most cases, you'll be able to host your files on a CS machine, and have your code editor (running on your personal machine) edit those files as if they were on your local machine. Then, you can just use an SSH terminal to compile and run the code (some tools will also automate this step too, allowing you to initiate a remote build/debug from the editor).

Here are links to instructions on how to do this on some of the editors we recommend:

- Visual Studio Code has excellent built-in support for this: `Remote Development using SSH <https://code.visualstudio.com/docs/remote/ssh>`__
- Sublime Text does not support SSH access natively, but there are ways of making it work using the `rsub <https://packagecontrol.io/packages/rsub>`__ package. See `Editing remote scripts locally via SSH using SublimeText 3 <https://acarril.github.io/posts/ssh-sripts-st3>`__ for instructions.
- Some (but not all) JetBrain IDEs have built-in support for this. In CLion, this is known as `Full Remote Mode <https://www.jetbrains.com/help/clion/remote-projects-support.html>`__




What *not* to do: Synchronizing with Git
----------------------------------------

When using Git (or some other version control system), you will have the ability to push your code to a server from one computer, and then pull it from another computer. This makes it easy to access your code from any location, but you should not rely on this as mechanism to frequently copy your code to a CS machine for the purposes of compiling/running/debugging it.

In other words, if you find yourself frequently committing code with messages like  "Uploading to CSIL", "Changing file to try on CS machine", etc. and doing this multiple times *while* you're working on your code, this is not how version control systems are meant to be used. A commit should represent a meaningful change in your code, and should not be used as a mechanism for copying files to another machine. Instead, you should use the mechanisms described earlier in this page.

To be clear: it is absolutely fine to work on multiple machines, and pull/push code as a way to ensure you're working on the latest version of your code from any given machine. However, in general, your workflow should generally involve pulling once when you start working on your code, and then pushing your code when you're done working. While you're working on your code, transferring files to/from other machines should be done with tools like SSH, `scp`, and `rsync` (not with your version control system).


Installing a SSH Client
-----------------------

To install a SSH client, follow the instructions corresponding to your operating system:


Windows 10
~~~~~~~~~~

*These instructions are specific to Windows 10. If you are running Windows 7 or Windows 8, please contact your course staff for instructions.*

In this step, you will install Windows OpenSSH Client.

For this step, you will open various applications and settings by searching for them. To do this, open the Start menu by pressing the Windows key on the keyboard, or clicking the Windows icon in the corner of your screen. Begin typing the name of the application or setting, like *About your PC* (even though there is no visible search bar, one will appear when you begin typing). When the *About your PC* option appears, click on it.

**Checking your version of Windows 10**

You need to be running a recent version of Windows 10. To check your current version, open the Start menu, begin typing *About your PC*, and click on the option when it appears.

.. figure:: code-img/install-ssh-win10-1.png

Scroll down to the heading *Windows specifications*. Next to *Edition*, you should see *Windows 10 Home* or *Windows 10 Pro* (or similar).

.. figure:: code-img/install-ssh-win10-2.png

Below that you should see *Version* and a number like 2004. If this number is less than 1803, then you need to update Windows 10.

**Updating Windows 10**

To update Windows 10, open the Start menu, begin typing *Check for updates*, and click on the option when it appears.

.. figure:: code-img/install-ssh-win10-3.png

The window that opens should have the heading *Windows Update*. It may tell you that you have updates avialable; otherwise, click the button that says *Check for updates*.

.. figure:: code-img/install-ssh-win10-4.png

Follow the instructions to install the available updates. This may take a few minutes, and your computer may restart. When the update completes, check your version of Windows 10 again, and verify that it now reads as 1803 or greater.

**Installing Windows OpenSSH Client**

Open the Start menu, begin typing *Manage Optional Features*, and click the option when it appears.

.. figure:: code-img/install-ssh-win10-5.png

You should see a window that looks like this, with the heading *Optional features*.

.. figure:: code-img/install-ssh-win10-6.png

Scroll through the list of *Installed features*. If *OpenSSH Client* appears in the list, you are done with this step. Otherwise, click on *+ Add a feature* at the top of the page. You will get a pop-up window with the heading *Add an optional feature*. Start typing *OpenSSH Client*. When the option appears, click on the checkbox next to it.

.. figure:: code-img/install-ssh-win10-7.png

Then click on the button labeled *Install (1)*. Wait for the progress bar to fill.

.. figure:: code-img/install-ssh-win10-8.png

The installation is complete.

.. Does this process add ssh to the PATH?

**Checking that the installation was successful**

Open the Start menu, begin typing *Windows PowerShell*, and click on the option when it appears.

.. figure:: code-img/install-ssh-win10-9.png

Note that Windows PowerShell looks similar to the Linux terminal, even though is *not* the same as the Linux terminal. At the prompt, type

::

    ssh username@LINUX_SERVER

where ``username`` should be replaced by your CNetID and
``LINUX_SERVER`` should be replaced by the linux server you identified
as associated with your CnetID at the start of the setup process.

.. figure:: code-img/install-ssh-win10-10.png

You should be prompted for your password. If you are not, check that you followed the SSH installation steps correctly, and try again. If you are still not prompted for your password, ask us about it on Piazza.

Type the password associated with your CNetID and press enter (nothing will appear on the screen as you type your password, but this is normal; your keypresses are still being registered).

You should see a message about when you last logged on, followed by a prompt that looks like

::

    username@linuxX:~$

where ``username`` is replaced by your CNetID, and `X` is replaced by a number from 1 to 7. You are now connected to the Linux computers on campus. Try running a few terminal commands, like ``pwd``, ``ls`` and ``cd``. If you already did the `Virtual Linux lab`_, you should be able to find the files that you created for it.

Type ``logout`` and press enter to close your connection to the campus Linux computers. Type ``exit`` again and press enter to exit Windows PowerShell.

macOS
~~~~~

An SSH client comes pre-installed. However, you should check that it works as expected before moving on.

Press Command-Space to open Spotlight Search. Begin typing *Terminal*, and click on the option when it appears.

.. figure:: code-img/install-ssh-mac-1.png

At the terminal prompt, type

::

    ssh username@LINUX_SERVER

where ``username`` should be replaced by your CNetID and
``LINUX_SERVER`` should be replaced with your assigned linux server.

.. figure:: code-img/install-ssh-mac-2.png

You should be prompted for your password. Type the password associated with your CNetID and press enter (nothing will appear on the screen as you type your password, but this is normal; your keypresses are still being registered).

You should see a message about when you last logged on, followed by a prompt that looks like

::

    username@linuxX:~$

where ``username`` is replaced by your CNetID, and `X` is replaced by a number from 1 to 7. You are now connected to the Linux computers on campus. Try running a few terminal commands, like ``pwd``, ``ls`` and ``cd``.

Type ``logout`` and press enter to close your connection to the campus Linux computers and return to your own computer's terminal prompt.


Linux
~~~~~

.. These instructions are essentially copied from https://code.visualstudio.com/docs/remote/troubleshooting#_installing-a-supported-ssh-client .

Debian/Ubuntu: Run ``sudo apt-get install openssh-client``

RHEL/Fedora/CentOS: Run ``sudo yum install openssh-clients``

After installing, you should verify that you can connect to the Linux computers on campus. In the terminal, type,

::

    ssh username@LINUX_SERVER

where ``username`` is replaced by your CNetID and ``LINUX_SERVER`` is replaced with your assigned linux server. You should be prompted for the password associated with your CNetID. Then you should be able to run terminal commands on the campus Linux computers.
