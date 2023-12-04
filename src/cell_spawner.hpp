#pragma once

#include <godot_cpp/classes/Engine.hpp>
#include <godot_cpp/classes/node.hpp>
#include <godot_cpp/classes/packed_scene.hpp>
#include <godot_cpp/classes/random_number_generator.hpp>
#include <godot_cpp/classes/ref.hpp>
#include <godot_cpp/classes/sprite2d.hpp>
#include <godot_cpp/classes/Viewport.hpp>

namespace godot {

class CellSpawner : public Node { 
	GDCLASS(CellSpawner, Node) 

protected:
    static void _bind_methods();

public:
    CellSpawner();
    ~CellSpawner();

    void _ready() override;

    void setNumCells(const int);
    int getNumCells() const;

    void setCellScene(const Ref<PackedScene>);
    Ref<PackedScene> getCellScene() const;

    void spawnCell();

private:
    Ref<PackedScene> _cellScene;
    Ref<RandomNumberGenerator> rand;
    int _numCells = 1;
};

}