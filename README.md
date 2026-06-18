# Tetris (C++ & Raylib)

A fully functional, cross-platform implementation of the classic arcade game Tetris, developed using modern C++ and the Raylib graphics library. This project serves as a practical demonstration of object-oriented design, game loop architecture, and granular version control management.

---

## Features

* **Classic Gameplay Mechanics:** Complete implementation of Tetromino random generation, rotational matrices, matrix boundary collision checks, and line-clearing algorithms.
* **Dynamic Scoring System:** Real-time score tracking and adaptive gameplay scaling.
* **Modular Architecture:** Clean separation of concerns between game state controllers, individual rendering contexts, and foundational data structures.
* **Responsive Input Controls:** Minimal-latency event handling mapping keyboard inputs directly to real-time block transformations.

---

## Technical Stack

* **Language:** C++11 (or higher)
* **Graphics Library:** Raylib
* **Operating System Support:** macOS (Native Clang/LLVM compilation)

---

## Project Structure

```text
├── README.md               # Project documentation and build guide
└── src/                    # Source directory containing implementation files
    ├── main.cpp            # Application entry point and window rendering loop
    ├── game.h / .cpp       # Main game state logic, input handling, and collision loops
    ├── grid.h / .cpp       # Game board matrix configuration and line-clearing mechanisms
    ├── block.h / .cpp      # Abstract base class for Tetromino operations
    ├── blocks.cpp          # Concrete definition of the 7 classic Tetromino shapes
    ├── position.h / .cpp   # Utility structures for 2D coordinate tracking
    └── colors.h / .cpp     # Color palette configurations for game assets