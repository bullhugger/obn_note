var arr_common_area = [];
var arr_common_area_ori = [];
var arr_units = [];
var arr_unit_type = [];
var arr_type_ori = [];
var num_of_block = 1;
var active_block = 1;

$('#project_block').on("focusout", function(e) {
    $('#project_block_div').siblings(".form-group.row").remove();
    $('#project_unit_type_table').siblings("select").remove();
    num_of_block = $(this).val();
    var block_tab = "<div class=\"tabs-block mb-5\"><ul class=\"nav nav-tabs nav-line-tabs mb-5 fs-6\>";
    var block_select = "<div class=\"form-group row\"><div class=\"col-md-6 col-sm-12\"><select id=\"block_unit_select\" class=\"form-control block_unit_select\">";
    var block_tab_div = "";
    for(block_count = 0; block_count < num_of_block; block_count++) {
        block_number = block_count + 1;
        var active_block = block_number == 1 ? " active" : "";
        block_tab += "<li class=\"nav-item\"><a class=\"nav-link" + active_block + "\" data-bs-toggle=\"tab\" href=\"#kt_block_" + block_number + "\" id=\"block_tab_" + block_number + "\">Block " + block_number + "</a></li>"
        block_tab_div += "<div class=\"tab-content" + active_block + "\" id=\"block_" + block_number + "\"><div class=\"tab-pane fade\" id=\"kt_block_" + block_number + "\" role=\"tabpanel\"></div></div>";
        block_select += "<option value=\"" + block_number + "\">Block " + block_number + "</option>";
    }
    block_tab += "</ul></div>" + block_tab_div;
    block_select += "</select></div></div>";
    $('#project_block_div').before(block_tab);
    $('#project_unit_type_table').before(block_select);
})

$(document).on("click", ".tabs-block .nav-link", function(e) {
    e.preventDefault();
    $('.tabs-block .nav-link.active').removeClass("active");
    $(this).addClass("active");
    var arr_active_block = [];
    var block_selected = $(this).attr("id");
    var arr_block = block_selected.split("_");
    active_block = arr_block[2];
    $('#block_table').empty();
    arr_active_block = MoveToTempArray(active_block);
    var total_level = 0;
    var max_unit_per_level = 0;
    var prefix = "";
    arr_active_block.forEach((unit) => {
        if(unit.floor_level > total_level) {
            total_level = unit.floor_level;
        }
        if(unit.unit_number > max_unit_per_level) {
            max_unit_per_level = unit.unit_number;
        }
        prefix = unit.prefix;
    });
    var project_table = RegenerateUnitTable(arr_active_block, max_unit_per_level, total_level);
    $('#block_table').append(project_table);
})

function MoveToTempArray(active_block) {
    var arr_active_block = [];
    arr_units.forEach((unit) => {
        if(unit.block == active_block) {
            arr_active_block.push({
                prefix: unit.prefix,
                floor_level: unit.floor_level,
                unit_number: unit.unit_number,
                unit_name: unit.unit_name,
                unit_status: unit.unit_status,
                block: unit.block
            })
        }
    });
    return arr_active_block;
}

function RegenerateUnitTable(arr_active_block, max_unit_per_level, total_level) {
    var project_table_header = "<th></th>";
    for(unit_count = 1; unit_count <= max_unit_per_level; unit_count++) {
        project_table_header += "<th>Unit " + unit_count + "</th>";
    }
    var project_table = "<div class=\"table-responsive mb-5\"> \
        <table id=\"table_project\" class=\"table table-striped table-bordered table-hover gy-5 gs-7 dataTable no-footer\"> \
            <thead>";
    project_table += project_table_header + "</thead><tbody>";
    arr_active_block.forEach((unit) => {
        if(unit.unit_number == 1 ) {
            project_table += "<tr><td class=\"col-sm-1\">Lvl " + unit.floor_level + "</td>" + AppendUnitField(unit.floor_level, unit.unit_number, unit.unit_name, unit.unit_status);
        } 
        else { 
            project_table += AppendUnitField(unit.floor_level, unit.unit_number, unit.unit_name, unit.unit_status);
        }
        if(unit.unit_number == max_unit_per_level) {
            project_table += "</tr>";
        }
    })
    project_table += "</tbody> \
            </table> \
        </div> \
    ";
    return project_table;
}

