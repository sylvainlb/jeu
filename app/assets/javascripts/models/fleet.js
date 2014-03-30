Jeu.Models.Fleet = Backbone.Model.extend({
  url: "/fleets",
  toJSON: function() {
    var attr = Backbone.Model.prototype.toJSON.call(this);
    attr.transportRoutes = Jeu.region.get("transportRoutes").where({fleet_id:this.id});
    return attr;
  }
});
