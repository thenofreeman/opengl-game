SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
LIB_DIR = lib

# Paths to the Freeze project
FREEZE_DIR = ../Freeze
FREEZE_INCLUDE_DIR = $(FREEZE_DIR)/include
FREEZE_LIB_DIR = $(FREEZE_DIR)/build

# Paths to glad and GLFW (these should match those in the Freeze Makefile)
GLAD_INCLUDE_DIR = $(FREEZE_DIR)/lib/glad/include
GLFW_INCLUDE_DIR = $(FREEZE_DIR)/lib/glfw/include

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

OUTPUT = game

CXX = g++

WARN_FLAGS = -Wall -Wextra
CXXSTD = -std=c++17

# Add Freeze, glad, and GLFW include paths
CXXFLAGS = $(WARN_FLAGS) $(CXXSTD) -I$(INCLUDE_DIR) -I$(FREEZE_INCLUDE_DIR) -I$(GLAD_INCLUDE_DIR) -I$(GLFW_INCLUDE_DIR)

# Ensure that the linker knows where to find libFreeze.a and required system libraries
LDFLAGS = -L$(FREEZE_LIB_DIR) -lFreeze -lGL -lglfw -ldl

TARGET = $(BUILD_DIR)/$(OUTPUT)

.PHONY: all clean

all: $(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

$(TARGET): $(OBJS)
	$(CXX) -o $@ $(OBJS) $(LDFLAGS)

clean:
	rm -rf $(BUILD_DIR) $(LIB_DIR)
