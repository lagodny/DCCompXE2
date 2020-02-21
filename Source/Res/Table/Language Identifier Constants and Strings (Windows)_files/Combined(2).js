epx=window.epx||{},epx.communityContent=function(){function loadComments(){var $communityComments=$("#CommunityComments"),communityContentAddLink;$communityComments&&$communityComments.length!==0&&(communityContentAddLink=$(".communityContentAddLink"),$communityComments.html(""),window.epx.utilities.log("Loading comments..."),$.ajax({type:"GET",async:!0,url:$communityComments.attr("data-url"),dataType:"json",cache:!1,success:function(r){if(!r||r.length<1){window.epx.utilities.log("Comment web service returned 0 comments."),communityContentAddLink.length<1&&$(".communityContentHeaderTitle").css("display","none");return}window.epx.utilities.log("Comment web service returned "+r.length+" comment(s)..."),$("#CommentTemplate").tmpl(r).appendTo($communityComments)}}))}return{loadComments:loadComments}}(),$("#CommunityComments").ready(function(){epx.communityContent.loadComments()});;
epx=window.epx||{},epx.library=window.epx.library||{},epx.library.tocFixedModule=function(w,d){function init(){epx.topic&&epx.topic.isPrintExperience()===!0||($leftNav=$("#leftNav"),$toc=$("#tocnav"),$footer=$("#ux-footer"),w&&d&&$leftNav.length!==0&&$toc.length!==0&&$footer.length!==0)&&($(w).scroll(function(){setPosition()}),$(w).resize(function(){setPosition()}))}function setPosition(){var tocHeight=$toc.height(),nonFooterViewable;$(w).height()>tocHeight&&$(w).scrollTop()>$leftNav.offset().top?($toc.width($leftNav.width()).css("position","fixed"),$leftNav.css("height",$toc.height()),nonFooterViewable=$(d).height()-$footer.height()-$(w).scrollTop()-20,nonFooterViewable>=tocHeight?$toc.css("top","0"):$toc.css("top",(tocHeight-nonFooterViewable)*-1)):($toc.css("width","").css("position","").css("top",""),$leftNav.css("height","auto"))}var $leftNav,$toc,$footer;return{init:init,setPosition:setPosition}},epx.library.tocFixed=epx.library.tocFixedModule(window,document),$(document).ready(function(){epx.library.tocFixed.init()});;
epx=window.epx||{},epx.windowsRating=function(){function init(){$yesNoSection=$("#ux-footer #ratingSection1"),$submitSection=$("#ux-footer #ratingSection2"),$thankYouSection=$("#ux-footer #ratingSection3"),$submitButton=$("#ux-footer #ratingSubmit"),$skipThisButton=$("#ux-footer #ratingSkipThis"),$("#ux-footer #footerSock").show(),toggleRatingEnablement(),setupEventHandlers()}function toggleRatingEnablement(){$("#isTopicRated").val()==="true"&&showSection($thankYouSection)}function setupEventHandlers(){$("#ux-footer #ratingYes").click(function(){$("#ux-footer #ratingValue").val(yesRating),showSection($submitSection)}),$("#ux-footer #ratingNo").click(function(){$("#ux-footer #ratingValue").val(noRating),showSection($submitSection)}),$submitButton.click(function(){submitRating($("#ux-footer div.rating textarea").val())}),$skipThisButton.click(function(){submitRating(null)})}function showSection($section){$yesNoSection.hide(),$submitSection.hide(),$thankYouSection.hide(),$section.show(),$section===$thankYouSection&&($("#rateThisTopic").hide(),$("#rateThisPrefix").hide())}function submitRating(text){$submitButton.attr("disabled","disabled"),$skipThisButton.attr("disabled","disabled");var data={__RequestVerificationToken:$("input[name='__RequestVerificationToken']").last().val(),rdIsUseful:$("#ux-footer #ratingValue").val(),feedbackText:text,returnUrl:window.location.href,isAsync:!0},url=$("#ratingSubmitUrl").val();$.ajax({type:"POST",url:url,data:data,async:!0,success:function(){epx.utilities.log("Rating successfully submitted"),showSection($thankYouSection)},error:function(response){epx.utilities.log("Rating submission failed: HTTP "+response.status),showSection($thankYouSection)}})}var yesRating=1,noRating=0,$yesNoSection,$submitSection,$thankYouSection,$submitButton,$skipThisButton;return{init:init}}(),$(document).ready(function(){epx.windowsRating.init()});;
epx=window.epx||{},epx.codeSnippetModule=function(w,d){function init(){scrollOnLoad(),initCopyLinks()}function initCopyLinks(){w.clipboardData&&$("a[name=CodeSnippetCopyLink]").css("display","block")}function copyCode(id){if(w.clipboardData){var obj=d.getElementById(id);w.clipboardData.setData("Text",obj.innerText)}}function scrollOnLoad(){var hash=location.hash,hashY;hash.length>1&&hash.substr(1,1)==="Y"&&(hashY=Number(hash.substr(2)),isNaN(hashY)||w.scrollTo(0,hashY))}return{init:init,initCopyLinks:initCopyLinks,copyCode:copyCode,scrollOnLoad:scrollOnLoad}},epx.codeSnippet=epx.codeSnippetModule(window,document),$(document).ready(function(){epx.codeSnippet.init()});;
function TopicNotInScope_ShowPicker(){var topicNotInScopePicker=document.getElementById("topicNotInScopeCollectionPicker");topicNotInScopePicker&&(topicNotInScopePicker.style.display=topicNotInScopePicker.style.display!="block"?"block":"none")}function TopicNotInScope_HidePicker(e){var topicNotInScopePicker=document.getElementById("topicNotInScopeCollectionPicker"),src,e;topicNotInScopePicker&&(e=e||window.event,e.target?src=e.target:e.srcElement&&(src=e.srcElement),src.tagName=="A"&&src.parentNode.parentNode&&src.parentNode.parentNode.id=="topicNotInScopeCollectionPicker"||src.id=="topicNotInScopeSwitchCollection"||src.id=="topicNotInScopeDropdownImage"||src.id=="topicNotInScopeSwitchCollectionContainer"||topicNotInScopePicker.style.display!="block"||(topicNotInScopePicker.style.display="none"))}document.addEventListener?document.addEventListener("mouseup",TopicNotInScope_HidePicker,!1):document.attachEvent&&document.attachEvent("onmouseup",TopicNotInScope_HidePicker);;
(typeof(window.MTPS==="undefined")||typeof(window.MTPS.CollapsibleAreas==="undefined"))&&$("a.LW_CollapsibleArea_TitleAhref").live("click",function(){var $this=$(this),$image=$this.children("span").first(),$content=$this.parent().parent().next(),stringsAvailable;$image&&$content&&($this.removeAttr("title"),stringsAvailable=typeof window.MTPS!="undefined"&&typeof window.MTPS.LocalizedStrings!="undefined",$content.attr("class")==="sectionblock"?($image.attr("class","cl_CollapsibleArea_collapsing LW_CollapsibleArea_Img"),$content.attr("class","sectionnone"),stringsAvailable===!0&&$this.attr("title",window.MTPS.LocalizedStrings.ExpandButtonTooltip)):($image.attr("class","cl_CollapsibleArea_expanding LW_CollapsibleArea_Img"),$content.attr("class","sectionblock"),stringsAvailable===!0&&$this.attr("title",window.MTPS.LocalizedStrings.CollapseButtonTooltip)))});;
epx=window.epx||{},epx.versionSelector=function(){function init(){$link&&$arrow&&$list&&($link.live("click",function(){epx.versionSelector.open()}),$arrow.live("click",function(){epx.versionSelector.open()}),$(document).live("mouseup",function(){epx.versionSelector.close()}))}function open(){$list.show()}function close(){$list.hide()}var $link=$("#vsLink"),$arrow=$("#vsArrow"),$list=$("#vsPanel");return{init:init,open:open,close:close}}(),$(document).ready(function(){epx.versionSelector.init()});;
var isMetroIE10=navigator.userAgent.indexOf("MSIE 10.0")!=-1&&window.innerWidth==screen.width&&window.innerHeight==screen.height,brokerScript;isMetroIE10||(brokerScript=document.createElement("script"),brokerScript.src="//js.microsoft.com/library/svy/sto/broker.js",document.getElementsByTagName("head")[0].appendChild(brokerScript));;
