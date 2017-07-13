#!/usr/bin/env bats

. ./bin/run

@test "Test usage exit status" {
  run usage
  [[ "$status" -ne 0 ]]
}

@test "Test check_opts message" {
  run check_opts
  [ "${lines[0]}" = "You need to specify the profile(s)!" ]
  [ "${lines[1]}" = "You need to specify the environment!" ]
}

@test "Test check_opts message without environment" {
  run check_opts -p common
  [ "${lines[0]}" = "You need to specify the environment!" ]
}

@test "Test check_opts message without profile" {
  run check_opts -e staging
  [ "${lines[0]}" = "You need to specify the profile(s)!" ]
}

@test "Test check_opts message with all options set" {
  run check_opts -e staging -p common
  [ "${output}" = "" ]
}

@test "Test check_opts without flag arguments" {
  run check_opts -p -e
  [ "${lines[0]}" = "You need to specify the environment!" ]
  [ "$status" -ne 0 ]
}
