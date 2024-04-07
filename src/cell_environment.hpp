#pragma once

#include "nutrient_zone.hpp"

#include <godot_cpp/classes/area2d.hpp>
#include <godot_cpp/classes/packed_scene.hpp>
#include <godot_cpp/classes/random_number_generator.hpp>
#include <godot_cpp/classes/ref.hpp>
#include <godot_cpp/classes/viewport.hpp>

using namespace godot;

class CellEnvironment : public Area2D {
	GDCLASS(CellEnvironment, Area2D)

protected:
	static void _bind_methods();

public:
	CellEnvironment();
	~CellEnvironment();

	void spawnNutrientZone();
	void removeAllNutrientZones();

	void setNutrientZoneScene(const Ref<PackedScene>);
	Ref<PackedScene> getNutrientZoneScene() const;

	void setNNutrientZones(const int);
	int getNNutrientZones() const;

private:
	int _nNutrientZones;
	Ref<PackedScene> _nutrientZoneScene;
};