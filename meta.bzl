def _sequential_run_impl(ctx):
    # Run the py_binary scanner target

    out = ctx.outputs.text
    # second_out = ctx.actions.declare_file("second" + "_log.txt")

    ctx.actions.run(
        executable = ctx.attr.first[DefaultInfo].files_to_run.executable,
        outputs = [out],
        arguments = [
            "--args", "helloworld",
        ],
    )
    
    ctx.actions.run(
        executable = ctx.attr.second[DefaultInfo].files_to_run.executable,
        outputs = [out],
        arguments = [
            "--args", "helloworld",
        ],
    )

    # Return the scan log as an output
    return [DefaultInfo(files = depset([out]))]

# Rule declaration
sequential_run = rule(
    implementation = _sequential_run_impl,
    attrs = {
        "first": attr.label(
            mandatory = True,
            executable = True,
            cfg = "exec",
        ),
        "second": attr.label(
            mandatory = True,
            executable = True,
            cfg = "exec",
        ),
    },
)


# def _build_and_scan_docker_impl(ctx):
#     # Get outputs from the docker image target
#     docker_image_output = ctx.attr.docker_image[DefaultInfo].files.to_list()[0]
    
#     # Define an output log for the scan result
#     scan_output = ctx.actions.declare_file(ctx.attr.name + "_scan_output.txt")
    
#     # Run the py_binary scanner target
#     ctx.actions.run(
#         inputs = [docker_image_output],
#         outputs = [scan_output],
#         executable = ctx.attr.scanner[DefaultInfo].files_to_run.executable,
#         arguments = [
#             "--image", docker_image_output.path,
#             "--output", scan_output.path,
#         ],
#         tools = [ctx.attr.scanner[DefaultInfo].files_to_run],
#     )
    
#     # Return the scan log as an output
#     return [DefaultInfo(files = depset([scan_output]))]

# # Rule declaration
# build_and_scan_docker = rule(
#     implementation = _build_and_scan_docker_impl,
#     attrs = {
#         "docker_image": attr.label(
#             mandatory = True,
#             allow_files = True,
#         ),
#         "scanner": attr.label(
#             mandatory = True,
#             executable = True,
#             cfg = "exec",
#         ),
#     },
# )