$('#btn-generate-block').on("click", function(e) {
    $('#block_table').empty();
    var prefix             = $("#project_prefix").val();
    var total_level        = parseInt($("#project_level").val());
    var max_unit_per_level = parseInt($("#max_unit_per_level").val());
    var starting_floor     = parseInt($("#starting_floor").val());
    var unit_status        = 1;
    var project_table_header = "<th>Level</th>";
    for(unit_count = 1; unit_count <= max_unit_per_level; unit_count++) {
        project_table_header += "<th>Unit " + unit_count + "</th>";
    }
    var project_table      = "<div class=\"table-responsive mb-5\"> \
        <table id=\"table_project\" class=\"table table-striped table-bordered table-hover gy-5 gs-7 dataTable no-footer\"> \
            <thead>";
    project_table += project_table_header + "</thead> \
            <tbody> \
    ";
    for(level_count = 0; level_count < total_level; level_count++) {
        var floor_level = level_count + starting_floor;
        project_table += "<tr><td class=\"col-sm-1\">Lvl " + floor_level + "</td>";
        for(unit_number = 1; unit_number <= max_unit_per_level; unit_number++) {
            var unit_name = prefix + "-" + floor_level + "-" + unit_number;
            project_table += AppendUnitField(floor_level, unit_number, unit_name, unit_status);
            arr_units.push({
                prefix: prefix,
                floor_level: floor_level,
                unit_number: unit_number,
                unit_name: unit_name,
                unit_status: unit_status,
                block: active_block
            });
        }
        project_table += "</tr> \ ";
    }
    project_table += "</tbody> \
            </table> \
        </div> \
    ";
    $('#block_table').append(project_table);
    console.table(arr_units);
});

function AppendUnitField(floor_level, unit_number, unit_name, unit_status) {
    project_column = "";
    if(unit_status == 1) {
        project_column += "<td class=\"clickable-cell justify-content-center\" data-level=\"" + floor_level + "\" data-unit=\"" + unit_number + "\"> \
            <div class=\"d-flex justify-content-center mt-3 cell-data\" id=\"" + unit_name + "\" edit_type=\"click\" col_name=\"" + unit_name + "\"> " + unit_name + "</div> \
            <span class=\"status-indicator green\" id=\"status-icon-" + unit_name + "\"></span> \
        </td>";
    }
    else {
        project_column += "<td class=\"clickable-cell justify-content-center\" data-level=\"" + floor_level + "\" data-unit=\"" + unit_number + "\"> \
            <div class=\"d-flex justify-content-center mt-3 cell-data\" id=\"" + unit_name + "\" edit_type=\"click\" col_name=\"" + unit_name + "\"> " + unit_name + "</div> \
            <span class=\"status-indicator red\" id=\"status-icon-" + unit_name + "\"></span> \
        </td>";
    }
    return project_column;
}

$(document).on("click" , ".status-indicator", function(e) {
    var unit_name = $(this).closest("td").find(".cell-data").attr("id");
    var status_icon = $('#status-icon-' + unit_name);
    var unit_info = unit_name.split("-");
    var prefix      = unit_info[0];
    var floor_level = unit_info[1];
    var unit_number = unit_info[2];
    if(status_icon.hasClass("green")) {
        status_icon.removeClass('green').addClass('red');
        arr_units.forEach(function (unit) {
            if(unit.floor_level == floor_level && unit.unit_number == unit_number) {
                unit.unit_status = 0;
            }
        })
    }
    else {
        status_icon.removeClass('red').addClass('green');
        arr_units.push({
            prefix: prefix,
            floor_level: floor_level,
            unit_number: unit_number,
            unit_name: $('#' + unit_name).html().trim(),
            unit_status: 1,
            block: active_block
        });
    }
    console.table(arr_units);
})

$(document).on("click", ".cell-data", function(e) {
    var unit_name = $('#' + $(this).attr('id'));
    MakeEditable(unit_name);
})

$(document).on("focusout", ".cell-data", function(e) {
    var unit_name = $(this).attr('id');
    var col_val = $(this).html();
    $('#' + unit_name).removeAttr("data-bs-toggle").removeAttr("data-bs-content");
    if(col_val == "") {
        AddPopoverWarning(unit_name);
        return;
    }
    DisableEditing(unit_name);
    UpdateCellName(unit_name, $(this));
})

function MakeEditable(unit_name) {
    unit_name
        .attr("contenteditable", "true")
        .addClass("bg-warning")
        .css("padding", "3px")
        .focus();
}

function AddPopoverWarning(unit_name) {
    $('#' + unit_name).attr("data-bs-toggle", "popover").attr("data-bs-content", "Name can not be empty.");
    $('#' + unit_name).popover("show");
    $('#' + unit_name).focus();
}

