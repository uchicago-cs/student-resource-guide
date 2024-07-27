.. _tutorial-git-multiple-locations:

Git Tutorial - Working from Multiple Locations
==============================================

.. note::
   
    This section assumes you have:

    - completed the :ref:`tutorial-git-discarding-changes` section of the tutorial,
    - opened a terminal window and connected to one of the CS Linux servers, and
    - navigated to your ``git-tutorial`` directory.


Thus far, you have a local repository in your CS home directory and a
remote copy on GitHub.  And you have learned that you can keep these
up to date using add, commit, and push and how to restore and unstage
files.


If you wanted work from multiple locations (e.g., on a CS machine but
also from your laptop), you would need to to create a copy of the
repository in those locations as well. You can do this by running the
``git clone`` command (don’t run this command just yet):

::

   $ git clone git@github.com:GITHUB_USERNAME/git-tutorial.git   # Do NOT run yet

This command will create a local "clone" of the repository that is
currently stored on GitHub.  For the purposes of this tutorial, we'll
create this second copy in a separate directory of the same machine
where you've been running Git commands so far.

Open a second terminal window and connect to the same Linux server,
and run the following:

::

   $ mkdir -p /tmp/$USER
   $ cd /tmp/$USER
   $ git clone git@github.com:GITHUB_USERNAME/git-tutorial.git

Make sure to replace ``GITHUB_USERNAME`` with your GitHub username!
(The string ``$USER`` will be automatically replaced with your
username (that is, your CNetID)).

When you run ``git clone``, the repository is not cloned *into* the
current directory. Instead, a *new* directory (with the same name as
the repository) will be created in the current directory, and you will
need to ``cd`` into it to use Git commands for that repository:

::

   $ cd git-tutorial

You now have two local copies of the repository: one in your home
directory (``/home/CNETID/git-tutorial``), which we will refer to
as your *home* repository for now and one in ``/tmp``
(``/tmp/CNETID/git-tutorial``) which we will refer to as your
*temp* repository.

Switch to the window that is open to your home repository, create a
file name ``text.txt`` using ``echo``::

    $ echo "A test file" > test.txt

(Don't know what ``echo`` does?  Run ``man echo`` at the Linux command
line to learn more about it.)


Now create a commit with this new file and push the commit to GitHub.
If you are unsure how to create or push the commit look back through
the earlier sections or ask for help.

Next, switch to the window that is open to your temp repository, check
to see if ``test.txt`` appears when you do an ``ls``.  It will not,
because you have not yet downloaded the latest commits from the
repository. You can do this by running this command:

::

   $ git pull

The output of this command should look something like this:

::


   remote: Enumerating objects: 4, done.
   remote: Counting objects: 100% (4/4), done.
   remote: Compressing objects: 100% (1/1), done.
   remote: Total 3 (delta 1), reused 3 (delta 1), pack-reused 0
   Unpacking objects: 100% (3/3), 265 bytes | 265.00 KiB/s, done.
   From github.com:ar0r-student/git-tutorial
      0864622..58651e3  main       -> origin/main
   Updating 0864622..58651e3
   Fast-forward
    test.txt | 1 +
    1 file changed, 1 insertion(+)
    create mode 100644 test.txt

Now when you do an ``ls`` the file ``test.txt`` will appear.
      

