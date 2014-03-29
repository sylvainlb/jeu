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

ActiveRecord::Schema.define(:version => 20140329181530) do

  create_table "building_types", :force => true do |t|
    t.float    "output"
    t.string   "name"
    t.string   "iconName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fleets", :force => true do |t|
    t.integer  "nbVehicule"
    t.integer  "vehicleType_id"
    t.integer  "zone_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "fleets", ["vehicleType_id"], :name => "index_fleets_on_vehicleType_id"
  add_index "fleets", ["zone_id"], :name => "index_fleets_on_zone_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resource_types", :force => true do |t|
    t.string   "name"
    t.string   "iconName"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stocks", :force => true do |t|
    t.integer  "zone_id"
    t.integer  "nbResource"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stocks", ["zone_id"], :name => "index_stocks_on_zone_id"

  create_table "vehicle_types", :force => true do |t|
    t.integer  "capacity"
    t.float    "speed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "zones", :force => true do |t|
    t.integer  "region_id"
    t.integer  "buildingType_id"
    t.integer  "coordX"
    t.integer  "coordY"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "zones", ["buildingType_id"], :name => "index_zones_on_buildingType_id"
  add_index "zones", ["region_id"], :name => "index_zones_on_region_id"

end
