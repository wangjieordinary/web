!function(e,t){"use strict";function i(){function t(){if(!b.find("#lightbox").length){var e=s.createElement("div");e.id="lightbox",e.className="lightbox",l.appendChild(e),b.hasClass(d.boxOn)||(l.className+=" "+d.boxOn)}}function i(){var e=s.getElementById("lightbox");e&&(l.removeChild(e),b.removeClass(d.boxOn))}function o(){var t=e(".highlight").find("a"),i=e("#orbit-bar-nav-main-site");t.length&&i.text(t.text())}function n(t){var i=e(t);e(".orbit-bar-nav-dropdown");e.each(i,function(t){e(this).next(".orbit-bar-nav-dropdown").length&&(t=s.createElement("i"),t.className="orbit-bar-nav-caret fa fa-caret-down",e(this).append(t))})}function a(t){var i=e(t),o=(e(".orbit-bar-nav").find("a"),e(".orbit-bar-nav-dropdown")),n=e(".orbit-bar-nav-caret");e(window).width()<d.breakPoint&&e.each(n,function(){e(this).on("click",function(t){return e(this).parent("a").hasClass(d.openKls)?e(this).parent("a").removeClass(d.openKls).next(".orbit-bar-nav-dropdown").removeClass(d.openKls):(i.removeClass(d.openKls),o.removeClass(d.openKls),e(this).parent("a").addClass(d.openKls).next(".orbit-bar-nav-dropdown").addClass(d.openKls)),!1})})}function r(){function t(){var t=c.find(".orbit-bar-nav"),i=["回首頁","Home"],o=e('<li class="orbit-bar-nav-item"><a class="get-back-home orbit-bar-link" href="/"></a></li>');"zh-tw"===h?o.find(".get-back-home").append(i[0]):o.find(".get-back-home").append(i[1]),t.prepend(o)}function i(){c.find(".get-back-home").parent(".orbit-bar-nav-item").remove()}function o(){b.on("click",function(o){e(this).hasClass(d.openKls)?(e(this).removeClass(d.openKls).find("i").attr("class","fa fa-bars"),r.removeClass(d.openKls),i()):(e(this).addClass(d.openKls).find("i").attr("class","fa fa-times"),r.addClass(d.openKls),t()),o.preventDefault()})}function n(){e(window).width()<d.breakPoint&&m===!1?(f.hasClass("fa-times")||(f.attr("class","fa fa-bars"),o(),a(".orbit-bar-nav .orbit-bar-link")),m=!0):e(window).width()>d.breakPoint&&m===!0&&(f.attr("class","fa fa-home"),m=!1,b.off("click"))}var r=(c.find(".orbit-bar-nav-search"),c.find(".orbit-bar-inner"),e(".orbit-bar-nav")),b=c.find(".home"),f=b.find("i"),m=!1,p=-1;if(e(window).width()<d.breakPoint){var g=s.createElement("span"),u=null,w=c.find(".orbit-bar-service-mobile"),C=e(".service-center-txt");f.attr("class","fa fa-bars"),o(),a(".orbit-bar-link"),C.hasClass("service-user-in")&&(l.className+="user-in",g.className="service-username-mobile",u=e(g).text(e(".service-user-in").text()),w.append(u))}e(window).resize(function(){clearTimeout(p),p=setTimeout(n,500)});var K=new v({container:".orbit-bar-service-mobile, .service",toggle:".orbit-bar-service-mobile",list:".service"},{arr:["#orbit-bar-search-mobile",".orbit-bar-nav","#orbit-bar-site-logo",".region",".home"]});K.init()}var s=document,l=s.body,b=e("body"),c=e("#orbitBar"),h=(e(window).width(),s.documentElement.lang),d={openKls:"open",showKls:"show",boxOn:"lightbox-on",breakPoint:980},v=function(e,t){var i=this;this.container=c.find(e.container),this.toggle=c.find(e.toggle),this.list=c.find(e.list),this.boxDisable=e.boxDisable||!1,this.rmEls=t.arr,this.getThat=function(){return i}};v.prototype.addKlass=function(){this.toggle.addClass(d.openKls),this.list.addClass(d.openKls),b.addClass(d.boxOn),this.boxDisable!==!0&&t()},v.prototype.removeKlass=function(){this.toggle.removeClass(d.openKls),this.list.removeClass(d.openKls),b.removeClass(d.boxOn),i()},v.prototype.removeElsKlass=function(){e.each(this.rmEls,function(t){e(this).removeClass(d.openKls)})},v.prototype.removeBox=function(t){e(t).remove()},v.prototype.resetIcon=function(){c.find(".home i").attr("class","fa fa-bars")},v.prototype.close=function(){var e=this.getThat();b.on("click",function(){e.removeKlass()}),this.container.on("click",function(e){e.stopPropagation()})},v.prototype.toggleDropdown=function(){var t=this.getThat();this.toggle&&this.list&&this.toggle.on("click",function(i){t.removeElsKlass(),t.removeBox("#lightbox"),t.rmEls.indexOf(".home")&&e(window).width()<d.breakPoint&&t.resetIcon(),t.toggle.hasClass(d.openKls)?t.removeKlass():t.addKlass(),i.preventDefault()})},v.prototype.init=function(){this.toggleDropdown(),this.close()};var f=new v({container:"#orbit-bar-nav-main-site, .region",toggle:"#orbit-bar-nav-main-site",list:".region"},{arr:[".service-center, .service, .home, .orbit-bar-nav, .orbit-bar-service-mobile"]});f.init();var m=new v({container:".service-center, .service",toggle:".service-center",list:".service"},{arr:[".region, #orbit-bar-nav-main-site, #orbit-bar-site-logo, .home, .orbit-bar-nav"]});m.init(),n(".orbit-bar-nav .orbit-bar-link"),o(),r()}e(document).ready(function(){i(),e("html").removeClass("no-fouc")})}(jQuery);