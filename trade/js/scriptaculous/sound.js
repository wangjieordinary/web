Sound={tracks:{},_enabled:!0,template:new Template('<embed style="height:0" id="sound_#{track}_#{id}" src="#{url}" loop="false" autostart="true" hidden="true"/>'),enable:function(){Sound._enabled=!0},disable:function(){Sound._enabled=!1},play:function(t){if(Sound._enabled){var e=Object.extend({track:"global",url:t,replace:!1},arguments[1]||{});e.replace&&this.tracks[e.track]&&($R(0,this.tracks[e.track].id).each(function(t){var a=$("sound_"+e.track+"_"+t);a.Stop&&a.Stop(),a.remove()}),this.tracks[e.track]=null),this.tracks[e.track]?this.tracks[e.track].id++:this.tracks[e.track]={id:0},e.id=this.tracks[e.track].id,$$("body")[0].insert(Prototype.Browser.IE?new Element("bgsound",{id:"sound_"+e.track+"_"+e.id,src:e.url,loop:1,autostart:!0}):Sound.template.evaluate(e))}}},Prototype.Browser.Gecko&&navigator.userAgent.indexOf("Win")>0&&(navigator.plugins&&$A(navigator.plugins).detect(function(t){return-1!=t.name.indexOf("QuickTime")})?Sound.template=new Template('<object id="sound_#{track}_#{id}" width="0" height="0" type="audio/mpeg" data="#{url}"/>'):Sound.play=function(){});