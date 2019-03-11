workflow "env var passing" {
  on = "push"
  resolves = ["sh-1"]
}

action "sh" {
  uses = "sh"
  args = "export MESSAGE=\"o hai\""
}

action "sh-1" {
  uses = "sh"
  needs = ["sh"]
  args = "echo $MESSAGE"
}
