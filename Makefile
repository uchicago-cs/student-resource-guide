# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# For the deploy target to work, a worktree must be created
# in _build/html that tracks the gh-pages branch. You can do
# so by running this from a freshly cloned version of the repo:
#
#   git worktree add -B gh-pages _build/html origin/gh-pages

deploy:
	echo gitdir: $(shell pwd)/.git/worktrees/html > $(BUILDDIR)/html/.git
	touch $(BUILDDIR)/html/.nojekyll
	git --work-tree=$(BUILDDIR)/html/ --git-dir=$(BUILDDIR)/html/.git add -A .
	git --work-tree=$(BUILDDIR)/html/ --git-dir=$(BUILDDIR)/html/.git commit -m"Updated website"
	git --work-tree=$(BUILDDIR)/html/ --git-dir=$(BUILDDIR)/html/.git push origin gh-pages

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