function DisableEditing(unit_name) {
    $('#' + unit_name)
        .attr("contenteditable", "false")
        .removeClass("bg-warning")
        .css("padding", "")
        .popover('hide');
}

function UpdateCellName(unit_name, unit_location) {
    var unit_cell = $('#' + unit_name);
    var unit_info = unit_name.split("-");
    var prefix      = unit_info[0];
    var floor_level = unit_info[1];
    var unit_number = unit_info[2];
    arr_units.forEach(function(unit) {
        if(unit.floor_level == floor_level && unit.unit_number == unit_number) {
            unit.unit_name = unit_location.html();
        }
    });
    console.table(arr_units);
}

function LoadTableType() {
    const file_input = document.getElementById("project_type_csv");
    const file = file_input.files[0];
    let reader = new FileReader();
    reader.readAsText(file);
    reader.onload = function(e) {
        var csv_data = e.target.result;
        arr_unit_type = csv_data.split(",").map(function(unit) {
            return { name: unit.trim(), type_id: 1, status:1 };
        });
        arr_type_ori = Array.from(arr_unit_type);
        console.table(arr_unit_type);
        if(arr_unit_type.length <= 0) {
            alert("No content in file!");
        }
        var type_table = "<div class=\"table-responsive mb-5\"> \
        <table id=\"table_type\" class=\"table table-striped table-bordered table-hover gy-5 gs-7 dataTable no-footer\"> \
            <thead> \
                <tr> \
        ";
        type_table += LoadTableTypeCol(arr_unit_type);
        $('#project_unit_table').append(type_table);
        $('#project_unit_table').append("<button type=\"button\" class=\"btn btn-sm btn-warning mb-3\" onclick=\"LoadTableTypeRow();\"><i class=\"fa-solid fa-plus\"></i></button>");
    };
    console.table(arr_unit_type);
}

function LoadDropdownCommonArea() {
    const file_input = document.getElementById("project_common_area_csv");
    const file = file_input.files[0];
    let reader = new FileReader();
    reader.readAsText(file);
    reader.onload = function(e) {
        var csv_data = e.target.result;
        arr_common_area = csv_data.split(",").map(function(common_area) {
            return { title: common_area.trim(), status:0, floor_level:1 };
        });
        arr_common_area_ori = Array.from(arr_common_area);
        console.table(arr_common_area);
        if(arr_common_area.length <= 0) {
            alert("No content in file!");
        }
        var common_area_dropdown = "<div class=\"dropdown\"> \
            <button type=\"button\" class=\"dropdown-toggle btn btn-light\" data-bs-toggle=\"dropdown-content\"> \
             Common Area Title \
            </button> \
                <div class=\"dropdown-content w-full max-w-56 py-2\"> \
                    <div class=\"menu menu-default flex flex-col w-full\">";
        arr_common_area.forEach(function (unit){
            common_area_dropdown += "<div class=\"menu-item checkbox-common-area\" id=\"common_area_" + unit.title + "\"><input type=\"checkbox\" class=\"menu-link common-area\" checked \><span>" + unit.title + "</span></div>";
            unit.status = 1;
        })
        common_area_dropdown += "<div class=\"menu-item checkbox-common-area\"><a class=\"btn common-area btn-sm btn-info btn-ctt-submit\" onclick=\"LoadTableCommonArea();\">Generate</a></div></div> \
            </div> \
                </div>";
        $('.common-area-select').append(common_area_dropdown);
    };
    console.table(arr_common_area);

}

$(document).on("click", ".dropdown-toggle", function() {
    $(this).next(".dropdown-content").toggle();
})

$(document).on("click", ".checkbox-common-area", function() {
    var checkbox = $(this).find("input.menu-link.common-area");
    if(!checkbox.prop("checked")) {
        var common_area_title = $(this).attr("id");
        checkbox.prop("checked", true);
        arr_common_area_title = common_area_title.split("_");
        common_area_title = arr_common_area_title[2];
        arr_common_area_ori.forEach(function(unit) {
            if(unit.title == common_area_title) {
                unit.status = 1;
            }
        })
    }
    else {
        var common_area_title = $(this).attr("id");
        checkbox.prop("checked", false);
        arr_common_area_title = common_area_title.split("_");
        common_area_title = arr_common_area_title[2];
        arr_common_area_ori.forEach(function(unit) {
            if(unit.title == common_area_title) {
                unit.status = 0;
            }
        })
    }
    console.table(arr_common_area);
})

