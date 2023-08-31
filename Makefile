CXXFLAGS :=-g -std=c++11 -fsigned-char -DPLATFORM_NAME=\"sdl\" -DPLATFORM_SCREEN_WIDTH=440 -DPLATFORM_SCREEN_HEIGHT=224 -DPLATFORM_MAP_WINDOW_TILES_WIDTH=16 -DPLATFORM_MAP_WINDOW_TILES_HEIGHT=8 -DPLATFORM_INTRO_OPTIONS=3 -DPLATFORM_DEFAULT_CONTROL=3 -DPLATFORM_MODULE_BASED_AUDIO -DPLATFORM_TILE_BASED_RENDERING -DPLATFORM_IMAGE_BASED_TILES -DPLATFORM_IMAGE_SUPPORT -DPLATFORM_SPRITE_SUPPORT -DPLATFORM_COLOR_SUPPORT -DPLATFORM_CURSOR_SUPPORT -DPLATFORM_CURSOR_SHAPE_SUPPORT -DPLATFORM_FADE_SUPPORT -DPLATFORM_LIVE_MAP_SUPPORT -DOPTIMIZED_MAP_RENDERING
LDFLAGS :=

CXXFLAGS += `pkg-config --cflags sdl2`
CXXFLAGS += `pkg-config --cflags SDL2_image`
LDFLAGS += `pkg-config --libs sdl2`
LDFLAGS += `pkg-config --libs SDL2_image`

# Uncomment and modify this line if you want to define a directory there
# game assets will be loaded from if they're not found in the current working
# directory.
CXXFLAGS += -DPLATFORM_ASSETS_DIRECTORY=\"/opt/share/petrobots\"

SOURCES := petrobots.cpp Platform.cpp PlatformSDL.cpp PT2.3A_replay_cia.cpp
OBJECTS := $(SOURCES:.cpp=.o)
TARGET := petrobots

all: $(TARGET) setup

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

setup:
	SDL/setup.sh

clean:
	rm -f $(OBJECTS) $(TARGET)
