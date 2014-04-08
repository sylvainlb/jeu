# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140408131054) do

  create_table "building_types", :force => true do |t|
    t.float    "cycle_time"
    t.string   "name"
    t.string   "icon_name"
    t.integer  "resource_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "fleets", :force => true do |t|
    t.integer  "nb_vehicle"
    t.integer  "vehicle_type_id"
    t.integer  "zone_id"
    t.integer  "current_route_id"
    t.datetime "arrival"
    t.datetime "departure"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "fleets", ["current_route_id"], :name => "index_fleets_on_current_route_id"
  add_index "fleets", ["vehicle_type_id"], :name => "index_fleets_on_vehicle_type_id"
  add_index "fleets", ["zone_id"], :name => "index_fleets_on_zone_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "regions", ["user_id"], :name => "index_regions_on_user_id"

  create_table "resource_types", :force => true do |t|
    t.string   "name"
    t.string   "icon_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "volume"
  end

  create_table "stocks", :force => true do |t|
    t.integer  "zone_id"
    t.integer  "resource_type_id"
    t.integer  "nb_resource"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "stocks", ["resource_type_id"], :name => "index_stocks_on_resource_type_id"
  add_index "stocks", ["zone_id"], :name => "index_stocks_on_zone_id"

  create_table "transport_routes", :force => true do |t|
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "fleet_id"
    t.integer  "resource_type_id"
    t.integer  "quantity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "transport_routes", ["destination_id"], :name => "index_transport_routes_on_destination_id"
  add_index "transport_routes", ["fleet_id"], :name => "index_transport_routes_on_fleet_id"
  add_index "transport_routes", ["origin_id"], :name => "index_transport_routes_on_origin_id"
  add_index "transport_routes", ["resource_type_id"], :name => "index_transport_routes_on_resource_type_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vehicle_types", :force => true do |t|
    t.integer  "capacity"
    t.float    "speed"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "zones", :force => true do |t|
    t.integer  "region_id"
    t.integer  "building_type_id"
    t.integer  "coordX"
    t.integer  "coordY"
    t.datetime "next_production_time"
    t.datetime "production_start_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "zones", ["building_type_id"], :name => "index_zones_on_building_type_id"
  add_index "zones", ["region_id"], :name => "index_zones_on_region_id"

end
