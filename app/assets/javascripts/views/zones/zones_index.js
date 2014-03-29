Jeu.Views.ZonesIndex = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  
  events: {"click .zone" : "selectZone"},
  selectZone: function(event) {
    console.log(this.model.toJSON());
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
  },
  render: function() {
    this.$el.append($(this.templates['icon'](this.model.toJSON())));
  }
});
