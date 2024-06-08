LIB_NAME = freeze

LIB_DIR = ../Freeze
LIB_SRC_DIR = $(LIB_DIR)/src
LIB_INCLUDE_DIR = $(LIB_DIR)/include
LIB_BUILD_DIR = $(LIB_DIR)/build

LIB_SRCS = $(wildcard $(LIB_SRC_DIR)/*.cpp)
LIB_OBJS = $(patsubst $(LIB_SRC_DIR)/%.cpp, $(LIB_BUILD_DIR)/%.o, $(LIB_SRCS))

LIB_STATIC = $(LIB_BUILD_DIR)/lib$(LIB_NAME).a

SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

OUTPUT = game

CXX = g++
AR = ar

WARN_FLAGS = -Wall -Wextra
CXXSTD = -std=c++17
CXXFLAGS = $(WARN_FLAGS) $(CXXSTD) -I$(INCLUDE_DIR) -I$(LIB_INCLUDE_DIR)

TARGET = $(BUILD_DIR)/$(OUTPUT)

.PHONY: all clean

all: $(TARGET)

$(LIB_STATIC): $(LIB_OBJS) | $(LIB_BUILD_DIR)
	$(AR) rcs $@ $^

$(LIB_BUILD_DIR)/%.o: $(LIB_SRC_DIR)/%.cpp | $(LIB_BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(LIB_BUILD_DIR):
	mkdir -p $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

$(TARGET): $(OBJS) $(LIB_STATIC)
	$(CXX) -g -o $@ $(OBJS) -L$(LIB_BUILD_DIR) -l$(LIB_NAME)

clean:
	rm -rf $(BUILD_DIR) $(LIB_BUILD_DIR)
