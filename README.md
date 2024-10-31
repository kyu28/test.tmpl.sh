# test.tmpl.sh
Template of test script in POSIX Shell

## usage
1. write test environment init and cleanup code in `init` and `cleanup` function
2. write test cases function in test cases part
3. register test cases to `run_cases` function
4. run the script

## structure
```
utils
  |
  +-assert
  +-echoc       # echo with color

test flow
  |
  +-init        # run before test cases
  +-run_cases
  +-cleanup     # run after test cases

test cases
  |
  +-demo_case

entrypoints
  |
  +-test flow function calls
```
