#!/bin/sh
#
# Template of test script.

### constants

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PURPLE="\033[35m"
AQUA="\033[36m"
RESET_COLOR="\033[0m"

### utils

# assert - returns 1 if assertion fails
# Usage: assert <shell test expression>
assert() {
    eval "$@"
    if [ $? -eq 0 ]; then
        echo $GREEN$@$RESET_COLOR
    else
        echo "${RED}Assertion $@ failed.$RESET_COLOR" >&2
        return 1
    fi
    return 0
}

# echoc - echo with color
# Usage: echoc <color> [args ...]
echoc() {
    case "$1" in
        RED|red|Red) printf $RED;;
        GREEN|green|Green) printf $GREEN;;
        YELLOW|yellow|Yellow) printf $YELLOW;;
        BLUE|blue|Blue) printf $BLUE;;
        PURPLE|purple|Purple) printf $PURPLE;;
        AQUA|aqua|Aqua) printf $AQUA;;
        *) printf $RESET_COLOR;;
    esac
    shift
    echo "$@$RESET_COLOR"
}

### test flow
# register actions here

init() {
    echoc AQUA "$0: init"
    # do something before testing
    # eg. start server, start workers
    echo
}

run_cases() {
    echoc AQUA "$0: run_cases"
    demo_case
    echo
}

cleanup() {
    echoc AQUA "$0: cleanup"
    # clean up the environment
    # eg. kill server, kill workers
    echo
}

### test cases
# write your test cases here

demo_case() {
    echo "This is a demo case"
    assert "[ 514 -eq 514 ] && [ 'abc' = 'abc' ]" || cleanup
    assert "[ 514 -ne 514 ] && [ 'abc' = 'abc' ]"
}

### entrypoints

init
run_cases
cleanup
