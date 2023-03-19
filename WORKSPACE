nested_project_name = "nested_workspace"

local_repository(
    name = nested_project_name,
    path = __workspace_dir__ + "/nested_workspace",
)
 
# even if all of these external deps + rules are only used transitively via @nested_workspace, we have to set them up for this
# root workspace as well (https://github.com/bazelbuild/bazel/issues/2391)
load("@nested_workspace//:workspace_setup.bzl", "download_external_dependencies")

download_external_dependencies()

load("@nested_workspace//:js_setup.bzl", "set_up_rules_js_and_npm")

set_up_rules_js_and_npm()

load("@nested_workspace//:npm_repository_setup.bzl", "set_up_npm_repository")

set_up_npm_repository()