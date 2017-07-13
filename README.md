# Testing a bash command

This is an experiment in how to best test a command written in bash using the [Bash Automated Testing System (bats)](https://github.com/sstephenson/bats) framework.

## Example usage

```
» ./bin/run -p common -e staging
profile: common
environment: staging
```

```
» ./bin/run -h
usage:

  -e --> environment
  -p --> profile
  -h --> help
```

## Example test output

```
» bats tests
 ✓ Test usage exit status
 ✓ Test check_opts message
 ✓ Test check_opts message without environment
 ✓ Test check_opts message without profile
 ✓ Test check_opts message with all options set
 ✓ Test check_opts without flag arguments

6 tests, 0 failures
```
