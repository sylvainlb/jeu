Jeu.Routers.Zones = Backbone.Router.extend({
  routes: {
    "zones/:id": "selectZone"
  },
  selectZone: function(id) {
    Jeu.region.get("view").selectZone(id);
  }
})
