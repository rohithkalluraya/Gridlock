# 1. Project Settings
TARGET      := gridlock
CXX         := g++
# Added -I/opt/homebrew/include for Mac Homebrew support
CXXFLAGS    := -Wall -Wextra -std=c++17 -Iinclude -I/opt/homebrew/include
# Added -L/opt/homebrew/lib for Mac Homebrew support
LDFLAGS     := -L/opt/homebrew/lib
LDLIBS      := -lraylib -framework OpenGL -framework Cocoa -framework IOKit

# 2. Directories
SRC_DIR     := src
OBJ_DIR     := obj
BIN_DIR     := .

# 3. Automatic Discovery
# Updated to look for .h files too, though only .cpp are compiled
SOURCES     := $(shell find $(SRC_DIR) -name '*.cpp')
OBJECTS     := $(SOURCES:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)
DEPS        := $(OBJECTS:.o=.d)

# 4. Build Modes
ifeq ($(DEBUG),1)
    CXXFLAGS += -g -O0 -DDEBUG
    BUILD_MSG := "Building in DEBUG mode..."
else
    CXXFLAGS += -O3 -DNDEBUG
    BUILD_MSG := "Building in RELEASE mode..."
endif

# 5. Phony Targets
.PHONY: all clean directories

all: directories $(BIN_DIR)/$(TARGET)

directories:
	@mkdir -p $(OBJ_DIR)

$(BIN_DIR)/$(TARGET): $(OBJECTS)
	@echo $(BUILD_MSG)
	$(CXX) $(OBJECTS) -o $@ $(LDFLAGS) $(LDLIBS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -MMD -MP -c $< -o $@

-include $(DEPS)

clean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR)/$(TARGET)
	@echo "Cleaned build artifacts."