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

ActiveRecord::Schema.define(:version => 20140404111941) do

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
    t.string   "vehicle_type"
    t.integer  "departure_zone_id"
    t.integer  "zone_id"
    t.integer  "region_id"
    t.integer  "current_route_id"
    t.datetime "arrival"
    t.datetime "departure"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "fleets", ["current_route_id"], :name => "index_fleets_on_current_route_id"
  add_index "fleets", ["region_id"], :name => "index_fleets_on_region_id"
  add_index "fleets", ["vehicle_type"], :name => "index_fleets_on_vehicle_type"
  add_index "fleets", ["zone_id"], :name => "index_fleets_on_zone_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "regions", ["user_id"], :name => "index_regions_on_user_id"

  create_table "stocks", :force => true do |t|
    t.integer  "zone_id"
    t.integer  "fleet_id"
    t.string   "resource_type"
    t.integer  "nb_resource"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "stocks", ["fleet_id"], :name => "index_stocks_on_fleet_id"
  add_index "stocks", ["resource_type"], :name => "index_stocks_on_resource_type"
  add_index "stocks", ["zone_id"], :name => "index_stocks_on_zone_id"

  create_table "transport_routes", :force => true do |t|
    t.integer  "action_order"
    t.integer  "destination_id"
    t.integer  "fleet_id"
    t.string   "resource_type"
    t.integer  "quantity"
    t.integer  "next_route_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "transport_routes", ["fleet_id"], :name => "index_transport_routes_on_fleet_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "zones", :force => true do |t|
    t.integer  "region_id"
    t.string   "building_type"
    t.integer  "coordX"
    t.integer  "coordY"
    t.datetime "next_production_time"
    t.datetime "production_start_time"
    t.datetime "last_food_time"
    t.datetime "starving_start_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "zones", ["building_type"], :name => "index_zones_on_building_type"
  add_index "zones", ["region_id"], :name => "index_zones_on_region_id"

end
