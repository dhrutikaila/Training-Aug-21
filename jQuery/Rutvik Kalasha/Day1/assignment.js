var cList = ["India", "United Kingdom", "United States", "Canada", "Japan"];

$(document).ready(function () {
    cList.forEach((country, index) => {
        $("#countries").append($("<option></option>").text(country).val(index));
        $(`#c-${index}`).append(country);
    })

    $("select").change(function () {
        // $("select option:selected")
        $("label span").each(function (index) {
            // console.log($("select option:selected").text())
            if ($("select option:selected").val() == index) {
                $(`#c-${index}`).show();
            }
            else {
                $(`#c-${index}`).hide();
            }
        })
    })

})

