$(function() {
  function buildHTML(result){
    var html =
      `<option value= ${result.id}>${result.name}</option>`
    return html
  }

  $("#parent").on("change",function(){
    var int = document.getElementById("parent").value
    if(int == 0){
      $('#child').remove();
      $('#item_category_id').remove();
    }else{
      $.ajax({
        url: "/categories",
        type: 'GET',
        dataType: 'json',
        data: {id: int}
      })
      .done(function(categories) {
        var insertHTML = `<select name="child" id="child">
                          <option value=0>---</option>`;
        $.each(categories, function(i, category) {
          insertHTML += buildHTML(category)
        });
        insertHTML += `</select>`
        if($('#child').length){
          $('#child').replaceWith(insertHTML);
          $('#item_category_id').remove();
        } else {
          $('.items__child').append(insertHTML);
        };
      })
      .fail(function() {
      });
    };
  })

  $(document).on("change","#child",function(){
    var intParent = document.getElementById("parent").value
    var intChild = document.getElementById("child").value
    var int = intParent + '/' + intChild
    if(intChild == 0){
      $('#item_category_id').remove();
    } else {
      $.ajax({
        url: "/categories",
        type: 'GET',
        dataType: 'json',
        data: {id: int}
      })
      .done(function(categories) {
        var insertHTML = `<select name="item[category_id]" id="item_category_id">
                          <option value=0>---</option>`;
        $.each(categories, function(i, category) {
          insertHTML += buildHTML(category)
        });
        insertHTML += `</select>`
        if($('#item_category_id').length){
          $('#item_category_id').replaceWith(insertHTML);
        } else {
          $('.items__grandchild').append(insertHTML);
        };
      })
      .fail(function() {
      });
    };
  });
})