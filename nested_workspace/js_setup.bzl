load("@aspect_rules_js//js:repositories.bzl", "rules_js_dependencies")
load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")
load("@aspect_rules_js//npm:npm_import.bzl", "npm_translate_lock")
load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")

def set_up_rules_js_and_npm():
    rules_ts_dependencies(
        # This keeps the TypeScript version in-sync with the editor, which is typically best.
        ts_version_from = "//:package.json",
        ts_integrity = "sha512-wVORMBGO/FAs/++blGNeAVdbNKtIh1rbBL2EyQ1+J9lClJ93KiiKe8PmFIVdXhHcyv44SL9oglmfeSsndo0jRw"
    )

    rules_js_dependencies()

    nodejs_register_toolchains(
        name = "nodejs",
        node_version = "14.20.0",
    )

    npm_translate_lock(
        name = "npm",
        pnpm_lock = "@nested_workspace//:pnpm-lock.yaml",
        npmrc = "@nested_workspace//:.npmrc",
        patch_args = {
            "*": ["-p1"]
        },
        patches = {
            "@types/google-apps-script": ["@nested_workspace//:patches/@types__google-apps-script@1.0.55.patch"],
        }
    )
