$(function() {

	var json = $.parseJSON($('#primary_column_type_info').html());
	$('#advance_search_table').data('table_structure', json);
	AdminData.advanceSearch.buildFirstRow();

	if ($('#association_mapping_info').length > 0) {
		json = $.parseJSON($('#association_mapping_info').html());
		$('#advance_search_table').data('association_mapping_info', json);
	}

});

