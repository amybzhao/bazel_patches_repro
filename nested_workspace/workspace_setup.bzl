load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def download_external_dependencies():
    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "b4cd1114874ab15f794134eefbc254eb89d3e1de640bf4a11f2f402e886ad29e",
        strip_prefix = "bazel-lib-1.27.2",
        url = "https://github.com/aspect-build/bazel-lib/releases/download/v1.27.2/bazel-lib-v1.27.2.tar.gz",
    )

    http_archive(
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        ],
        sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    )

    http_archive(
        name = "rules_nodejs",
        sha256 = "40b56e18c38295425381644f4d4efebccb5c704ac313f8baf88d047a3a6b4ab3",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.7.2/rules_nodejs-core-5.7.2.tar.gz"],
    )

    http_archive(
        name = "aspect_rules_js",
        sha256 = "a592fafd8a27b2828318cebbda0003686c6da3318df366b563e8beeffa05a02c",
        strip_prefix = "rules_js-1.21.0",
        url = "https://github.com/aspect-build/rules_js/releases/download/v1.21.0/rules_js-v1.21.0.tar.gz",
    )

    http_archive(
        name = "aspect_rules_ts",
        sha256 = "58b6c0ad158fc42883dafa157f1a25cddd65bcd788a772620192ac9ceefa0d78",
        strip_prefix = "rules_ts-1.3.2",
        url = "https://github.com/aspect-build/rules_ts/releases/download/v1.3.2/rules_ts-v1.3.2.tar.gz",
    )
