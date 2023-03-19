load("@npm//:defs.bzl", "npm_link_all_packages")

filegroup(
    name = "patches",
    srcs = glob(["patches/*"]),
)

npm_link_all_packages(
    name = "node_modules",
)