function LoadTableCommonArea() {
    $("#kt_job_4_2").find(".table-responsive").empty();
    $(".dropdown-toggle").next(".dropdown-content").hide();
    arr_common_area = Array.from(arr_common_area_ori);
    var arr_table_title = [];
    var max_title = 0;
    var max_level = $('#common_area_max_level').val();
    var common_area_table_header = "<tr><th>Level</th>";
    arr_common_area_ori.forEach(function(unit) {
        if(!(arr_table_title.includes(unit.title))) {
            max_title++;
            arr_table_title.push(unit.title);
            common_area_table_header += "<th>" + unit.title + "</th>";
        }
        unit.floor_level = 1;
    })
    common_area_table_header += "</tr></thead><tbody>";
    var common_area_table = "<div class=\"table-responsive mb-5\"> \
        <table id=\"table_type\" class=\"table table-striped table-bordered table-hover gy-5 gs-7 dataTable no-footer\"> \
            <thead>";
    var start_level = arr_common_area[0].floor_level;
    common_area_table += common_area_table_header;
    common_area_table += "<tr><td>1</td>";
    arr_common_area_ori.forEach(function(unit){
        if(unit.floor_level == 1) {
            var common_area_status = unit.status == 1 ? " green" : " red";
            common_area_table += "<td><div class=\"d-flex justify-content-center align-items-center\"><span class=\"status-indicator-type" + common_area_status + "\" id=\"status-icon-type-1-" + unit.title + "\"></span></div>";
        }
    })
    common_area_table += "</tr>";
    for(level_count = 1; level_count < max_level; level_count++) {
        var level = level_count + 1;
        common_area_table += "<tr><td>" + level + "</td>";
        for(title_count = 0; title_count < max_title; title_count++) {
            var common_area_status = arr_common_area[title_count].status == 1 ? " green" : " red";
            common_area_table += "<td><div class=\"d-flex justify-content-center align-items-center\"><span class=\"status-indicator-type" + common_area_status + "\" id=\"status-icon-type-1-" + arr_common_area[title_count].title + "\"></span></div>";
            arr_common_area.push({
                floor_level: level,
                title: arr_common_area[title_count].title,
                status: arr_common_area[title_count].status
            });
        }
        common_area_table += "</tr>";
    }
    common_area_table += "</tbody></table>";
    $('#common_area_row').after(common_area_table);
    console.table(arr_common_area);
}

function LoadTableTypeCol(arr_unit_type) {
    var type_table = "<td data-title\"title\"></td>";
    var type_col = 0;
    for(unit_count = 0; unit_count < arr_unit_type.length; unit_count++) {
        type_table += "<td data-title=\"" + arr_unit_type[unit_count].name + "\">" + arr_unit_type[unit_count].name + "</td>";
    }
    type_table += "</tr></thead> \
        <tbody> \
           <tr>  \
    ";
    type_table += "<tr><td><input type=\"text\" class=\"form-control type-input\" id=\"type_row_1\" placeholder=\"Enter Type title\" \></td>";
    for(unit_count = 0; unit_count < arr_unit_type.length; unit_count++) {
        type_table += "<td><div class=\"d-flex justify-content-center align-items-center\"><span class=\"status-indicator-type green\" id=\"status-icon-type-1-" + arr_unit_type[unit_count].name + "\"></span></div></td>";
    }
    type_table += "</tr></tbody></table>";
    return type_table;
}

function LoadTableTypeRow() {
    var row = $("#table_type tbody tr");
    var lowest_row = row.length -1;
    var next_row = parseInt(lowest_row) + 1;
    var type_row = "<tr><td><input type=\"text\" class=\"form-control type-input\" id=\"type_row_" + next_row + "\"  placeholder=\"Enter Type title\" \></td>";
    arr_type_ori.forEach(function(unit) {
        type_row += "<td><div class=\"d-flex justify-content-center align-items-center\"><span class=\"status-indicator-type green\" id=\"status-icon-type-" + next_row + "-" + unit.name + "\"></span></div></td>";
        arr_unit_type.push({
            type_id: next_row,
            name: unit.name,
            status: 1
        });
    })
    type_row += "</tr>";
    var last_row_current = $("#table_type tbody");
    last_row_current.append(type_row);
    console.table(arr_unit_type);
}

$(document).on("click", ".status-indicator-type", function(e) {
    var span_id = $(this).attr("id");
    var span    = span_id.split("-");
    var name    = span[4];
    var type_id = parseInt(span[3]);
    if($(this).hasClass("green")) {
        $(this).removeClass('green').addClass('red');
        arr_unit_type.forEach(function(unit) {
            if(unit.type_id == type_id && unit.name == name) {
                unit.status = 0;
            }
        })
    }
    else {
        $(this).removeClass('red').addClass('green');
        arr_unit_type.forEach(function(unit) {
            if(unit.type_id == type_id && unit.name == name) {
                unit.status = 1;
            }
        })
    }
    console.table(arr_unit_type);
})

