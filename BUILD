load(":meta.bzl", "sequential_run")

# Custom rule that builds and scans the Docker image
sequential_run(
    name = "hello_world",
    first = "@bazel_multirepo_a//:hello_world",
    second = "@bazel_multirepo_b//:hello_world",
)

# genrule(
#     name = "hello_world",
#     srcs = [],
#     outs = ["hello_world_combined_output.txt"],
#     tools = [
#         "@bazel_multirepo_a//:hello_world",
#         "@bazel_multirepo_b//:hello_world",
#     ],
#     cmd = """
#         echo "Running hello_world from bazel-multirepo-a:" > $@
#         $(location @bazel_multirepo_a//:hello_world) >> $@ 2>&1

#         echo "\\nRunning hello_world from bazel-multirepo-b:" >> $@
#         $(location @bazel_multirepo_b//:hello_world) >> $@ 2>&1
#     """,
# )

