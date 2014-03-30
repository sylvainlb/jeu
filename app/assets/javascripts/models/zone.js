Jeu.Models.Zone = Backbone.Model.extend({
  defaults: {
      coordX: 0,
      coordY: 0,
      type: ""
  },
  toJSON: function() {
    var attr = Backbone.Model.prototype.toJSON.call(this);
    attr.fleets = Jeu.region.get("fleets").where({zone_id:this.id});
    return attr;
  }
});
