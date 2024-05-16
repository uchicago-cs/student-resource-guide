.. _tutorial-git-commit-log:

Git Tutorial - Viewing the Commit Log
=====================================

.. note::
   
    This section assumes you have:

    - completed the :ref:`tutorial-git-discarding-changes` section of the tutorial,
    - opened a terminal window that is connected to one of the CS Linux servers, and
    - navigated to your ``git-tutorial`` directory.


Once you have made multiple commits, you can see these commits, their
dates, commit messages, author, etc. using the ``git log``
command. This command will open a scrollable interface (using the
up/down arrow keys) that you can get out of by pressing the ``q``
key::


  commit 91ee425d4091f1c3d69accea84000a34ad14c856 (HEAD -> main, origin/main)
  Author: Anne Rogers <ar0r14003@gmail.com>
  Date:   Wed May 15 15:05:54 2024 -0500

      Wrapping up the restore section of the tutorial

  commit 55e4745ef93c457649703c44909d63a3a06f0096
  Author: NAME <EMAIL>
  Date:   Wed May 15 14:51:16 2024 -0500

      Added README file

  commit f81ceb9561bc80c6e4983b57e222c92fbd94b4c7
  Author: NAME <EMAIL>
  Date:   Wed May 15 14:47:42 2024 -0500

      Added Danish version

  commit 982d639fbc872ff407e2894ae457e87363a6942d
  Author: NAME <EMAIL>
  Date:   Mon May 13 18:15:58 2024 -0500

      Added French version

  commit e8029ada15807dddf116a59f922093cae2c57cc1
  Author: NAME <EMAIL>
  Date:   Mon May 13 18:15:08 2024 -0500

      Added more salutations

  commit 76d83bbd9fafa033f9fbffddfafabd04e3cb8cbe
  Author: NAME <EMAIL>
  Date:   Mon May 13 18:13:52 2024 -0500

    Forgot to capitalize in Spanish version

  :



As we saw earlier, you can also see the history of commits
through on GitHub’s web interface, but it is also useful to be able to
access the commit log directly from the terminal, without having to
open a browser.

Each commit will have a *commit hash* (usually referred to as the
*commit SHA*) that looks something like this:

::

   76d83bbd9fafa033f9fbffddfafabd04e3cb8cbe

This is a unique identifier that we can use to refer to that commit
elsewhere. For example, choose any commit from the commit log and run
the following:

::

   $ git show COMMIT_SHA

Make sure to replace ``COMMIT_SHA`` with a commit SHA that appears in
your commit log.

This will show you the changes that were included in that commit. The
output of ``git show`` can be a bit hard to parse at first but the
most important thing to take into account is that any line starting
with a ``+`` denotes a line that was added, and any line starting with
a ``-`` denotes a line that was removed.  For example, if we want to
looked at the committed with the message ``"Forgot to capitalize in
Spanish version"``, we would run:

::

   $ git show 76d83bbd9fafa033f9fbffddfafabd04e3cb8cbe
   commit 76d83bbd9fafa033f9fbffddfafabd04e3cb8cbe
   Author: NAME <EMAIL>
   Date:   Mon May 13 18:13:52 2024 -0500

       Forgot to capitalize in Spanish version

   diff --git a/hola.py b/hola.py
   index 5cbad67..e4c0f4e 100644
   --- a/hola.py
   +++ b/hola.py
   @@ -1,4 +1,4 @@
   -print("hola!")
   -print("hola, mundo!")
   -print("hola, universo!")
   +print("Hola!")
   +print("Hola, mundo!")
   +print("Hola, universo!")

Pro tip: in any place where you have to refer to a commit SHA, you can
just write the first few characters of the commit SHA. For example, for
commit ``76d83bbd9fafa033f9fbffddfafabd04e3cb8cbe`` we could write just
this:

::

   $ git show 76d8

Git will only complain if there is more than one commit that starts with
that same prefix.

In the next section, you will learning about working from multiple places.

      
