const rl = @cImport({
    @cInclude("raylib.h");
});

pub const Core = struct {
    should_close: bool = false,

    pub fn init(width: i32, height: i32, fps: i32, title: [*c]const u8) Core {
        rl.InitWindow(width, height, title);
        rl.SetTargetFPS(fps);
        rl.SetExitKey(rl.KEY_F3);
        return Core{
            .should_close = false,
        };
    }

    pub fn step(self: *Core) void {
        if (self.should_close) {
            rl.CloseWindow();
        }
        self.draw();
        if (rl.WindowShouldClose()) {
            self.should_close = true;
        }
    }

    pub fn draw(self: Core) void {
        _ = self;
        rl.BeginDrawing();
        rl.ClearBackground(rl.RAYWHITE);
        rl.DrawText("Congrats! You created your first window!", 190, 200, 20, rl.LIGHTGRAY);
        rl.EndDrawing();
    }
};
