Jeu.Views.ZoneView = Backbone.View.extend({
  templates: {
    icon: JST['zones/icon'],
    menu: JST['zones/menu'],
  },
  selectZone: function() {
    var self = this;

    $("#panel").html( this.templates['menu'] ( this.model.toJSON() ) );

    var form = $('#fleet_form');
    form.on('submit', function(){
      var newFleet = Jeu.region.get("fleets").create( form.serializeObject(), {success: function() {
        Jeu.region.get( 'fleets' ).push( newFleet );
        self.selectZone();
      }});
    });
    
    $('.zone.active').removeClass('active');
    this.$el.find('.zone').addClass('active');
  },
  render: function() {
    this.el.id = "zone_"+this.model.get("id");
    this.$el.html(this.templates['icon'](this.model.toJSON()));
  }
});
