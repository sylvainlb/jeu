Jeu.Routers.Fleets = Backbone.Router.extend({
  routes: {
    "fleets/:fleet_id": "selectFleet"
  },
  selectFleet: function(fleet_id) {
    new Jeu.Views.FleetsIndex({
      collection: Jeu.region.get("fleets"), 
      el: $("#map")
    }).selectFleet(fleet_id);
  },
});
