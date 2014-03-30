Jeu.Views.ZoneView = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  
  selectZone: function() {
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
  },
  render: function() {
    this.$el.append($(this.templates['icon'](this.model.toJSON())));
  }
});
