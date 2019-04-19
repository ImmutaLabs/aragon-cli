workflow "lint, test, build" {
  on = "push"
  resolves = ["build", "lint", "test"]
}

action "install" {
  uses = "actions/npm@master"
  args = "install"
}

action "bootstrap" {
  uses = "actions/npm@master"
  args = "run bootstrap"
  needs = ["install"]
}

action "build" {
  uses = "actions/npm@master"
  args = "run build"
  needs = ["bootstrap"]
}

action "link" {
  uses = "actions/npm@master"
  args = "run link"
  needs = ["build"]
}

action "lint" {
  uses = "actions/npm@master"
  args = "run lint"
  needs = ["bootstrap"]
}

action "test" {
  uses = "actions/npm@master"
  args = "run test"
  needs = ["link"]
}
