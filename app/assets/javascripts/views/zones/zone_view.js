Jeu.Views.ZoneView = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  selectZone: function() {
    $("#panel").html(this.templates['menu'](this.model.toJSON()));
    $('.zone.active').removeClass('active');
    this.$el.find('.zone').addClass('active');
  },
  render: function() {
    this.el.id = "zone_"+this.model.get("id");
    this.$el.html(this.templates['icon'](this.model.toJSON()));
  }
});
