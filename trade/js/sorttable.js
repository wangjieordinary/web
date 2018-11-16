function sortables_init(){if(document.getElementsByTagName)for(tbls=document.getElementsByTagName("table"),ti=0;ti<tbls.length;ti++)thisTbl=tbls[ti],-1!=(" "+thisTbl.className+" ").indexOf("sortable")&&thisTbl.id&&ts_makeSortable(thisTbl)}function ts_makeSortable(t){if(t.rows&&t.rows.length>0)var e=t.rows[0];if(e)for(var r=0;r<e.cells.length;r++){var s=e.cells[r],n=ts_getInnerText(s);s.innerHTML='<a href="#" class="sortheader" onclick="ts_resortTable(this);return false;">'+n+'<span class="sortarrow">&nbsp;&nbsp;&nbsp;</span></a>'}}function ts_getInnerText(t){if("string"==typeof t)return t;if("undefined"==typeof t)return t;if(t.innerText)return t.innerText;for(var e="",r=t.childNodes,s=r.length,n=0;s>n;n++)switch(r[n].nodeType){case 1:e+=ts_getInnerText(r[n]);break;case 3:e+=r[n].nodeValue}return e}function ts_resortTable(t){for(var e,r=0;r<t.childNodes.length;r++)t.childNodes[r].tagName&&"span"==t.childNodes[r].tagName.toLowerCase()&&(e=t.childNodes[r]);var s=(ts_getInnerText(e),t.parentNode),n=s.cellIndex,a=getParent(s,"TABLE");if(!(a.rows.length<=1)){var o=ts_getInnerText(a.rows[1].cells[n]);sortfn=ts_sort_caseinsensitive,o.match(/^\d\d[\/-]\d\d[\/-]\d\d\d\d$/)&&(sortfn=ts_sort_date),o.match(/^\d\d[\/-]\d\d[\/-]\d\d$/)&&(sortfn=ts_sort_date),o.match(/^[�$]/)&&(sortfn=ts_sort_currency),o.match(/^[\d\.]+$/)&&(sortfn=ts_sort_numeric),SORT_COLUMN_INDEX=n;var l=new Array,b=new Array;for(i=0;i<a.rows[0].length;i++)l[i]=a.rows[0][i];for(j=1;j<a.rows.length;j++)b[j-1]=a.rows[j];for(b.sort(sortfn),"down"==e.getAttribute("sortdir")?(ARROW="&nbsp;&nbsp;&uarr;",b.reverse(),e.setAttribute("sortdir","up")):(ARROW="&nbsp;&nbsp;&darr;",e.setAttribute("sortdir","down")),i=0;i<b.length;i++)(!b[i].className||b[i].className&&-1==b[i].className.indexOf("sortbottom"))&&a.tBodies[0].appendChild(b[i]);for(i=0;i<b.length;i++)b[i].className&&-1!=b[i].className.indexOf("sortbottom")&&a.tBodies[0].appendChild(b[i]);for(var d=document.getElementsByTagName("span"),r=0;r<d.length;r++)"sortarrow"==d[r].className&&getParent(d[r],"table")==getParent(t,"table")&&(d[r].innerHTML="&nbsp;&nbsp;&nbsp;");e.innerHTML=ARROW}}function getParent(t,e){return null==t?null:1==t.nodeType&&t.tagName.toLowerCase()==e.toLowerCase()?t:getParent(t.parentNode,e)}function ts_sort_date(t,e){return aa=ts_getInnerText(t.cells[SORT_COLUMN_INDEX]),bb=ts_getInnerText(e.cells[SORT_COLUMN_INDEX]),10==aa.length?dt1=aa.substr(6,4)+aa.substr(3,2)+aa.substr(0,2):(yr=aa.substr(6,2),parseInt(yr)<50?yr="20"+yr:yr="19"+yr,dt1=yr+aa.substr(3,2)+aa.substr(0,2)),10==bb.length?dt2=bb.substr(6,4)+bb.substr(3,2)+bb.substr(0,2):(yr=bb.substr(6,2),parseInt(yr)<50?yr="20"+yr:yr="19"+yr,dt2=yr+bb.substr(3,2)+bb.substr(0,2)),dt1==dt2?0:dt1<dt2?-1:1}function ts_sort_currency(t,e){return aa=ts_getInnerText(t.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,""),bb=ts_getInnerText(e.cells[SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,""),parseFloat(aa)-parseFloat(bb)}function ts_sort_numeric(t,e){return aa=parseFloat(ts_getInnerText(t.cells[SORT_COLUMN_INDEX])),isNaN(aa)&&(aa=0),bb=parseFloat(ts_getInnerText(e.cells[SORT_COLUMN_INDEX])),isNaN(bb)&&(bb=0),aa-bb}function ts_sort_caseinsensitive(t,e){return aa=ts_getInnerText(t.cells[SORT_COLUMN_INDEX]).toLowerCase(),bb=ts_getInnerText(e.cells[SORT_COLUMN_INDEX]).toLowerCase(),aa==bb?0:aa<bb?-1:1}function ts_sort_default(t,e){return aa=ts_getInnerText(t.cells[SORT_COLUMN_INDEX]),bb=ts_getInnerText(e.cells[SORT_COLUMN_INDEX]),aa==bb?0:aa<bb?-1:1}function addEvent(t,e,r,s){if(t.addEventListener)return t.addEventListener(e,r,s),!0;if(t.attachEvent){var n=t.attachEvent("on"+e,r);return n}alert("Handler could not be removed")}addEvent(window,"load",sortables_init);var SORT_COLUMN_INDEX;