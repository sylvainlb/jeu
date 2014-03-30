Jeu.Routers.Zones = Backbone.Router.extend({
  routes: {
    "zones/:zone_id": "selectZone",
  },
  selectZone: function(zone_id) {
    (new Jeu.Views.ZonesIndex).selectZone(zone_id);
  },
})
