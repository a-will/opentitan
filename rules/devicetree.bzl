# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@rules_cc//cc:find_cc_toolchain.bzl", "find_cc_toolchain")

def _devicetree_library_impl(ctx):
    processed_dt_file = ctx.actions.declare_file(ctx.attr.name + ".cpp.dts")
    outputs = [processed_dt_file]
    args = ctx.actions.args()
    args.add("-E")
    args.add("-P")
    args.add("-nostdinc")
    args.add("-x")
    args.add("assembler-with-cpp")
    args.add(ctx.file.src.path)
    args.add("-o")
    args.add(processed_dt_file.path)

    cc_toolchain = find_cc_toolchain(ctx).cc
    cc_info = cc_common.merge_cc_infos(
        direct_cc_infos = [dep[CcInfo] for dep in ctx.attr.deps if CcInfo in dep],
    )

    cc_compile_ctx = cc_info.compilation_context
    for define in cc_compile_ctx.defines.to_list():
        args.add("-D{}".format(define))
    for include in cc_compile_ctx.includes.to_list():
        args.add("-I{}".format(include))
    for quote_include in cc_compile_ctx.quote_includes.to_list():
        args.add("-iquote")
        args.add(quote_include)
    for system_include in cc_compile_ctx.system_includes.to_list():
        args.add("-isystem")
        args.add(system_include)

    cpp_inputs = depset(
        [ctx.file.src],
        transitive = [
            cc_toolchain.all_files,
            cc_compile_ctx.headers,
        ],
    )

    ctx.actions.run(
        outputs = [processed_dt_file],
        inputs = cpp_inputs,
        executable = cc_toolchain.preprocessor_executable,
        arguments = [args],
        mnemonic = "DtsPreprocess",
    )

    return [
        DefaultInfo(
            files = depset([processed_dt_file]),
        ),
    ]

devicetree_library = rule(
    implementation = _devicetree_library_impl,
    attrs = {
        "src": attr.label(
            doc = "Label for the top-level devicetree source",
            allow_single_file = True,
            mandatory = True,
        ),
        "deps": attr.label_list(
            doc = "Devicetree dependencies",
            allow_files = True,
        ),
    },
    toolchains = ["@rules_cc//cc:toolchain_type"],
)
