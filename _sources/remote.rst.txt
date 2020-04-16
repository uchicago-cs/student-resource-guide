.. _working-remotely:

Working Remotely
================

While your code must compile and run in a :ref:`CS Software Environment <software-environment>` that doesn't mean you have to do all your work on a CS machine (although that is certainly an option too). This page describes a number of ways in which you can do some or most of your work from your personal computer, and accessing a CS software environment when needed.

SSH'ing into a CS system
------------------------

The simplest mechanism to access a CS software environment is to log into a CS machine remotely using SSH. This will allow you to open a terminal that runs on a CS machine, but which you can access from your computer. Instructions on how to do this can be found on the `Remote Access <https://howto.cs.uchicago.edu/remote_access>`__ page of the `CS Techstaff Wiki <https://howto.cs.uchicago.edu/>`__.

However, this means that you are constrained to interacting with a CS machine only via a terminal: you will not be able to launch any graphical programs (like you would if you were physically sitting at a Linux machine in a CSIL lab). So, you will either have to do all your work using a terminal text editor (like vi or Emacs) running on the CS machine, or you will have to copy your files from your personal computer to your CS home directory before you compile/run them.

If you do take the approach of copying files between your computer and a CS machine (so you can edit them on your computer, and then run them on a CS machine), do *not* do this using a version control tool like Git. Instead, you should use `scp` or `rsync` to copy files between the two computers (see "File Transfer" in the   `Remote Access <https://howto.cs.uchicago.edu/remote_access>`__  page for more details).


SSH access from a code editor
-----------------------------

Manually copying over files from your computer to a CS machine can be tiresome. Fortunately, a lot of code editors include SSH functionality that will allow you to automate this process. In most cases, you'll be able to host your files on a CS machine, and have your code editor (running on your personal machine) edit those files as if they were on your local machine. Then, you can just use an SSH terminal to compile and run the code (some tools will also automate this step too, allowing you to initiate a remote build/debug from the editor).

Here are links to instructions on how to do this on some of the editors we recommend:

- Visual Studio Code has excellent built-in support for this: `Remote Development using SSH <https://code.visualstudio.com/docs/remote/ssh>`__
- Sublime Text does not support SSH access natively, but there are ways of making it work using the `rsub <https://packagecontrol.io/packages/rsub>`__ package. See `Editing remote scripts locally via SSH using SublimeText 3 <https://acarril.github.io/posts/ssh-sripts-st3>`__ for instructions.
- Some (but not all) JetBrain IDEs have built-in support for this. In CLion, this is known as `Full Remote Mode <https://www.jetbrains.com/help/clion/remote-projects-support.html>`__


Virtual Desktop
---------------

Another option for working remotely on a CS software environment is to use a `Virtual Desktop <https://howto.cs.uchicago.edu/techstaff:vdesk>`__. Please note that this is different from a Virtual Machine; with a Virtual Desktop, you are connecting to a CS server and will be given access to a desktop environment similar to the one you would encounter if you were sitting at a Linux machine in a CSIL lab. However, this requires more bandwidth than using SSH, and can feel sluggish depending on the latency of your connection.


What *not* to do: Synchronizing with Git
----------------------------------------

When using Git (or some other version control system), you will have the ability to push your code to a server from one computer, and then pull it from another computer. This makes it easy to access your code from any location, but you should not rely on this as mechanism to frequently copy your code to a CS machine for the purposes of compiling/running/debugging it.

In other words, if you find yourself frequently committing code with messages like  "Uploading to CSIL", "Changing file to try on CS machine", etc. and doing this multiple times *while* you're working on your code, this is not how version control systems are meant to be used. A commit should represent a meaningful change in your code, and should not be used as a mechanism for copying files to another machine. Instead, you should use the mechanisms described earlier in this page.

To be clear: it is absolutely fine to work on multiple machines, and pull/push code as a way to ensure you're working on the latest version of your code from any given machine. However, in general, your workflow should generally involve pulling once when you start working on your code, and then pushing your code when you're done working. While you're working on your code, transferring files to/from other machines should be done with tools like SSH, `scp`, and `rsync` (not with your version control system).