$(document).on("focusout", ".type-input", function(e) {
    var arr_type_title = [];
    var type_title = $(this).val();
    var div_input = $(this).attr("id");
    var input_name = div_input.split("_");
    var type_id = input_name[2];
    var type_select = "<select class=\"form-control select\" id=\"block_unit_type\">";
    arr_unit_type.forEach(function(unit){
        if(unit.type_id == type_id) {
            unit.title = type_title;
        }
        if(!(arr_type_title.includes(unit.title))) {
            type_select += "<option value=\"" + unit.type_id + "\">" + unit.title + "</option>";
            arr_type_title.push(unit.title);
        }
    })
        type_select += "</select>";
    $("#block_unit_type").remove();
    $("#project_unit_type_table").append(type_select);
    console.table(arr_unit_type);
})

$(document).on("change", ".block_unit_select", function(e) {
    var arr_unit_block = [];
    var max_level = 0;
    var max_unit = 0;
    arr_units.forEach(function(unit) {
        if(unit.floor_level > max_level) {
            max_level = unit.floor_level;
        }
        if(unit.unit_number > max_unit) {
            max_unit = unit.unit_number;
        }
        if(unit.block == active_block) {
            arr_unit_block.push({
                prefix: unit.prefix,
                floor_level: unit.floor_level,
                unit_number: unit.unit_number,
                unit_name: unit.unit_name,
                unit_status: unit.unit_status,
                block: unit.block
            })
        }
    })
    $(".table-responsive").remove();
    var table_type_unit = "<div class=\"table-responsive mb-5\"> \
        <table id=\"table_project_unit_type\" class=\"table table-striped table-bordered table-hover gy-5 gs-7 dataTable no-footer\"> \
            <thead> \
                <th></th>";
    for(type_unit_count = 0; type_unit_count < max_unit; type_unit_count++) {
        var unit_header_count = type_unit_count + 1;
        table_type_unit += "<th>Unit " + unit_header_count + "</th>";
    }
    table_type_unit += "</thead><tbody>";
    arr_unit_block.forEach(function(unit) {
        unit.unit_name = unit.unit_name.replace(/-/g, "&#8209;");
        unit.unit_number == 1 ? table_type_unit += "<tr><td>Level " + unit.floor_level+ "</td>" : table_type_unit += "";
        if(unit.unit_status == 1) {
            table_type_unit += "<td><div class=\"d-flex justify-content-center align-items-center\"><span class=\"status-indicator-type green\" id=\"status-icon-type-" + unit.unit_name + "-" + unit.floor_level + "-" + unit.unit_number + "\">" + unit.unit_name + "</span></div></td>";
        }
        else {
            table_type_unit += "<td><div class=\"d-flex justify-content-center align-items-center\"><span class=\"status-indicator-type red\" id=\"status-icon-type-" + unit.unit_name + "-" + unit.floor_level + "-" + unit.unit_number + "\">" + unit.unit_name + "</span></div></td>";
        }
        unit.unit_number == max_unit ? table_type_unit += "</tr>" : table_type_unit += "";
    })
    table_type_unit += "</tbody></table></div>";
    $("#project_unit_type_table").after(table_type_unit);
})

$("#btn-next").on("click", function(e) {
    var active_tab = document.querySelector(".nav-link.active");
    var next_tab = active_tab.closest("li").nextElementSibling?.querySelector(".nav-link.active");
    if (next_tab) {
        var next_tab_content = new bootstrap.Tab(next_tab);
        next_tab_content.show();
    }
})

$("#table_project").DataTable({
	"dom":
	"<'row mb-2'" +
	"<'col-sm-6 w-50 d-flex align-items-center justify-content-start dt-toolbar'l>" +
	"<'col-sm-6 w-50 d-flex align-items-center justify-content-end dt-toolbar'f <'filter'> >" +
	">" +

	"<'table-responsive'tr>" +

	"<'row'" +
	"<'col-sm-12 col-md-5 d-flex align-items-center justify-content-center justify-content-md-start'i>" +
	"<'col-sm-12 col-md-7 d-flex align-items-center justify-content-center justify-content-md-end'p>" +
	">",
	buttons: [
		{
			extend: 'excel',
			split: ['pdf', 'csv']
		}
	],
	order: [[0, 'asc']],
	columnDefs: [{
		className: "dt-center align-middle", 
		targets: '_all',
		width: '150px',
	},
	],
});
