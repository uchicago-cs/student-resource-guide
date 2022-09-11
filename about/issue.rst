.. _about_issue:

Reporting an Issue
==================

If you spot an issue while reading this guide, such as a typo or an example that doesn't work,
you can report it to us using **GitHub Issues**.
To do so, go to our GitHub repository (https://github.com/uchicago-cs/student-resource-guide/)
and click on the "Issues" tab (or use this `direct link <https://github.com/uchicago-cs/student-resource-guide/issues>`__).

Once on that page, click on the green **New Issue** button (if you do not have a GitHub account,
you will be prompted to create one at this time). You will be shown a form like this:

.. figure:: github_issue.png

Then, fill out the form as follows, depending on the kind of issue you are reporting:

Typos
-----

A typo refers to a minor error in the guide's text (e.g., spelling mistakes,
incorrectly formatted code blocks, etc.). To report a typo, fill out the
following fields:

- Click on "Labels" (on the right sidebar) and select "typo".
- In the title, enter "Typo in <page>" (e.g., "Typo in Remote SSH Access page").
- In the description field (i.e., under "Write") please provide the following information:

    - The URL of the page where you found the typo.
    - The location of the typo (e.g., "In section 'Installing SSH Client", "In the second paragraph
      of the page", etc.)
    - The current text, and the suggested correction (if possible, please use bold formatting to
      highlight the exact correctly. For example:

         "The first step wall be to" should be "The first step **will** be to"


Outdated Information
--------------------

Outdated information can refer to one of the following:

- An example that essentially works as expected, but where the output is substantially
  different from the one shown in the guide.
- Tools that print out messages recommending that the tool be run in a different way
  (e.g., if we ask you to use option ``--foo``, but the tool says "Option ``--foo``
  will be deprecated in future versions. Please use option ``--bar`` instead")
- Screenshots that are substantially different from what you are seeing in your own
  system. For example, if a screenshots shows a configuration window with a couple
  of fields to fill in, but some of those fields are missing (or have different names)
  when you open them)

If you encounter outdated information, please fill out the fields as follows:

- Click on "Labels" (on the right sidebar) and select "update needed".
- In the title, please provide a concise summary of the outdated information
  you have encountered. e.g., "Outdated screenshot in VSCode SSH page",
  "Example in Advanced Git Tutorial warns of deprecated feature", etc.
- In the description field (i.e., under "Write") please provide the following information:

    - The URL of the page where you encountered the outdated information.
    - The system you are using (Mac, Windows, Linux, etc.). Please make sure to
      include the operating system version you are using.
    - In general, please tell us what information appears to be outdated, and what
      you are seeing when you work through that part of the guide. For example:

      - If the output of a command appears to be outdated, please provide the output
        you are seeing.
      - If a screenshot is outdated, please provide a screenshot of what you are
        seeing on your computer.

Suggesting New Content
----------------------

If you'd like to suggest that we add some additional content, or that we expand on a given
section to make it clearer or easier to read, please fill out the form as follows:

- Click on "Labels" (on the right sidebar) and select "enhancement".
- In the title, please provide a concise summary of the suggested enhancement. For example:

  - "Include screenshots in section X of page Y"
  - "Add a Java style guide"
  - "Explain X in more detail in page Y"

- In the description field (i.e., under "Write") please provide the following information:

    - If you are suggesting an enhancement to a specific page, please provide the
      URL of that page.
    - Please explain the additions/changes you are suggesting, and how they could
      benefit the readers of the guide.

Other Issues
------------

If you encounter an issue that doesn't fall into any of the above categories, please
leave the "Labels" blank, and fill out the title and description, taking care to
include as much information as possible about the issue (including any suggested
fixes you may have).