const std = @import("std");
const microzig = @import("microzig");
const rp2040 = microzig.hal;
const time = rp2040.time;
// const config = @import("config.zig");

const pin_config = rp2040.pins.GlobalConfiguration{
    .GPIO8 = .{ .name = "EPD_DC_PIN", .direction = .out },
    .GPIO9 = .{ .name = "EPD_CS_PIN", .direction = .out },
    .GPIO10 = .{
        .name = "EPD_CLK_PIN",
        .function = .SIO, //.SPI,
        .direction = .out, //.in?
    },
    .GPIO11 = .{
        .name = "EPD_MOSI_PIN",
        .function = .SIO, //.SPI,
        .direction = .out, //.in?
    },
    .GPIO12 = .{ .name = "EPD_RST_PIN", .direction = .out },
    .GPIO13 = .{ .name = "EPD_BUSY_PIN", .direction = .in },
    .GPIO25 = .{
        .name = "led",
        .direction = .out,
    },
};

pub fn main() !void {
    const pins = pin_config.apply();
    pins.EPD_DC_PIN.put(1);

    while (true) {
        pins.led.toggle();
        time.sleepMs(2000);
    }
}
