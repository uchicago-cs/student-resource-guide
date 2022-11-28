
.. _style-guide-python:

Python Style Guide
==================


Introduction
------------

This style guide is intended to provide some basic coding
conventions for programming assignments and projects in Python. These conventions
are intended to improve the readability of your code. From
your perspective as a student, the readability of your code
is important for three big reasons:

#. If you have a problem with your code, or have trouble
   debugging a particular issue, it will be easier for us
   to provide assistance (and to provide it quickly) if your
   code is easy to read.
#. Writing readable code makes the lives of our graders easier.
   Remember: a happy grader is a generous grader. Additionally,
   graders *will* take points off for code that is hard to read
   (which includes, but is not limited to, code that doesn't
   follow the conventions in this style guide)
#. Writing readable code is an important professional skill.



This document draws very heavily from John Magee's `Python Style Guide: simplified version for beginner programmers
<http://www.cs.bu.edu/courses/cs108/guides/style.html>`_ and the
`Style Guide for Python Code <http://www.python.org/dev/peps/pep-0008/>`_ by Guido van Rossum and Barry Warsaw.



Code layout
------------

Indentation
^^^^^^^^^^^


Use 4 spaces per indentation level.


**Never use "tab characters".**

Note that you can configure most text editors to insert 4 spaces whenever you press the
`tab key <https://en.wikipedia.org/wiki/Tab_key>`_. To check whether your editor is properly
configured, try the following: press the tab key, and then press the left arrow key. If the
cursor jumps to the beginning of the line, your editor inserted a single "tab character".
If the cursor only goes back one space (and you have to press the left arrow key three more
times to get to the start of the line), then the editor is correctly inserting four spaces.


Maximum Line Length
^^^^^^^^^^^^^^^^^^^

In general, you should limit all lines to a maximum of 80 characters.

While this may seem like a small amount of characters given the size
of today's screens, the 80 character limit is still observed by
most standard style guides including the `Linux Kernel Style Guide <https://www.kernel.org/doc/html/v4.10/process/coding-style.html#breaking-long-lines-and-strings>`__,
`Google's C++ Style Guide <https://google.github.io/styleguide/cppguide.html#Line_Length>`__,
and `Python's PEP8 <https://www.python.org/dev/peps/pep-0008/#maximum-line-length>`__.
Getting into the habit of limiting your lines to 80 characters will serve you
well in the future.

From a practical standpoint, keeping lines to 80 characters makes code more
readable and also makes it easier to have multiple files open side by side
on a large screen.

