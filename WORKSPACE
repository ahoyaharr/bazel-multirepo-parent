workspace(name = "bazel_multirepo_project")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "bazel_multirepo_a",
    remote = "https://github.com/ahoyaharr/bazel-multirepo-a.git",
    branch = "master",
)

git_repository(
    name = "bazel_multirepo_b",
    remote = "https://github.com/ahoyaharr/bazel-multirepo-b.git",
    branch = "master",
)

