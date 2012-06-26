# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Equal column heights
equalHeight = (group) ->
  tallest = 0
  group.each ->
    thisHeight = $(this).height()
    tallest = thisHeight  if thisHeight > tallest

  group.height tallest

jQuery ->
  equalHeight $(".column")
	
mce_preload_check = ->
  return  if mce_preload_checks > 40
  mce_preload_checks++
  try
    jqueryLoaded = jQuery
  catch err
    setTimeout "mce_preload_check();", 250
    return
  try
    validatorLoaded = jQuery("#fake-form").validate({})
  catch err
    setTimeout "mce_preload_check();", 250
    return
  mce_init_form()
mce_init_form = ->
  jQuery(document).ready ($) ->
    options =
      errorClass: "mce_inline_error"
      errorElement: "div"
      onkeyup: ->

      onfocusout: ->

      onblur: ->

    mce_validator = $("#mc-embedded-subscribe-form").validate(options)
    $("#mc-embedded-subscribe-form").unbind "submit"
    options =
      url: "http://blackdogproperty.us5.list-manage1.com/subscribe/post-json?u=fa9353b7959aaf62d351360d8&id=2965719181&c=?"
      type: "GET"
      dataType: "json"
      contentType: "application/json; charset=utf-8"
      beforeSubmit: ->
        $("#mce_tmp_error_msg").remove()
        $(".datefield", "#mc_embed_signup").each ->
          txt = "filled"
          fields = new Array()
          i = 0
          $(":text", this).each ->
            fields[i] = this
            i++

          $(":hidden", this).each ->
            bday = false
            if fields.length is 2
              bday = true
              fields[2] = value: 1970
            if fields[0].value is "MM" and fields[1].value is "DD" and (fields[2].value is "YYYY" or (bday and fields[2].value is 1970))
              @value = ""
            else if fields[0].value is "" and fields[1].value is "" and (fields[2].value is "" or (bday and fields[2].value is 1970))
              @value = ""
            else
              if /\[day\]/.test(fields[0].name)
                @value = fields[1].value + "/" + fields[0].value + "/" + fields[2].value
              else
                @value = fields[0].value + "/" + fields[1].value + "/" + fields[2].value

        mce_validator.form()

      success: mce_success_cb

    $("#mc-embedded-subscribe-form").ajaxForm options
mce_success_cb = (resp) ->
  $("#mce-success-response").hide()
  $("#mce-error-response").hide()
  if resp.result is "success"
    $("#mce-" + resp.result + "-response").show()
    $("#mce-" + resp.result + "-response").html resp.msg
    $("#mc-embedded-subscribe-form").each ->
      @reset()
  else
    index = -1
    msg = undefined
    try
      parts = resp.msg.split(" - ", 2)
      if parts[1] is `undefined`
        msg = resp.msg
      else
        i = parseInt(parts[0])
        if i.toString() is parts[0]
          index = parts[0]
          msg = parts[1]
        else
          index = -1
          msg = resp.msg
    catch e
      index = -1
      msg = resp.msg
    try
      if index is -1
        $("#mce-" + resp.result + "-response").show()
        $("#mce-" + resp.result + "-response").html msg
      else
        err_id = "mce_tmp_error_msg"
        html = "<div id=\"" + err_id + "\" style=\"" + err_style + "\"> " + msg + "</div>"
        input_id = "#mc_embed_signup"
        f = $(input_id)
        if ftypes[index] is "address"
          input_id = "#mce-" + fnames[index] + "-addr1"
          f = $(input_id).parent().parent().get(0)
        else if ftypes[index] is "date"
          input_id = "#mce-" + fnames[index] + "-month"
          f = $(input_id).parent().parent().get(0)
        else
          input_id = "#mce-" + fnames[index]
          f = $().parent(input_id).get(0)
        if f
          $(f).append html
          $(input_id).focus()
        else
          $("#mce-" + resp.result + "-response").show()
          $("#mce-" + resp.result + "-response").html msg
    catch e
      $("#mce-" + resp.result + "-response").show()
      $("#mce-" + resp.result + "-response").html msg
fnames = new Array()
ftypes = new Array()
fnames[0] = "EMAIL"
ftypes[0] = "email"
fnames[1] = "FNAME"
ftypes[1] = "text"
fnames[2] = "LNAME"
ftypes[2] = "text"
fnames[3] = "YCOUNTRY"
ftypes[3] = "dropdown"
try
  jqueryLoaded = jQuery
  jqueryLoaded = true
catch err
  jqueryLoaded = false
head = document.getElementsByTagName("head")[0]
unless jqueryLoaded
  script = document.createElement("script")
  script.type = "text/javascript"
  script.src = "http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"
  head.appendChild script
  if script.readyState and script.onload isnt null
    script.onreadystatechange = ->
      mce_preload_check()  if @readyState is "complete"
script = document.createElement("script")
script.type = "text/javascript"
script.src = "http://downloads.mailchimp.com/js/jquery.form-n-validate.js"
head.appendChild script
err_style = ""
try
  err_style = mc_custom_error_style
catch e
  err_style = "#mc_embed_signup input.mce_inline_error{border-color:#6B0505;} #mc_embed_signup div.mce_inline_error{margin: 0 0 1em 0; padding: 5px 10px; background-color:#6B0505; font-weight: bold; z-index: 1; color:#fff;}"
head = document.getElementsByTagName("head")[0]
style = document.createElement("style")
style.type = "text/css"
if style.styleSheet
  style.styleSheet.cssText = err_style
else
  style.appendChild document.createTextNode(err_style)
head.appendChild style
setTimeout "mce_preload_check();", 250
mce_preload_checks = 0