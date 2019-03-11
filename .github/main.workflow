workflow "env var passing" {
  on = "push"
  resolves = ["echo message"]
}

action "export message" {
  uses = "actions/bin/sh@master"
  args = ["export MESSAGE=\"o hai\""]
}

action "echo message" {
  uses = "actions/bin/sh@master"
  needs = ["export message"]
  args = "echo $MESSAGE"
}
