const std = @import("std");
const microzig = @import("microzig");
const rp2040 = microzig.hal;
const gpio = rp2040.gpio;

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

pub fn init() Pins(config) {
    // stdio_init_all();

    const pins = pin_config.apply();
    pins.EPD_DC_PIN.put(1);
    // gpio.put(pins.EPD_DC_PIN, 1);
    // spi_init(SPI_PORT, 4000 * 1000);

    // gpio.setFunction(pin_config.GPIO10, .spi);
    // gpio.setFunction(pin_config.GPIO11, .spi);

    // printf("DEV_Module_Init OK \r\n");
    return pins;
}
