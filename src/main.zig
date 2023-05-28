const std = @import("std");

const gui = @import("gui.zig");

pub fn main() !void {
    var gui_core: gui.Core = gui.Core.init(800, 600, 60, "hourglaz");

    while (!gui_core.should_close) {
        gui_core.step();
    }
}
