nested_project_name = "nested_workspace"

local_repository(
    name = nested_project_name,
    path = __workspace_dir__ + "/nested_workspace",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "aspect_rules_js",
    sha256 = "a592fafd8a27b2828318cebbda0003686c6da3318df366b563e8beeffa05a02c",
    strip_prefix = "rules_js-1.21.0",
    url = "https://github.com/aspect-build/rules_js/releases/download/v1.21.0/rules_js-v1.21.0.tar.gz",
)

load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")

rules_js_dependencies()

load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name = "nodejs",
    node_version = "14.20.0",
)

load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")

npm_translate_lock(
    name = "npm",
    pnpm_lock = "//:pnpm-lock.yaml",
    patch_args = {
        "*": ["-p1"]
    },
    # data =["@nested_workspace//:patches/@types__google-apps-script@1.0.55.patch"]
    patches = {
        "@types/google-apps-script": ["@nested_workspace//:patches/@types__google-apps-script@1.0.55.patch"],
    }
)

load("@npm//:repositories.bzl", "npm_repositories")

npm_repositories()