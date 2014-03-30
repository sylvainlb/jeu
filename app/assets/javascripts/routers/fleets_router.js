Jeu.Routers.Fleets = Backbone.Router.extend({
  routes: {
    "fleets/:fleet_id": "selectFleet"
  },
  selectFleet: function(fleet_id) {
    new Jeu.Views.ZonesIndex({
      collection: Jeu.region.get("zones"), 
      el: $("#map")
    }).selectZone(fleet_id);
  },
});