There are two concrete exceptions to this rule (taken from Google's C++ Style Guide):

- A comment line which is not feasible to split without harming readability, ease of cut and paste or auto-linking
  -- e.g., if a line contains an example command or a literal URL longer than 80 characters.
- A string literal with content that exceeds 80 characters.

More generally, the 80 character limit can usually be broken if doing so
significantly increases readability *and does not hide information*
(notice how both exceptions above meet this rule, since there would be
no actual code beyond the 80 character limit).

So, while breaking this limit occasionally is fine, you will usually
have to break up your code so it will fit into the 80 character limit.
The preferred way of wrapping long lines is by using Python's implied
line continuation inside parentheses, brackets and braces. If
necessary, you can add an extra pair of parentheses around an
expression, but sometimes using a backslash looks better.


Blank Lines
^^^^^^^^^^^

Unless a function is very short, the body of the function should include blank lines functions to indicate
logical sections (with at most one blank line separating each logical section).

Separate function definitions with two blank lines.

Extra blank lines may be used (sparingly) to separate groups of
related functions.



Whitespace in Expressions and Statements
----------------------------------------

Avoid extraneous whitespace in the following situations:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


- Immediately inside parentheses, brackets or braces.

    ::

        Yes: spam(ham[1], {eggs: 2})
        No:  spam( ham[ 1 ], { eggs: 2 } )

- Immediately before a comma or a colon:

    ::

        Yes: if x == 4: print x, y
        No:  if x == 4 : print x , y


- Immediately before the open parenthesis that starts the argument list of a function call:


    ::

        Yes: spam(1)
        No:  spam (1)

- Immediately before the open bracket that starts an indexing or slicing:

    ::

        Yes: dict['key'] = list[index]
        No:  dict ['key'] = list [index]

- More than one space around an assignment (or other) operator to align it with another.

  Yes:

  ::

       x = 1;
       y = 2;
       long_variable = 3;

  No:

  ::

       x             = 1
       y             = 2
       long_variable = 3


Places to use spaces
^^^^^^^^^^^^^^^^^^^^
- Always surround these binary operators with a single space on either side: assignment (=), augmented assignment (+=, -= etc.  ), comparisons (==, <, >, !=, <>, <=, >=, in, not in, is, is not), Booleans (and, or, not).

- Use spaces around arithmetic operators:

  Yes:

  ::

        i = i + 1
        submitted += 1
        x = x * 2 - 1
        hypot2 = x * x + y * y
        c = (a + b) * (a - b)

  No:

  ::

        i=i+1
        submitted +=1
        x = x*2 - 1
        hypot2 = x*x + y*y
        c = (a+b) * (a-b)

- Compound statements (multiple statements on the same line) are generally discouraged.
  Yes:

  ::

    if foo == 'blah':
        do_blah_thing()
    do_one()
    do_two()
    do_three()

  Rather not:

  ::

    if foo == 'blah': do_blah_thing()
    do_one(); do_two(); do_three()


Comments
--------

Comments that contradict the code are worse than no comments. Always
make a priority of keeping the comments up-to-date when the code
changes!  Comments should consist of either a single short phrase or
one or more complete sentences. The first word of a comment should be
capitalized, unless it is an identifier that begins with a lower case
letter (never alter the case of identifiers!).

If a comment is short, the period at the end can be omitted. Block
comments generally consist of one or more paragraphs built out of
complete sentences, and each sentence should end in a period.


Header Comments
^^^^^^^^^^^^^^^

Header comments appear at the top of a file. These lines typically
include the filename, author, date, version number, and a description
of what the file is for and what it contains.

For class assignments, headers should always include your name!
::

    # One line description of the contents of the file.
    #
    # YOUR NAME
    #
    # Usage information.


Function Comments
^^^^^^^^^^^^^^^^^
Function comments should be done in the form of a docstring, i.e., a
multi-line string (delimited by triple quotes, ``'''``) after the
function header.

This comment must contain information specific to what a function does.
It should also include a description of the purpose and expected
input arguments, the expected output values, and how error conditions
are handled.

Example:
::

    def hypotenuse(a, b):
        '''
        This function solves Pythagorean theorem a^2 + b^2 = c^2
        for the value of c.

        Inputs:
          a, b (float): the lengths of sides of a right triangle.

        Returns:
          (float) the length of the hypotenuse.
        '''

        return math.sqrt(a**2 + b**2)


Block Comments
^^^^^^^^^^^^^^
Block comments generally apply to some (or all) code that follows
them, and are indented to the same level as that code. Each line of a
block comment starts with a # and a single space (unless it is
indented text inside the comment).  Paragraphs inside a block comment
are separated by a line containing a single #.

When commenting on ``if-else`` statements, block comments for each branch should be
indented at the same level as the branch. Any comment indented at the same level
as the ``if`` statement should be a comment on the entire conditional, not on the
first branch. For example::


    # Checks if a year is a leap year
    if year % 4 != 0:
        # If it's not divisible by 4, it definitely isn't a leap year
        return False
    else if year % 100 != 0:
        # If it's divisible by 4 *and* not divisible by 100,
        # it's definitely a leap year */
        return True
    else if year % 400 != 0:
        # Special case: years that are divisible by 100, but not by 400
        # are actually common years
        return False
    else:
        # In all other cases, the year is a leap year
        return True


Inline Comments
^^^^^^^^^^^^^^^

Use inline comments sparingly.  An inline comment is a comment on the
same line as a statement. Inline comments should be separated by at
least two spaces from the statement.
They should start with a ``#`` and a single space.

Inline comments are unnecessary and in fact distracting if they state
the obvious. Don't do this:
::

   x = x + 1                 # Increment x

But sometimes, this style of comment is useful:
::

   x = x + 1                 # Compensate for border



Naming Conventions
------------------

Variable and function names should use the `snake_case <https://en.wikipedia.org/wiki/Snake_case>`_
naming convention (i.e., ``lowercase_with_underscore``). For example:

::

          sum_of_squares
          print_happy_birthday
          total_apples


One exception: class names should start with a capital letter and use
CamelCase::

    DivvyStation
    Route
    VotingBooths


Constants names should use snake_case with all caps:

::

    PI
    MAX_CLIENTS
    MAX_IRC_MSG_LEN


Use descriptive names for parameter names, variables, and function
names.  Use short names for local
variables.  In general, the further away a variable will be used, the more
descriptive the name needs to be.
Yes::

    for x in data:
        print(f(x))

No::

    for element_of_list in data:
        print(f(element_of_list))

However, you should not assume from the above that loops should *always* use
one-letter variable names. Here is an example where doing so can make your
code hard to read:
No::

    for x in data:
        # ...
        # 10 lines of code
        # ...
        y = m // 60
        # ...
        # 50 lines of code
        # ...
        x["hours"] += y

Yes::

    for student in data:
        # ...
        # 10 lines of code
        # ...
        worked = minutes // 60
        # ...
        # 50 lines of code
        # ...
        student["hours"] += worked


The names of functions that perform an action should include a verb:

::

    Yes: read_column_from_csv
    No:  column_from_csv




..
    Printing logging / debug messages
    ---------------------------------

    All the projects in this class use a simple logging library called ``chilog`` that is documented in each of the project specifications. You must use the ``chilog`` functions *exclusively* for printing logging or debug messages. **Do not use printf() directly in your code**. Please note that the ``chilog`` functions provide essentially the same functionality as ``printf``, so there is no situation where ``printf`` would be necessary instead of ``chilog`` (using ``chilog`` consistently also means you will not have to scrub ``printf``'s from your code before submitting it).

    Furthermore, all the messages at the ``INFO``, ``WARNING``, ``ERROR``, and ``CRITICAL`` levels must be used only for their intended purposes (e.g., only use ``ERROR`` to print out actual errors in the execution of your program). You must use the ``DEBUG`` level only to print informative debug messages that would be understood by any developer trying to debug your code. You may use the ``TRACE`` level to print *any* debug message (including those that would only be understood by you). However, if your code is riddled with ``TRACE`` logging statements (including commented out ones) to the point where it is hard to read the code itself, we may take points off for this. So, once a ``TRACE`` logging statement has served its purpose, we suggest you remove it (not just comment it out).

    You should assume that graders will run your code with logging at the ``INFO`` level, and will only use the ``DEBUG`` level if they need to debug an issue with your code. We will never run your code with logging at the ``TRACE`` level.

    Please note that, in assignments where you are responsible for writing the ``main`` function, you may use ``fprintf`` to print to *standard error* if there is an error that prevents the program from starting (e.g., if a command-line parameter has not been provided, etc.)

Global variables
----------------


Mutable global or shared variables can introduce bugs that are hard to detect and require careful design to ensure correctness. Unless a class you are taking specifically allows you to use global variables, the use of global variables is forbidden, except for defining *constants* that are set once and never changed throughout the runtime of the program.


When writing a function, you must make sure that all the data the function is going to operate on is passed to the
function via its parameters, and that all data the functions produces is returned via its return value (or through
an input/output parameter). Writing a function that uses a global variable to convey information
to/from the function (except when using a constant), will make your code hard to read and debug.

For more details, see the Wikipedia entry on `Global Variables <https://en.wikipedia.org/wiki/Global_variable>`_,
which also notes "They are usually considered bad practice".

Avoid Magic Numbers
-------------------

Avoid sprinkling numbers that will have very little meaning to your
reader throughout your code. Instead, you should define constants
(in ``ALL_CAPS``, as specified earlier) and use those instead.

For example:


Yes::

    if abs(d-expected) >= TOLERANCE:
        s = "WRONG: Expected distance between {} and {} to be {:.2f} {}"
        s = s + "but got {:.2f} {}"
        print(s.format(c1, c2, expected/scale, unit, d/scale, unit))

No::

    if abs(d-expected) >= 10:
        s = "WRONG: Expected distance between {} and {} to be {:.2f} {}"
        s = s + "but got {:.2f} {}"
        print(s.format(c1, c2, expected/scale, unit, d/scale, unit))



Programming recommendations
---------------------------

Do *not* compare boolean values to True or False using ==.

::

    Yes:   if greeting:
    No:    if greeting == True:
    Worse: if greeting is True:


Be consistent in return statements. Either all return statements in a
function should return an expression, or none of them should. If any
return statement returns an expression, any return statements where no
value is returned should explicitly state this fact as return None ,
and an explicit return statement should be present at the end of the
function (if reachable).

Yes:

::

    def foo(x):
        if x >= 0:
            return math.sqrt(x)
        else:
            return None

    def bar(x):
        if x < 0:
            return None
        return math.sqrt(x)

No:

::

    def foo(x):
        if x >= 0:
            return math.sqrt(x)

    def bar(x):
        if x < 0:
            return
        return math.sqrt(x)

For sequences, (strings, lists, tuples), use the fact that empty
sequences are false.

::

    Yes: if not seq:
         if seq:

    No:  if len(seq)
         if not len(seq)


Linters
-------

There are quite a few tools that exist to help check adherence to style
guidelines and detect common mistakes such as unused variables and imports.

Many companies and open source projects rely on these tools to ensure
consistency across large codebases.

.. note::
   While linters can be very useful, neither will catch every
   error. You should still be familiar with the basic practices
   of writing clean code, such as using good variable names and proper
   use of comments and docstrings.

Linters report on code style errors, ranging from the things covered
in this guide to additional things you might want to watch out for like
functions with excessive numbers of arguments and unused imports.

The most popular linters are
`flake8 <https://github.com/PyCQA/flake8>`__
and 
`pylint <https://github.com/PyCQA/pylint>`__.

After installing either package, you can run them via the command line. 

Example::

      # example.py - with intentional errors

      l = [1,2, 3]
      for item in l:
          if(item>2):
              print(item)

:command:`flake8` output::

   $ flake8 example.py
   test.py:3:1: E741 ambiguous variable name 'l'
   test.py:3:7: E231 missing whitespace after ','
   test.py:5:7: E275 missing whitespace after keyword
   test.py:5:13: E225 missing whitespace around operator

:command:`pylint` output::

   $ pylint example.py
   ************* Module example
   test.py:4:0: C0325: Unnecessary parens after 'if' keyword (superfluous-parens)
   test.py:1:0: C0114: Missing module docstring (missing-module-docstring)

   -----------------------------------
   Your code has been rated at 5.00/10


Most editors have plugins that will automatically run your preferred linter
against your code, allowing you to keep your code clean as you write it.

If you are using VSCode, they have a guide on enabling the linter(s) of your
choice: `Linting Python in Visual Studio Code <https://code.visualstudio.com/docs/python/linting>`__.

If you want to learn more about python in detail you can learn here: `Learn Python Programming <https://www.scaler.com/topics/python/>`__.
