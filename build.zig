const std = @import("std");

const builtin = @import("builtin");
const uf2 = @import("deps/uf2/src/main.zig");
const rp2040 = @import("deps/rp2040/build.zig");

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    var exe = rp2040.addPiPicoExecutable(
        b,
        "zig-e-paper",
        "src/main.zig",
        .{},
    );
    exe.setBuildMode(mode);

    const uf2_step = uf2.Uf2Step.create(exe.inner, .{
        .family_id = .RP2040,
    });
    uf2_step.install();

    exe.install();
}
