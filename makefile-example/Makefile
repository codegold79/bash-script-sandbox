# The .PHONY indicates the target is not a file and it is explicitly set to
# avoid confusion in case there is a file with the same name as the target.
.PHONY: build-all
build-all:
	@echo "the at-sign hides the command being run and only shows the output which is to build it all"

# Percent signs in targets are wildcards.
.PHONY: build-%
build-%:
	echo "print the percent-sign wildcard match using an asterisk: $*"
# If your wildcard is "all", it will match on the `build-all` target above.

.PHONY: extract-%
extract-%:
# There are make-specific functions such as the `word` and
# `subst` functions below. The first will take the nth word
# in a list of words. The latter will replace character(s) with
# the specified ones in a string.
#
# The `eval` is also part of a make function and allows for using
# variables in make constructs.
	$(eval TXT = $(word 2,$(subst -, ,$*)))
	@echo TXT: ${TXT}
# To get TXT to echo the word 'galore', use `make extract-words-galore`.

.PHONY: get-first_word
get-first_word:
# If you want to get the command sent to make, use $(MAKECMDGOALS).
	@echo MAKECMDGOALS is \"$(MAKECMDGOALS)\".
# Here is an example of the firstword function.
	@echo The first word includes hyphens and underscores. It is, \"$(firstword $(MAKECMDGOALS))\".