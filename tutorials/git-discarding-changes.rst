.. _tutorial-git-discarding-changes:

Git Tutorial - Discarding Changes and Unstaging
================================================

.. note::
   
    This section assumes you have:

    - completed the :ref:`tutorial-git-remote` section of the tutorial,
    - opened a terminal window that is connected to one of the CS Linux servers, and
    - navigated to your ``git-tutorial`` directory.


In the :ref:`tutorial-git-remote` section, we covered how to link a
local repository to a remote repository on GitHub.  In this section,
you will learn how to discard changes.


One of the benefits of using a version control system is that it is very
easy to inspect the history of changes to a given file, as well as to
undo changes we did not intend to make.

For example, edit ``README.md`` to remove all its contents.

``git status`` will tell us this:

::

   On branch main
   Your branch is up to date with 'origin/main'.

   Changes not staged for commit:
     (use "git add <file>..." to update what will be committed)
     (use "git restore <file>..." to discard changes in working directory)
           modified:   README.md

   no changes added to commit (use "git add" and/or "git commit -a")

If we want to discard the changes we made to ``README.md``, all we have
to do is follow the helpful advice provided by the above output:

::

   $ git restore README.md


If you look at ``README.md``, you’ll see that its contents have been
magically restored!

Now, edit ``README.md`` to add an additional line with
the text ``UChicago Student Resource Guide``. Run ``git add -u`` but don’t
commit it just yet. The git status will show this:

::

   On branch main
   Your branch is up to date with 'origin/main'.

   Changes to be committed:
     (use "git restore --staged <file>..." to unstage)
    	   modified:   README.md

Now, let’s say we realized do not want to commit the changes to
``README.md``, but we’ve already told git that we want to include
``README.md`` in the commit. Fortunately, we can “un-include” it (or
“unstage” it, in Git lingo) by running this command:

::

   $ git restore --staged README.md


Now, git status will show the following:

::

   On branch main
   Your branch is up to date with 'origin/main'.

   Changes not staged for commit:
     (use "git add <file>..." to update what will be committed)
     (use "git restore <file>..." to discard changes in working directory)
           modified:   README.md

   no changes added to commit (use "git add" and/or "git commit -a")


We can either commit the changes or restore the file back
to the last commit (using ``git restore``).  Let's commit and push the
changes:

::

    $ git add -u
    $ git commit -m"Wrapping up the restore section of the tutorial"
    $ git push

Before continuing, make sure git status shows this::

    On branch main
    Your branch is up to date with 'origin/main'.

    nothing to commit, working tree clean

   
In the next section, you will learn how to view your commit log.
