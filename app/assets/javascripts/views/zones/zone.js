Jeu.Views.ZoneView = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  events: {"click .zone": "selectZone"},
  
  selectZone: function(event) {
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
    console.log(Jeu.region.get("fleets").where({"zone_id":4}));
  },
  render: function() {
    this.$el.append($(this.templates['icon'](this.model.toJSON())));
  }
});
